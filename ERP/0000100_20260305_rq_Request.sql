USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_Request](
	[RequestId] [uniqueidentifier] NOT NULL,
	[RequesterId] [uniqueidentifier] NOT NULL,
	[RequestedDate] [datetime] NOT NULL DEFAULT (GETDATE()),
	[RequestGroupId] [uniqueidentifier] NULL,
	[RequestTypeId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL DEFAULT ((0)),
	[Priority] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_rq_Request] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (
	PAD_INDEX = OFF, 
	STATISTICS_NORECOMPUTE = OFF, 
	IGNORE_DUP_KEY = OFF, 
	ALLOW_ROW_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO