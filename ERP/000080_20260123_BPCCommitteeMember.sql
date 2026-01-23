USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[prc_BaseProcurementCommitteeMember](
	[ProcurementCommiteeMemberId] [uniqueidentifier] NOT NULL,
	[DataStatus] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrganizationId] [uniqueidentifier] NOT NULL,
	[BusinessUnitId] [uniqueidentifier] NOT NULL,
	[WorkSpaceId] [uniqueidentifier] NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedUserId] [uniqueidentifier] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedUserId] [uniqueidentifier] NULL,
	[DesignationId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
	[EmployeeId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
	[ProcurementCommiteeId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
	[DigitalSignature] [nvarchar](max) NULL,
	[SignatureDate] [datetime] NULL,
	[SignatureMimeType] [nvarchar](50) NULL DEFAULT ('image/png'),
	[BpcPost] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


