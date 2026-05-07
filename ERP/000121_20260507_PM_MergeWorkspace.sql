USE [ERP]
GO

/****** Object:  Table [dbo].[pm_MergeWorkSpace]    Script Date: 5/7/2026 11:36:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pm_MergeWorkSpace](
	[MergeWorkSpaceId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[WorkSpaceId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO


