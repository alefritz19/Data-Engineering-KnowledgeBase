-- ==============================================================================
-- Zweck:    Cross-Database Abfragen zwischen Warehouse und Lakehouse, CTAS & Stored Procedure
-- Kontext:  Microsoft Fabric Warehouse / T-SQL
-- Autor:    Alexander Fritzler
-- ==============================================================================

-- 1. Erstellung einer physischen Tabelle im Warehouse via CTAS (Create Table As Select)
IF OBJECT_ID('dbo.Holiday_Aggregates', 'U') IS NOT NULL
    DROP TABLE dbo.Holiday_Aggregates;
GO

CREATE TABLE dbo.Holiday_Aggregates AS
SELECT 
    CountryCode,
    YEAR(HolidayDate) AS HolidayYear,
    COUNT(*) AS TotalHolidays,
    SUM(CASE WHEN IsNational = 1 THEN 1 ELSE 0 END) AS NationalHolidays
FROM [lh_silver].[dbo].[dim_holidays]
GROUP BY CountryCode, YEAR(HolidayDate);
GO

-- 2. Stored Procedure zur regelmäßigen Aktualisierung des Datamarts via Data Pipeline
CREATE OR ALTER PROCEDURE dbo.usp_Refresh_Holiday_Summary
AS
BEGIN
    SET NOCOUNT ON;
    
    TRUNCATE TABLE dbo.Holiday_Aggregates;
    
    INSERT INTO dbo.Holiday_Aggregates
    SELECT 
        CountryCode,
        YEAR(HolidayDate) AS HolidayYear,
        COUNT(*) AS TotalHolidays,
        SUM(CASE WHEN IsNational = 1 THEN 1 ELSE 0 END) AS NationalHolidays
    FROM [lh_silver].[dbo].[dim_holidays]
    GROUP BY CountryCode, YEAR(HolidayDate);
END;
GO
