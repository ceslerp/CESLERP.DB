IF COL_LENGTH('dbo.rq_RequestType', 'HasWorkflow') IS NULL
BEGIN
	ALTER TABLE [dbo].[rq_RequestType]
	ADD [HasWorkflow] [bit] NOT NULL DEFAULT ((0))
END
GO

IF COL_LENGTH('dbo.rq_RequestType', 'WorkflowId') IS NULL
BEGIN
	ALTER TABLE [dbo].[rq_RequestType]
	ADD [WorkflowId] [uniqueidentifier] NULL
END
GO