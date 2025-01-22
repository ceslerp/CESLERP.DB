IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'pm_BusinessSegment'
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'CountryId'
)
BEGIN
    -- Add the CountryId column
    ALTER TABLE [dbo].[pm_BusinessSegment]
    ADD [Country] UNIQUEIDENTIFIER NULL;

    -- Optionally, add a foreign key constraint if required
    IF NOT EXISTS (
        SELECT 1
        FROM sys.foreign_keys
        WHERE name = 'FK_pm_BusinessSegment_Country'
    )
    BEGIN
        ALTER TABLE [dbo].[pm_BusinessSegment]
        ADD CONSTRAINT [FK_pm_BusinessSegment_Country]
        FOREIGN KEY ([Country]) REFERENCES [cmn_Country] ([CountryId]);
    END;

    PRINT 'Country column added to pm_BusinessSegment table.';
END
ELSE
BEGIN
    PRINT 'Country column already exists in pm_BusinessSegment table.';
END;