USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_Request_Group_Member](
	[RequestGroupMemberId] [uniqueidentifier] NOT NULL,
	[RequestGroupId] [uniqueidentifier] NOT NULL,
	[Active] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_rq_Request_Group_Member] PRIMARY KEY CLUSTERED
(
	[RequestGroupMemberId] ASC
)WITH (
	PAD_INDEX = OFF, 
	STATISTICS_NORECOMPUTE = OFF, 
	IGNORE_DUP_KEY = OFF, 
	ALLOW_ROW_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO