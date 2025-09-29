USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hrm_EmployeeTransition](
	[EmployeeTransitionId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[TransitionTypeId] [uniqueidentifier] NOT NULL,
	[COEUnitId] [uniqueidentifier] NULL,
	[SOEUnitId] [uniqueidentifier] NULL,
	[DesignationId] [uniqueidentifier] NULL,
	[PostId] [uniqueidentifier] NULL,
	[GradeId] [uniqueidentifier] NULL,
	[Comment] [nvarchar](max) NULL,
	[EffectiveDate] [datetime] NULL,
	[DataStatus] [int] NOT NULL DEFAULT ((1)),
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedUserId] [uniqueidentifier] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[UpdatedUserId] [uniqueidentifier] NULL,
	[ApprovedDateTime] [datetime] NULL,
	[ApprovedUserId] [uniqueidentifier] NULL,
	[TypeOfTransaction] [int] NULL,
	[TypeOfRelease] [int] NULL,
	[Reason] [nvarchar](255) NULL,
	[LeaveStartDate] [datetime] NULL,
	[LeaveEndDate] [datetime] NULL,
	[NoticePeriod] [nvarchar](10) NULL,
	[NoticePeriodStartDate] [datetime] NULL,
	[NoticePeriodEndDate] [datetime] NULL,
	[RetirementDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[TypeOfLeave] [nchar](10) NULL,
	[RejoinDate] [datetime] NULL,
	[BasicSalary] [decimal](18, 2) NULL,
	[AGMUnitId] [uniqueidentifier] NULL,
	[DGMUnitId] [uniqueidentifier] NULL,
	[PreviousCOEUnitId] [uniqueidentifier] NULL,
	[PreviousSOEUnitId] [uniqueidentifier] NULL,
	[PreviousGradeId] [uniqueidentifier] NULL,
	[PreviousPostId] [uniqueidentifier] NULL,
	[PreviousDesignationId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeTransitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


