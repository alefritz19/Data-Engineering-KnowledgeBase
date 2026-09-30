-- ============================================================================
-- Назначение: Шаблон надежной хранимой процедуры с транзакцией и перехватом ошибок
-- Контекст:   T-SQL / Stored Procedure / ACID Transactions
-- Автор:      Alexander Fritzler
-- ============================================================================

CREATE OR ALTER PROCEDURE dbo.usp_UpsertCustomer
    @CustomerCode NVARCHAR(50),
    @FullName     NVARCHAR(150),
    @Email        NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON; -- Автоматический откат при критических сбоях

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Обновление существующей записи или вставка новой (Upsert)
        IF EXISTS (SELECT 1 FROM dbo.DimCustomer WHERE CustomerCode = @CustomerCode)
        BEGIN
            UPDATE dbo.DimCustomer
            SET FullName = @FullName,
                Email = @Email
            WHERE CustomerCode = @CustomerCode;
        END
        ELSE
        BEGIN
            INSERT INTO dbo.DimCustomer (CustomerCode, FullName, Email)
            VALUES (@CustomerCode, @FullName, @Email);
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Проброс ошибки вызывающему приложению / пайплайну
        THROW;
    END CATCH
END;
