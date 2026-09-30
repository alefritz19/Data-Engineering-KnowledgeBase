# Паттерн инкрементальной загрузки данных (Watermark / Delta Load)

## 1. Концепция
Вместо ежедневной тяжелой перезаписи миллионов строк используется контрольная метка (**Watermark**) — колонка `ModifiedDate` или инкрементальный `ID`.

```
[Источник SQL / API] ──( WHERE ModifiedDate > LastWatermark )──► [Copy Activity] ──► [OneLake Bronze]
```

## 2. Архитектура пайплайна (Data Factory Pipeline)
1. **Activity 1 (Lookup):** Считывает значение `LastWatermark` из контрольной таблицы `dbo.WatermarkControl`.
2. **Activity 2 (Lookup):** Считывает текущее максимальное значение `MAX(ModifiedDate)` из источника (`NewWatermark`).
3. **Activity 3 (Copy Activity):**
   * Source Query:
     ```sql
     SELECT * FROM SourceTable 
     WHERE ModifiedDate > '@{activity('LookupOldWatermark').output.firstRow.LastWatermark}' 
       AND ModifiedDate <= '@{activity('LookupNewWatermark').output.firstRow.NewWatermark}'
     ```
   * Destination: `lh_bronze` (формат Delta, Append mode).
4. **Activity 4 (Script / Stored Procedure):** На событии *On Success* обновляет контрольную таблицу:
   ```sql
   UPDATE dbo.WatermarkControl SET LastWatermark = '@{activity('LookupNewWatermark').output.firstRow.NewWatermark}';
   ```
