USE [ERP]
GO

/****** Object:  Table [dbo].[qs_ClientInvoiceDetail]    Script Date: 1/28/2026 11:22:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[qs_ClientInvoiceDetail](
	[ClientInvoiceDetailId] [uniqueidentifier] NOT NULL,
	[IPCId] [uniqueidentifier] NOT NULL,
	[IPAId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.qs_ClientInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[ClientInvoiceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


