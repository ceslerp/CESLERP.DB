USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.fin_TaxInvoice', 'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[fin_TaxInvoice](
        [TaxInvoiceId] UNIQUEIDENTIFIER NOT NULL,

        [InvoiceNo] NVARCHAR(50) NULL,
        [InvoiceDate] DATETIME NOT NULL,
        [DateOfDelivery] DATE NULL,
        [ClaimNo] NVARCHAR(100) NULL,

        [PurchaserName] NVARCHAR(200) NULL,
        [PurchaserTIN] NVARCHAR(100) NULL,
        [PurchaserAddress] NVARCHAR(MAX) NULL,
        [PurchaserContactNo] NVARCHAR(50) NULL,

        [PlaceOfSupply] NVARCHAR(200) NULL,
        [COESection] NVARCHAR(200) NULL,
        [Attention] NVARCHAR(200) NULL,
        [JobCode] NVARCHAR(100) NULL,
        [ContractSum] DECIMAL(18,2) NULL,

        [TotalWorkDone] DECIMAL(18,2) NULL,
        [Retention] DECIMAL(18,2) NULL,
        [MobilizationAdvanceRecovery] DECIMAL(18,2) NULL,
        [Other] DECIMAL(18,2) NULL,
        [NetAmount] DECIMAL(18,2) NULL,
        [SSCL] DECIMAL(18,2) NULL,
        [TotalValueOfSupply] DECIMAL(18,2) NULL,
        [VATAmount] DECIMAL(18,2) NULL,
        [TotalAmountDue] DECIMAL(18,2) NULL,

        [PaymentMode] INT NOT NULL,
        [BOCAccountNo] UNIQUEIDENTIFIER NOT NULL, 

        [DataStatus] INT NOT NULL,
        [CreatedDateTime] DATETIME NULL,
        [CreatedUserId] UNIQUEIDENTIFIER NULL,
		[CreatedUserDesignationId] UNIQUEIDENTIFIER NULL,
        [UpdatedDateTime] DATETIME NULL,
        [UpdatedUserId] UNIQUEIDENTIFIER NULL,	
        [CheckedDateTime] DATETIME NULL,
        [CheckedUserId] UNIQUEIDENTIFIER NULL,
		[CheckedUserDesignationId] UNIQUEIDENTIFIER NULL,
        [ApprovedDateTime] DATETIME NULL,
        [ApprovedUserId] UNIQUEIDENTIFIER NULL,
		[ApprovedUserDesignationId] UNIQUEIDENTIFIER NULL,
        [RejectedDateTime] DATETIME NULL,
        [RejectedUserId] UNIQUEIDENTIFIER NULL,
        [BusinessUnitId] UNIQUEIDENTIFIER NULL,
        [OrganizationId] UNIQUEIDENTIFIER NULL,

        CONSTRAINT [PK_fin_TaxInvoice] PRIMARY KEY CLUSTERED 
        (
            [TaxInvoiceId] ASC
        )
    ) ON [PRIMARY];
END
GO
