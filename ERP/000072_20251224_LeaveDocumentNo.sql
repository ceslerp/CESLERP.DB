IF COL_LENGTH('dbo.hrm_LeaveApplication', 'LeaveDocumentNo') IS NULL
BEGIN
    ALTER TABLE [dbo].[hrm_LeaveApplication]
    ADD [LeaveDocumentNo] NVARCHAR(50) NULL;
END
