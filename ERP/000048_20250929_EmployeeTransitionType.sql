USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_RequestType](
	[RequestTypeId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL DEFAULT ((1)),
	[CodeNum] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_Request_Type] PRIMARY KEY CLUSTERED 
(
	[RequestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[rq_RequestType]  WITH CHECK ADD  CONSTRAINT [FK_RequestType_RequestGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[rq_Request_Group] ([RequestGroupId])
GO

ALTER TABLE [dbo].[rq_RequestType] CHECK CONSTRAINT [FK_RequestType_RequestGroup]
GO


