IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'prc_SupplierTransactionDetail'
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'CountryId'
)
BEGIN
    -- Add the CountryId column
    ALTER TABLE [dbo].[prc_SupplierTransactionDetail]
    ADD [Country] UNIQUEIDENTIFIER NULL;

    -- Optionally, add a foreign key constraint if required
    IF NOT EXISTS (
        SELECT 1
        FROM sys.foreign_keys
        WHERE name = 'FK_prc_SupplierTransactionDetail_Country'
    )
    BEGIN
        ALTER TABLE [dbo].[prc_SupplierTransactionDetail]
        ADD CONSTRAINT [FK_prc_SupplierTransactionDetail_Country]
        FOREIGN KEY ([Country]) REFERENCES [cmn_Country] ([CountryId]);
    END;

    PRINT 'Country column added to prc_SupplierTransactionDetail table.';
END
ELSE
BEGIN
    PRINT 'Country column already exists in prc_SupplierTransactionDetail table.';
END;