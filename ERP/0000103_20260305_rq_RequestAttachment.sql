USE [ERP]
GO

/****** Object:  Table [dbo].[rq_RequestAttachment]    Script Date: 3/5/2026 12:08:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_RequestAttachment](
	[RequestId] [uniqueidentifier] NOT NULL,
	[AttachmentId] [uniqueidentifier] NOT NULL,
	[RequestDataId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_rq_RequestAttachment] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC,
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


