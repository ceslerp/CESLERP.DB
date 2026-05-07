USE [ERP]
GO

/****** Object:  Table [dbo].[rq_Workflow_Sequence]    Script Date: 5/7/2026 11:37:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_Workflow_Sequence](
	[WorkflowSequenceId] [uniqueidentifier] NOT NULL,
	[WorkflowId] [uniqueidentifier] NOT NULL,
	[SequenceOrder] [int] NOT NULL,
	[RequestGroupId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_rq_Workflow_Sequence] PRIMARY KEY CLUSTERED 
(
	[WorkflowSequenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


