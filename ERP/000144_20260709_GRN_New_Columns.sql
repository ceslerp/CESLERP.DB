USE [ERP];
GO

IF COL_LENGTH('dbo.sms_GoodsReceivedNote', 'GRNServiceChargeRemarks') IS NULL
BEGIN
ALTER TABLE dbo.sms_GoodsReceivedNote
ADD GRNServiceChargeRemarks NVARCHAR(MAX) NULL;
END

IF COL_LENGTH('dbo.sms_GoodsReceivedNote', 'RejectedUserId') IS NULL
BEGIN
ALTER TABLE dbo.sms_GoodsReceivedNote
ADD RejectedUserId UNIQUEIDENTIFIER NULL;
END

IF COL_LENGTH('dbo.sms_GoodsReceivedNote', 'RejectedDateTime') IS NULL
BEGIN
ALTER TABLE dbo.sms_GoodsReceivedNote
ADD RejectDateTime DATETIME NULL;
END

IF COL_LENGTH('dbo.sms_GoodsReceivedNote', 'DiscardUserId') IS NULL
BEGIN
ALTER TABLE dbo.sms_GoodsReceivedNote
ADD DiscardUserId UNIQUEIDENTIFIER NULL;
END

IF COL_LENGTH('dbo.sms_GoodsReceivedNote', 'DiscardDateTime') IS NULL
BEGIN
ALTER TABLE dbo.sms_GoodsReceivedNote
ADD DiscardDateTime DATETIME NULL;
END

IF COL_LENGTH('dbo.sms_GoodsReceivedNote', 'IsNewVersion') IS NULL
BEGIN
ALTER TABLE dbo.sms_GoodsReceivedNote
ADD IsNewVersion BIT NULL;
END

PRINT 'sms_GoodsReceivedNote updated successfully.';
GO