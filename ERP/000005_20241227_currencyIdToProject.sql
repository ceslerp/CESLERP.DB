-- Check if the CurrencyId column already exists in the cmn_Project table
IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'cmn_Project'
      AND COLUMN_NAME = 'CurrencyId'
)
BEGIN
    -- Add the CurrencyId column
    ALTER TABLE [dbo].[cmn_Project]
    ADD [CurrencyId] [uniqueidentifier] NULL;

    PRINT 'Column CurrencyId added to cmn_Project table.';
END
ELSE
BEGIN
    PRINT 'Column CurrencyId already exists in cmn_Project table.';
END

-- Add a foreign key constraint only if it doesn't already exist
IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
    WHERE CONSTRAINT_NAME = 'FK_cmn_Project_cmn_Currency'
)
BEGIN
    -- Add the foreign key constraint
    ALTER TABLE [dbo].[cmn_Project]
    ADD CONSTRAINT [FK_cmn_Project_cmn_Currency]
    FOREIGN KEY ([CurrencyId])
    REFERENCES [dbo].[cmn_Currency]([CurrencyId]);

    PRINT 'Foreign key constraint added between cmn_Project and cmn_Currency.';
END
ELSE
BEGIN
    PRINT 'Foreign key constraint already exists between cmn_Project and cmn_Currency.';
END
