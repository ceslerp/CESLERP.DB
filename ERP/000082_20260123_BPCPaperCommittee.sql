USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[prc_BPCPaperCommitee](
	[PaperBpcCommiteeId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[BpcPaperId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[BpcPost] [int] NOT NULL,
	[DataStatus] [int] NOT NULL DEFAULT ((0)),
	[ApprovalStatus] [int] NULL,
	[ApprovedDateTime] [datetime] NULL,
	[CreatedDateTime] [datetime] NULL DEFAULT (getdate()),
	[Comment] [varchar](500) NULL,
 CONSTRAINT [PK_prc_PaperBpcCommitee] PRIMARY KEY CLUSTERED 
(
	[PaperBpcCommiteeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


