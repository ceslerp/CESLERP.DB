USE [ERP]
GO

/****** Object:  Table [dbo].[rq_Request_Workflow]    Script Date: 5/7/2026 11:40:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_Request_Workflow](
	[RequestWorkflowId] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[WorkflowId] [uniqueidentifier] NOT NULL,
	[CurrentStep] [int] NOT NULL DEFAULT ((1)),
	[Completed] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_rq_Request_Workflow] PRIMARY KEY CLUSTERED 
(
	[RequestWorkflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


