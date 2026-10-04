# Best Practices für die analytische Datenmodellierung (Star Schema)

**Autor:** Alexander Fritzler  
**Kontext:** Power BI Datenmodellierung & VertiPaq-Engine Optimierung

---

## 1. Das Sternschema (Star Schema)

Das Sternschema ist der Goldstandard für performante Power BI Berichte und Direct Lake Semantikmodelle.

* **Faktentabelle (Fact):** Steht im Zentrum des Modells. Enthält numerische Geschäftskennzahlen (`SalesAmount`, `Quantity`, `Discount`) und Fremdschlüssel (`CustomerID`, `ProductID`, `DateKey`). Schmal und lang (Millionen bis Milliarden Zeilen).
* **Dimensionstabellen (Dimensions):** Umgeben die Fakten. Enthalten textuelle Attribute zum Filtern, Schneiden und Gruppieren (`CustomerName`, `Category`, `Region`). Breit und kurz.

---

## 2. Goldene Regeln für Beziehungen in Power BI

### 1. Kardinalität ausschließlich 1:* (Eins-zu-Viele):
* Auf Seiten der Dimension steht immer `1` (eindeutiger Primärschlüssel).
* Auf Seiten der Faktentabelle steht immer `*` (Fremdschlüssel / Viele).
* **Vermeide Beziehungen mit `* : *` (Viele-zu-Viele)**, da diese unvorhersehbare Filterkontexte und Performance-Verluste erzeugen.

### 2. Filterrichtung (Cross-filter direction):
* Immer **Single (Einfach)**: Die Dimension filtert die Faktentabelle.
* Vermeide **Both (Beidseitig)**, außer in seltenen, kontrollierten M2M-Bridge-Szenarien.

### 3. Ausblenden von Fremdschlüsseln in der Faktentabelle:
* Alle Fremdschlüssel (`CustomerID`, `ProductID`) in der Faktentabelle sollten **in der Berichtsansicht ausgeblendet werden** (*Hide in report view*).
* Endanwender dürfen Attribute ausschließlich aus den Dimensionstabellen auswählen.

---

## 3. Datumstabelle (Date Dimension) Anforderungen

1. Vollständige Tage ohne Lücken über den gesamten Geschäftszeitraum.
2. Als **Datumstabelle markieren** (*Mark as Date Table*).
3. Mindestens eine Spalte vom Datentyp `Date`.
