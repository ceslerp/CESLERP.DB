USE [ERP];
GO

IF COL_LENGTH('dbo.sms_ItemSubCategory', 'ApprovedUserId') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemSubCategory
ADD ApprovedUserId UNIQUEIDENTIFIER NULL;
END
GO

IF COL_LENGTH('dbo.sms_ItemSubCategory', 'ApprovedDateTime') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemSubCategory
ADD ApprovedDateTime DATETIME NULL;
END
GO

IF COL_LENGTH('dbo.sms_ItemSubCategory', 'RejectDateTime') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemSubCategory
ADD RejectDateTime DATETIME NULL;
END
GO

IF COL_LENGTH('dbo.sms_ItemSubCategory', 'RejectComment') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemSubCategory
ADD RejectComment NVARCHAR(1000) NULL;
END
GO

PRINT 'sms_ItemSubCategory updated successfully.';
GO
