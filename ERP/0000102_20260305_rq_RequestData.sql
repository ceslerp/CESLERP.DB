USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_RequestData](
	[RequestDataId] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[RequestIndex] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RequestDate] [datetime] NOT NULL DEFAULT (GETDATE()),
	[RequestStutus] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_rq_RequestData] PRIMARY KEY CLUSTERED
(
	[RequestDataId] ASC
)WITH (
	PAD_INDEX = OFF,
	STATISTICS_NORECOMPUTE = OFF,
	IGNORE_DUP_KEY = OFF,
	ALLOW_ROW_LOCKS = ON,
	ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO