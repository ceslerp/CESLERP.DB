USE [ERP];
GO


IF COL_LENGTH('dbo.sms_ItemVersion', 'ApprovedUserId') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemVersion
ADD ApprovedUserId UNIQUEIDENTIFIER NULL;
END

IF COL_LENGTH('dbo.sms_ItemVersion', 'ApprovedDateTime') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemVersion
ADD ApprovedDateTime DATETIME NULL;
END

IF COL_LENGTH('dbo.sms_ItemVersion', 'RejectDateTime') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemVersion
ADD RejectDateTime DATETIME NULL;
END

IF COL_LENGTH('dbo.sms_ItemVersion', 'RejectComment') IS NULL
BEGIN
ALTER TABLE dbo.sms_ItemVersion
ADD RejectComment NVARCHAR(1000) NULL;
END

ALTER TABLE dbo.sms_ItemVersion
ALTER COLUMN ItemCode NVARCHAR(20) NULL;

ALTER TABLE dbo.sms_Item
ALTER COLUMN ItemCode NVARCHAR(20) NULL;

PRINT 'sms_ItemVersion and sms_Item updated successfully.';
GO
