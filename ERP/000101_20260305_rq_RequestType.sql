USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_RequestType](
	[RequestTypeId] [uniqueidentifier] NOT NULL,
	[RequestGroupId] [uniqueidentifier] NULL,
	[Active] [bit] NOT NULL 
		CONSTRAINT [DF_rq_RequestType_Active] DEFAULT ((1)),
 CONSTRAINT [PK_rq_RequestType] PRIMARY KEY CLUSTERED
(
	[RequestTypeId] ASC
)WITH (
	PAD_INDEX = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	IGNORE_DUP_KEY = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO
