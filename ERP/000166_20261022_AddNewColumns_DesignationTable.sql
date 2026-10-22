USE [ERP];
GO

IF COL_LENGTH('dbo.hrm_Designation', 'IssueNo') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Designation
    ADD IssueNo NVARCHAR(50) NULL;
END

IF COL_LENGTH('dbo.hrm_Designation', 'IssueDate') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Designation
    ADD IssueDate DATE NULL;
END

IF COL_LENGTH('dbo.hrm_Designation', 'DocRef') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Designation
    ADD DocRef NVARCHAR(100) NULL;
END