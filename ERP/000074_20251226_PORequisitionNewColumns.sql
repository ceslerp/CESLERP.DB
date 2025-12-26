-- Add RejectedDateTime
IF COL_LENGTH('dbo.sms_PurchaseOrderRequisition', 'RejectedDateTime') IS NULL
BEGIN
    ALTER TABLE dbo.sms_PurchaseOrderRequisition
    ADD RejectedDateTime DATETIME NULL;
END
GO

-- Add RejectedUserId
IF COL_LENGTH('dbo.sms_PurchaseOrderRequisition', 'RejectedUserId') IS NULL
BEGIN
    ALTER TABLE dbo.sms_PurchaseOrderRequisition
    ADD RejectedUserId UNIQUEIDENTIFIER NULL;
END
GO

-- Add CancelledReason
IF COL_LENGTH('dbo.sms_PurchaseOrderRequisition', 'CancelledReason') IS NULL
BEGIN
    ALTER TABLE dbo.sms_PurchaseOrderRequisition
    ADD CancelledReason NVARCHAR(MAX) NULL;
END
GO
