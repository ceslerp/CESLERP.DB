BEGIN TRY
    -- Check if the column does not exist
    IF NOT EXISTS (
        SELECT 1 
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = 'hrm_Province' AND COLUMN_NAME = 'CountryId'
    )
    BEGIN
        -- Add the CountryId column (initially allowing NULL values)
        ALTER TABLE [dbo].[hrm_Province]
        ADD [CountryId] UNIQUEIDENTIFIER NULL;

        -- Assign the default value to existing rows
        EXEC('
            UPDATE [dbo].[hrm_Province]
            SET [CountryId] = ''11111111-1111-1111-1111-111111111111''
        ');

        -- Alter the column to make it NOT NULL
        ALTER TABLE [dbo].[hrm_Province]
        ALTER COLUMN [CountryId] UNIQUEIDENTIFIER NOT NULL;

        PRINT 'CountryId column added successfully.';
    END
    ELSE
    BEGIN
        PRINT 'CountryId column already exists.';
    END
END TRY
BEGIN CATCH
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;
