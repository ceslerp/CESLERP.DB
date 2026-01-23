USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[prc_BPCPaperElement](
	[BPCPaperId] [uniqueidentifier] NOT NULL,
	[ProcurementCommiteeId] [uniqueidentifier] NOT NULL,
	[WorkSpaceId] [uniqueidentifier] NOT NULL,
	[ProjectValue] [decimal](18, 2) NOT NULL,
	[WorkOrSupply] [varchar](50) NOT NULL,
	[WorkSupplyName] [varchar](200) NOT NULL,
	[RequestDate] [datetime2](7) NULL,
	[AmountEstimate] [decimal](18, 2) NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Recommendation] [varchar](500) NULL,
	[SupplierId] [uniqueidentifier] NULL,
	[AvailabilityFunds] [varchar](50) NULL,
	[AmountWithoutVAT] [decimal](18, 2) NULL,
	[VATComponent] [decimal](18, 2) NULL,
	[TotalValue] [decimal](18, 2) NULL,
	[BPCPaperNumber] [varchar](100) NULL,
	[CreatedDateTime] [datetime2](7) NOT NULL CONSTRAINT [DF_prc_BPCPaperElement_CreatedDateTime]  DEFAULT (sysdatetime()),
	[CreatedUserId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_prc_BPCPaperElement_CreatedUserId]  DEFAULT ('00000000-0000-0000-0000-000000000000'),
	[UpdatedDateTime] [datetime2](7) NULL,
	[UpdatedUserId] [uniqueidentifier] NULL,
	[SupportingDocuments] [int] NULL,
	[DataStatus] [int] NULL,
	[CoeUnit] [uniqueidentifier] NULL,
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_prc_BPCPaperElement] PRIMARY KEY CLUSTERED 
(
	[BPCPaperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


