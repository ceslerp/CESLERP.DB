USE [ERP]
GO

/****** Object:  Table [dbo].[rq_Request_Workflow_Step]    Script Date: 5/7/2026 11:39:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_Request_Workflow_Step](
	[RequestWorkflowStepId] [uniqueidentifier] NOT NULL,
	[RequestId] [uniqueidentifier] NOT NULL,
	[WorkflowSequenceId] [uniqueidentifier] NOT NULL,
	[SequenceOrder] [int] NOT NULL,
	[AssignedGroupId] [uniqueidentifier] NOT NULL,
	[IsCompleted] [bit] NOT NULL DEFAULT ((0)),
	[CompletedDate] [datetime] NULL,
 CONSTRAINT [PK_rq_Request_Workflow_Step] PRIMARY KEY CLUSTERED 
(
	[RequestWorkflowStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


