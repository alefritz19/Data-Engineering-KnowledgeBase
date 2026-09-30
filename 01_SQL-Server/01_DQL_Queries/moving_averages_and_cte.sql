-- ============================================================================
-- Назначение: Аналитические оконные функции (Скользящее среднее, Накопительный итог, Дедупликация через CTE)
-- Контекст:   T-SQL / DQL / Window Functions
-- Автор:      Alexander Fritzler
-- ============================================================================

-- 1. Расчет скользящего среднего за 3 периода (2 предыдущих + текущий)
SELECT 
    OrderID,
    OrderDate,
    CustomerID,
    TotalAmount,
    AVG(TotalAmount) OVER (
        PARTITION BY CustomerID 
        ORDER BY OrderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_3Orders,
    
    -- Накопительный итог с начала истории клиента
    SUM(TotalAmount) OVER (
        PARTITION BY CustomerID 
        ORDER BY OrderDate 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM dbo.Orders;


-- 2. Дедупликация строк с помощью CTE и ROW_NUMBER()
-- Оставляем только самую последнюю транзакцию по каждому клиенту
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
SELECT 
    OrderID,
    CustomerID,
    OrderDate,
    TotalAmount
FROM RankedOrders
WHERE RowNum = 1;
