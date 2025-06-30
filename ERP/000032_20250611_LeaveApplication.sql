USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hrm_LeaveApplication](
[LeaveApplicationId] [uniqueidentifier] NOT NULL,
[LeaveAssignmentId] [uniqueidentifier] NOT NULL,
[AppliedDate] [datetime] NOT NULL,
[LeaveStartDate] [date] NOT NULL,
[StartTime] [nvarchar](max) NULL,
[LeaveEndDate] [date] NOT NULL,
[EndTime] [nvarchar](max) NULL,
[NoOfDays] [decimal](5, 2) NULL,
[CoveringEmployeeId] [uniqueidentifier] NULL,
[Reason] [nvarchar](max) NULL,
[Address] [nvarchar](max) NULL,
[Status] [int] NOT NULL,
[EmployeeId] [uniqueidentifier] NULL,
[LeaveTypeId] [uniqueidentifier] NULL,
[LeaveYearId] [uniqueidentifier] NULL,
[CreatedDateTime] [datetime] NULL,
[CreatedUserId] [uniqueidentifier] NULL,
[UpdatedDateTime] [datetime] NULL,
[UpdatedUserId] [uniqueidentifier] NULL,
[BusinessUnitId] [uniqueidentifier] NULL,
[OrganizationId] [uniqueidentifier] NULL,
[ApprovedDateTime] [datetime] NULL,
[ApprovedUserId] [uniqueidentifier] NULL,
[DiscardedDateTime] [datetime] NULL,
[DiscardedUserId] [uniqueidentifier] NULL,
[RejectedUserId] [uniqueidentifier] NULL,
[RejectedDateTime] [datetime] NULL,
[DiscardComment] [nvarchar](max) NULL,
[RejectComment] [nvarchar](max) NULL,
 CONSTRAINT [PK__hrm_Leav__038EC26DAF2EC82A] PRIMARY KEY CLUSTERED
(
[LeaveApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
