sql
USE [ERP]
GO

-- Add Description column
ALTER TABLE [dbo].[hrm_Designation] 
ADD [Description] [varchar](250) NOT NULL DEFAULT ('N/A')
GO

-- Add ApprovedUserId column
ALTER TABLE [dbo].[hrm_Designation] 
ADD [ApprovedUserId] [uniqueidentifier] NULL
GO

-- Add ApprovedDateTime column
ALTER TABLE [dbo].[hrm_Designation] 
ADD [ApprovedDateTime] [datetime] NULL
GO

-- Add RejectComment column
ALTER TABLE [dbo].[hrm_Designation] 
ADD [RejectComment] [nvarchar](max) NULL
GO

-- Add RejectDateTime column
ALTER TABLE [dbo].[hrm_Designation] 
ADD [RejectDateTime] [datetime] NULL
GO
