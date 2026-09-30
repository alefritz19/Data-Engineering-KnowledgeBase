// ============================================================================
// Назначение: Генератор аналитического календаря на языке Power Query (M)
// Контекст:   Power Query (M) / Date Dimension
// Автор:      Alexander Fritzler
// ============================================================================

let
    StartDate = #date(2022, 1, 1),
    EndDate = #date(2026, 12, 31),
    DayCount = Duration.Days(Duration.From(EndDate - StartDate)) + 1,
    DateList = List.Dates(StartDate, DayCount, #duration(1, 0, 0, 0)),
    TableFromList = Table.FromList(DateList, Splitter.SplitByNothing(), {"Date"}, null, ExtraValues.Error),
    SetDateType = Table.TransformColumnTypes(TableFromList, {{"Date", type date}}),
    AddYear = Table.AddColumn(SetDateType, "Year", each Date.Year([Date]), Int64.Type),
    AddQuarter = Table.AddColumn(AddYear, "Quarter", each "Q" & Text.From(Date.QuarterOfYear([Date])), type text),
    AddMonthNum = Table.AddColumn(AddQuarter, "MonthNum", each Date.Month([Date]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonthNum, "MonthName", each Date.ToText([Date], "MMMM", "ru-RU"), type text),
    AddYearMonth = Table.AddColumn(AddMonthName, "YearMonth", each Date.ToText([Date], "yyyy-MM"), type text),
    AddDayOfWeek = Table.AddColumn(AddYearMonth, "DayOfWeek", each Date.DayOfWeekName([Date], "ru-RU"), type text),
    AddIsWeekend = Table.AddColumn(AddDayOfWeek, "IsWeekend", each if Date.DayOfWeek([Date], Day.Monday) >= 5 then 1 else 0, Int64.Type)
in
    AddIsWeekend
