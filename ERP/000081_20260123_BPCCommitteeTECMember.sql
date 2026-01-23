USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[prc_BPCCommitteeTECMember](
	[BPCComityTECMemberId] [uniqueidentifier] NOT NULL,
	[BPCPaperId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[EffectiveWorkSpaceId] [uniqueidentifier] NOT NULL,
	[DataStatus] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrganizationId] [uniqueidentifier] NOT NULL,
	[BusinessUnitId] [uniqueidentifier] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedUserId] [uniqueidentifier] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedUserId] [uniqueidentifier] NULL,
	[BECPost] [varchar](50) NULL,
 CONSTRAINT [PK_prc_BPCComityTECMember] PRIMARY KEY CLUSTERED 
(
	[BPCComityTECMemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[prc_BPCCommitteeTECMember]  WITH NOCHECK ADD  CONSTRAINT [FK_BPCComityTECMember_BPCPaperElement] FOREIGN KEY([BPCPaperId])
REFERENCES [dbo].[prc_BPCPaperElement] ([BPCPaperId])
GO

ALTER TABLE [dbo].[prc_BPCCommitteeTECMember] CHECK CONSTRAINT [FK_BPCComityTECMember_BPCPaperElement]
GO

ALTER TABLE [dbo].[prc_BPCCommitteeTECMember]  WITH CHECK ADD  CONSTRAINT [FK_BPCComityTECMember_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[cmn_Employee] ([EmployeeId])
GO

ALTER TABLE [dbo].[prc_BPCCommitteeTECMember] CHECK CONSTRAINT [FK_BPCComityTECMember_Employee]
GO


