IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'prc_SupplierVersion'
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'Country'
)
BEGIN
    -- Add the Country column
    ALTER TABLE [dbo].[prc_SupplierVersion]
    ADD [Country] UNIQUEIDENTIFIER NULL;

    -- Optionally, add a foreign key constraint if required
    IF NOT EXISTS (
        SELECT 1
        FROM sys.foreign_keys
        WHERE name = 'FK_prc_SupplierVersion_Country'
    )
    BEGIN
        ALTER TABLE [dbo].[prc_SupplierVersion]
        ADD CONSTRAINT [FK_prc_SupplierVersion_Country]
        FOREIGN KEY ([Country]) REFERENCES [cmn_Country] ([CountryId]);
    END;

    PRINT 'Country column added to prc_SupplierVersion table.';
END
ELSE
BEGIN
    PRINT 'Country column already exists in prc_SupplierVersion table.';
END;
