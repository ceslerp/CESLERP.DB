USE [ERP]
GO

/****** Object:  Table [dbo].[rq_Workflow]    Script Date: 5/7/2026 11:38:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rq_Workflow](
	[WorkflowId] [uniqueidentifier] NOT NULL,
	[WorkflowName] [nvarchar](255) NOT NULL,
	[Active] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_rq_Workflow] PRIMARY KEY CLUSTERED 
(
	[WorkflowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


