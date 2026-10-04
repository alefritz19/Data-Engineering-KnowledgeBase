-- ==============================================================================
-- Zweck:    Analytische Fensterfunktionen (Gleitender Durchschnitt, Kumulierte Summe, Dedup via CTE)
-- Kontext:  T-SQL / DQL / Window Functions
-- Autor:    Alexander Fritzler
-- ==============================================================================

-- 1. Berechnung des gleitenden 3-Perioden-Durchschnitts (2 vorherige + aktuelle Zeile)
SELECT 
    CustomerID,
    OrderDate,
    TotalAmount,
    AVG(TotalAmount) OVER (
        PARTITION BY CustomerID 
        ORDER BY OrderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_3Orders,
    
    -- Kumulierte Summe seit Beginn der Kundenhistorie
    SUM(TotalAmount) OVER (
        PARTITION BY CustomerID 
        ORDER BY OrderDate 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS CumulativeTotal
FROM dbo.Orders;

-- 2. Deduplizierung von Datensätzen mittels CTE und ROW_NUMBER()
WITH RankedOrders AS (
    SELECT 
        OrderID,
        CustomerID,
        OrderDate,
        TotalAmount,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID 
            ORDER BY OrderDate DESC, OrderID DESC
        ) AS RowNum
    FROM dbo.Orders
)
-- Behalte nur die jeweils jüngste Transaktion pro Kunde
SELECT 
    OrderID,
    CustomerID,
    OrderDate,
    TotalAmount
FROM RankedOrders
WHERE RowNum = 1;
