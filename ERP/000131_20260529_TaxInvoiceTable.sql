USE [ERP]
GO

IF NOT EXISTS (
SELECT 1
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[fin_TaxInvoice]')
AND type = N'U'
)
BEGIN
CREATE TABLE [dbo].[fin_TaxInvoice]
(
[TaxInvoiceId] [uniqueidentifier] NOT NULL,
[InvoiceNo] [nvarchar](50) NULL,
[InvoiceDate] [datetime] NOT NULL,

[WorkspaceId] [uniqueidentifier] NULL,
[AmountInWords] [nvarchar](max) NULL,
[VATRate] [decimal](18,2) NULL,
[ClientId] [uniqueidentifier] NULL,

[DateOfDelivery] [date] NULL,
[ClaimNo] [nvarchar](100) NULL,
[Attention] [nvarchar](200) NULL,
[ContractSum] [decimal](18,2) NULL,
[TotalWorkDone] [decimal](18,2) NULL,
[Retention] [decimal](18,2) NULL,
[MobilizationAdvanceRecovery] [decimal](18,2) NULL,
[Other] [decimal](18,2) NULL,
[NetAmount] [decimal](18,2) NULL,
[SSCL] [decimal](18,2) NULL,
[TotalValueOfSupply] [decimal](18,2) NULL,
[VATAmount] [decimal](18,2) NULL,
[TotalAmountDue] [decimal](18,2) NULL,

[DataStatus] [int] NOT NULL,

[CreatedDateTime] [datetime] NULL,
[CreatedUserId] [uniqueidentifier] NULL,
[CreatedUserDesignationId] [uniqueidentifier] NULL,

[UpdatedDateTime] [datetime] NULL,
[UpdatedUserId] [uniqueidentifier] NULL,

[ApprovedDateTime] [datetime] NULL,
[ApprovedUserId] [uniqueidentifier] NULL,
[ApprovedUserDesignationId] [uniqueidentifier] NULL,

[RejectedDateTime] [datetime] NULL,
[RejectedUserId] [uniqueidentifier] NULL,

[BusinessUnitId] [uniqueidentifier] NULL,
[OrganizationId] [uniqueidentifier] NULL,

[RejectComment] [nvarchar](500) NULL,

[DiscardComment] [nvarchar](500) NULL,
[DiscardedDateTime] [datetime] NULL,
[DiscardedUserId] [uniqueidentifier] NULL,

    CONSTRAINT [PK_fin_TaxInvoice]
    PRIMARY KEY CLUSTERED
    (
        [TaxInvoiceId] ASC
    )
    WITH
    (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

PRINT 'Table [dbo].[fin_TaxInvoice] created successfully.';

END
ELSE
BEGIN
PRINT 'Table [dbo].[fin_TaxInvoice] already exists.';
END
GO
