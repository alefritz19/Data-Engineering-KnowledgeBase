// ==============================================================================
// Zweck:    Analytischer Kalendergenerator in Power Query (M)
// Kontext:  Power Query (M) / Date Dimension
// Autor:    Alexander Fritzler
// ==============================================================================

let
    // 1. Parameter definieren
    StartDate = #date(2024, 1, 1),
    EndDate = #date(2026, 12, 31),
    DayCount = Duration.Days(Duration.From(EndDate - StartDate)) + 1,

    // 2. Fortlaufende Datumsliste generieren
    DateList = List.Dates(StartDate, DayCount, #duration(1, 0, 0, 0)),
    TableFromList = Table.FromList(DateList, Splitter.SplitByNothing(), {"Datum"}, null, ExtraValues.Error),
    SetDateType = Table.TransformColumnTypes(TableFromList, {{"Datum", type date}}),

    // 3. Kalenderattribute berechnen (Jahr, Quartal, Monat, Wochentag)
    AddYear = Table.AddColumn(SetDateType, "Jahr", each Date.Year([Datum]), Int64.Type),
    AddQuarter = Table.AddColumn(AddYear, "Quartal", each "Q" & Text.From(Date.QuarterOfYear([Datum])), type text),
    AddMonthNum = Table.AddColumn(AddQuarter, "MonatNummer", each Date.Month([Datum]), Int64.Type),
    AddMonthName = Table.AddColumn(AddMonthNum, "MonatName", each Date.MonthName([Datum], "de-DE"), type text),
    AddYearMonthKey = Table.AddColumn(AddMonthName, "JahrMonatKey", each Date.Year([Datum]) * 100 + Date.Month([Datum]), Int64.Type),
    AddDayOfWeek = Table.AddColumn(AddYearMonthKey, "Wochentag", each Date.DayOfWeekName([Datum], "de-DE"), type text),
    AddIsWeekend = Table.AddColumn(AddDayOfWeek, "IstWochenende", each if Date.DayOfWeek([Datum], Day.Monday) >= 5 then true else false, type logical)
in
    AddIsWeekend
