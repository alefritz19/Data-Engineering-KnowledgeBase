-- ============================================================================
-- Назначение: Шаблон DDL: Реляционная таблица с ключами, индексами и VIEW
-- Контекст:   T-SQL / DDL
-- Автор:      Alexander Fritzler
-- ============================================================================

-- 1. Таблица измерений
CREATE TABLE dbo.DimCustomer (
    CustomerID INT IDENTITY(1,1) NOT NULL,
    CustomerCode NVARCHAR(50) NOT NULL,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(100) NULL,
    IsActive BIT NOT NULL DEFAULT (1),
    CreatedDate DATETIME2(3) NOT NULL DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT PK_DimCustomer PRIMARY KEY CLUSTERED (CustomerID),
    CONSTRAINT UQ_DimCustomer_Code UNIQUE (CustomerCode)
);

-- 2. Некластеризованный индекс для ускорения поиска по Email
CREATE NONCLUSTERED INDEX IX_DimCustomer_Email 
ON dbo.DimCustomer (Email)
WHERE Email IS NOT NULL;

-- 3. Аналитическое представление (VIEW)
CREATE OR ALTER VIEW dbo.vw_ActiveCustomers
AS
SELECT 
    CustomerID,
    CustomerCode,
    FullName,
    Email
FROM dbo.DimCustomer
WHERE IsActive = 1;
