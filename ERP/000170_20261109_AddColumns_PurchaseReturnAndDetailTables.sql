IF COL_LENGTH('dbo.sms_PurchaseReturn', 'GoodsReceivedNoteId') IS NULL
    ALTER TABLE dbo.sms_PurchaseReturn
        ADD GoodsReceivedNoteId UNIQUEIDENTIFIER NULL;
GO

IF COL_LENGTH('dbo.sms_PurchaseReturn', 'Reason') IS NULL
    ALTER TABLE dbo.sms_PurchaseReturn
        ADD Reason NVARCHAR(500) NULL;
GO

IF COL_LENGTH('dbo.sms_PurchaseReturn', 'IsFullReturn') IS NULL
    ALTER TABLE dbo.sms_PurchaseReturn
        ADD IsFullReturn BIT NOT NULL
            CONSTRAINT DF_sms_PurchaseReturn_IsFullReturn DEFAULT (0);
GO

IF COL_LENGTH('dbo.sms_PurchaseReturn', 'IsChargesReturned') IS NULL
    ALTER TABLE dbo.sms_PurchaseReturn
        ADD IsChargesReturned BIT NOT NULL
            CONSTRAINT DF_sms_PurchaseReturn_IsChargesReturned DEFAULT (0);
GO

IF COL_LENGTH('dbo.sms_PurchaseReturn', 'ChargesAmount') IS NULL
    ALTER TABLE dbo.sms_PurchaseReturn
        ADD ChargesAmount DECIMAL(18, 2) NOT NULL
            CONSTRAINT DF_sms_PurchaseReturn_ChargesAmount DEFAULT (0);
GO

IF COL_LENGTH('dbo.sms_PurchaseReturnDetail', 'SSCL') IS NULL
    ALTER TABLE dbo.sms_PurchaseReturnDetail
        ADD SSCL DECIMAL(18, 2) NULL;
GO