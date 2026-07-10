USE [ERP];
GO
IF COL_LENGTH('dbo.fin_AccountCodeGN4Version', 'ApprovedUserId') IS NULL
BEGIN
ALTER TABLE dbo.fin_AccountCodeGN4Version
ADD ApprovedUserId UNIQUEIDENTIFIER NULL;
END
IF COL_LENGTH('dbo.fin_AccountCodeGN4Version', 'ApprovedDateTime') IS NULL
BEGIN
ALTER TABLE dbo.fin_AccountCodeGN4Version
ADD ApprovedDateTime DATETIME NULL;
END
IF COL_LENGTH('dbo.fin_AccountCodeGN4Version', 'RejectDateTime') IS NULL
BEGIN
ALTER TABLE dbo.fin_AccountCodeGN4Version
ADD RejectDateTime DATETIME NULL;
END
IF COL_LENGTH('dbo.fin_AccountCodeGN4Version', 'RejectComment') IS NULL
BEGIN
ALTER TABLE dbo.fin_AccountCodeGN4Version
ADD RejectComment NVARCHAR(MAX) NULL;
END
PRINT 'fin_AccountCodeGN4Version updated successfully.';
GO
