IF COL_LENGTH('dbo.hrm_Holidays', 'RejectedUserId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD RejectedUserId UNIQUEIDENTIFIER  NULL;
END
