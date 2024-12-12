IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'cmn_Project'
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'CountryId'
)
BEGIN
    -- Add the CountryId column
    ALTER TABLE [dbo].[cmn_Project]
    ADD [Country] UNIQUEIDENTIFIER NULL;

    -- Optionally, add a foreign key constraint if required
    IF NOT EXISTS (
        SELECT 1
        FROM sys.foreign_keys
        WHERE name = 'FK_cmn_Project_Country'
    )
    BEGIN
        ALTER TABLE [dbo].[cmn_Project]
        ADD CONSTRAINT [FK_cmn_Project_Country]
        FOREIGN KEY ([Country]) REFERENCES [cmn_Country] ([CountryId]);
    END;

    PRINT 'Country column added to cmn_Project table.';
END
ELSE
BEGIN
    PRINT 'Country column already exists in cmn_Project table.';
END;