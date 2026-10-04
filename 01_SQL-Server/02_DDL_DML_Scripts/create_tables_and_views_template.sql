-- ==============================================================================
-- Zweck:    DDL-Vorlage: Relationale Tabelle mit Schlüsseln, Indizes und VIEW
-- Kontext:  T-SQL / DDL
-- Autor:    Alexander Fritzler
-- ==============================================================================

-- 1. Dimensionstabelle
IF OBJECT_ID('dbo.Dim_Customer', 'U') IS NOT NULL
    DROP TABLE dbo.Dim_Customer;
GO

CREATE TABLE dbo.Dim_Customer (
    CustomerID INT IDENTITY(1,1) NOT NULL,
    CustomerCode NVARCHAR(20) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Dim_Customer_IsActive DEFAULT (1),
    CreatedDate DATETIME2(0) NOT NULL CONSTRAINT DF_Dim_Customer_CreatedDate DEFAULT (SYSUTCDATETIME()),
    
    CONSTRAINT PK_Dim_Customer PRIMARY KEY CLUSTERED (CustomerID),
    CONSTRAINT UQ_Dim_Customer_Code UNIQUE (CustomerCode)
);
GO

-- 2. Non-Clustered Index zur Beschleunigung der Suche nach E-Mail
CREATE NONCLUSTERED INDEX IX_Dim_Customer_Email
ON dbo.Dim_Customer (Email)
WHERE Email IS NOT NULL;
GO

-- 3. Analytische View (VIEW)
CREATE OR ALTER VIEW dbo.vw_ActiveCustomers
AS
SELECT 
    CustomerID,
    CustomerCode,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Email,
    CreatedDate
FROM dbo.Dim_Customer
WHERE IsActive = 1;
GO
