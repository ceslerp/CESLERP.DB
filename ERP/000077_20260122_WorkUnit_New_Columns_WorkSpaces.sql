USE [ERP]
GO

-- Add RejectedUserId column if not exists
IF COL_LENGTH('dbo.cmn_WorkSpace', 'RejectedUserId') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_WorkSpace]
    ADD [RejectedUserId] UNIQUEIDENTIFIER NULL;
END
GO

-- Add ApprovedDateTime column if not exists
IF COL_LENGTH('dbo.cmn_WorkSpace', 'ApprovedDateTime') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_WorkSpace]
    ADD [ApprovedDateTime] DATETIME2(7) NULL;
END
GO

-- Add ApprovedUserId column if not exists
IF COL_LENGTH('dbo.cmn_WorkSpace', 'ApprovedUserId') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_WorkSpace]
    ADD [ApprovedUserId] UNIQUEIDENTIFIER NULL;
END
GO

-- Add DataStatus column if not exists
IF COL_LENGTH('dbo.cmn_WorkSpace', 'DataStatus') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_WorkSpace]
    ADD [DataStatus] INT NULL;
END
GO

-- Add RejectDateTime column if not exists
IF COL_LENGTH('dbo.cmn_WorkSpace', 'RejectDateTime') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_WorkSpace]
    ADD [RejectDateTime] DATETIME2(7) NULL;
END
GO

-- Add RejectComment column if not exists
IF COL_LENGTH('dbo.cmn_WorkSpace', 'RejectComment') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_WorkSpace]
    ADD [RejectComment] NVARCHAR(MAX) NULL;
END
GO
