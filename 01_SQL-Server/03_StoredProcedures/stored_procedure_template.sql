-- ==============================================================================
-- Zweck:    Vorlage für robuste Stored Procedure mit Transaktion & Fehlerbehandlung
-- Kontext:  T-SQL / Stored Procedure / ACID Transactions
-- Autor:    Alexander Fritzler
-- ==============================================================================

CREATE OR ALTER PROCEDURE dbo.usp_UpsertCustomer
    @CustomerCode NVARCHAR(20),
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; -- Automatischer Rollback bei kritischen Laufzeitfehlern

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Bestehenden Datensatz aktualisieren oder neuen einfügen (Upsert)
        IF EXISTS (SELECT 1 FROM dbo.Dim_Customer WHERE CustomerCode = @CustomerCode)
        BEGIN
            UPDATE dbo.Dim_Customer
            SET FirstName = @FirstName,
                LastName = @LastName,
                Email = @Email
            WHERE CustomerCode = @CustomerCode;
        END
        ELSE
        BEGIN
            INSERT INTO dbo.Dim_Customer (CustomerCode, FirstName, LastName, Email)
            VALUES (@CustomerCode, @FirstName, @LastName, @Email);
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Fehler an aufrufende Anwendung / Pipeline weiterleiten
        THROW;
    END CATCH
END;
GO
