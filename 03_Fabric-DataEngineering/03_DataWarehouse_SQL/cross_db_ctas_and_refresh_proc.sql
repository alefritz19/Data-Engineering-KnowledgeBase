-- ============================================================================
-- Назначение: Кросс-запросы между Warehouse и Lakehouse, CTAS и Stored Procedure
-- Контекст:   Microsoft Fabric Warehouse / T-SQL
-- Автор:      Alexander Fritzler
-- ============================================================================

-- 1. Создание физической таблицы в Warehouse через CTAS (Create Table As Select)
IF OBJECT_ID('dbo.Country_Holiday_Summary', 'U') IS NOT NULL
    DROP TABLE dbo.Country_Holiday_Summary;

CREATE TABLE dbo.Country_Holiday_Summary
AS
SELECT 
    CountryCode,
    CountryName,
    COUNT(*) AS TotalHolidays,
    SUM(CAST(IsPaid AS INT)) AS PaidHolidays,
    MIN(HolidayDate) AS FirstDate,
    MAX(HolidayDate) AS LastDate
FROM [lh_silver].[dbo].[dim_holidays]
GROUP BY CountryCode, CountryName;


-- 2. Хранимая процедура для регулярного обновления витрины через Data Pipeline
CREATE OR ALTER PROCEDURE dbo.usp_Refresh_Holiday_Summary
AS
BEGIN
    SET NOCOUNT ON;
    
    TRUNCATE TABLE dbo.Country_Holiday_Summary;

    INSERT INTO dbo.Country_Holiday_Summary
    SELECT 
        CountryCode,
        CountryName,
        COUNT(*) AS TotalHolidays,
        SUM(CAST(IsPaid AS INT)) AS PaidHolidays,
        MIN(HolidayDate) AS FirstDate,
        MAX(HolidayDate) AS LastDate
    FROM [lh_silver].[dbo].[dim_holidays]
    GROUP BY CountryCode, CountryName;
END;
