# Inkrementelles Datenlademuster (Watermark / Delta Load)

**Autor:** Alexander Fritzler  
**Kontext:** Microsoft Fabric Data Factory Pipelines & Ingestion

---

## 1. Konzept

Statt täglich ressourcenintensiv Millionen von Zeilen komplett neu zu laden (Full Load), wird eine Kontrollmarke (**Watermark**) verwendet — typischerweise eine Spalte `ModifiedDate` oder eine fortlaufende `ID`.

```
[Quelle: SQL Server / REST API] ──( WHERE ModifiedDate > LastWatermark )──► [Copy Activity] ──► [OneLake Bronze]
```

---

## 2. Pipeline-Architektur (Data Factory Pipeline)

1. **Aktivität 1 (Lookup):** Liest den Wert `LastWatermark` aus der Kontrolltabelle `dbo.WatermarkControl` aus.
2. **Aktivität 2 (Lookup):** Ermittelt den aktuellen Höchstwert `MAX(ModifiedDate)` aus dem Quellsystem (`NewWatermark`).
3. **Aktivität 3 (Copy Data):**
   * Source Query:
     ```sql
     SELECT * FROM SourceTable 
     WHERE ModifiedDate > '@{activity('LookupLastWatermark').output.firstRow.LastWatermark}' 
       AND ModifiedDate <= '@{activity('LookupNewWatermark').output.firstRow.NewWatermark}'
     ```
   * Destination: `lh_bronze` (Delta-Format, Append Modus).
4. **Aktivität 4 (Script / Stored Procedure):** Bei erfolgreicher Ausführung (*On Success*) wird die Kontrolltabelle aktualisiert:
   ```sql
   UPDATE dbo.WatermarkControl 
   SET LastWatermark = '@{activity('LookupNewWatermark').output.firstRow.NewWatermark}'
   WHERE TableName = 'SourceTable';
   ```

---

## 3. Vorteile für Enterprise-Betrieb

* Drastische Reduzierung der Netzwerklast und Ausführungszeit.
* Schonung der operativen Quellsysteme (OLTP).
* Zuverlässige Wiederaufsetzbarkeit bei Verbindungsunterbrechungen.
