IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'pm_ProjectCodeRequest'
      AND COLUMN_NAME = 'AuthorizedCEO'
)
BEGIN
    ALTER TABLE [dbo].[pm_ProjectCodeRequest]
    ADD [AuthorizedCEO] [uniqueidentifier] NULL;

    PRINT 'Column AuthorizedCEO added to pm_ProjectCodeRequest table.';
END
ELSE
BEGIN
    PRINT 'Column AuthorizedCEO already exists in pm_ProjectCodeRequest table.';
END
GO