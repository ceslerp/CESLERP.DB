IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'hrm_LeaveApplication'
      AND COLUMN_NAME = 'IsSiteEmployee'
)
BEGIN
    ALTER TABLE [dbo].[hrm_LeaveApplication]
    ADD [IsSiteEmployee] [bit] NULL;
END
