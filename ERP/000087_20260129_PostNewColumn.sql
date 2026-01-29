USE [ERP]
GO

-- Add DataStatus column if not exists
IF COL_LENGTH('dbo.hrm_Post', 'DataStatus') IS NULL
BEGIN
    ALTER TABLE [dbo].[hrm_Post]
    ADD [DataStatus] INT NOT NULL 
        CONSTRAINT DF_hrm_Post_DataStatus DEFAULT (1);
END
GO

-- Add RejectComment column if not exists
IF COL_LENGTH('dbo.hrm_Post', 'RejectComment') IS NULL
BEGIN
    ALTER TABLE [dbo].[hrm_Post]
    ADD [RejectComment] NVARCHAR(MAX) NULL;
END
GO

-- Add RejectDateTime column if not exists
IF COL_LENGTH('dbo.hrm_Post', 'RejectDateTime') IS NULL
BEGIN
    ALTER TABLE [dbo].[hrm_Post]
    ADD [RejectDateTime] DATETIME2(7) NULL;
END
GO

-- Add ApprovedDateTime column if not exists
IF COL_LENGTH('dbo.hrm_Post', 'ApprovedDateTime') IS NULL
BEGIN
    ALTER TABLE [dbo].[hrm_Post]
    ADD [ApprovedDateTime] DATETIME2(7) NULL;
END
GO

-- Add ApprovedUserId column if not exists
IF COL_LENGTH('dbo.hrm_Post', 'ApprovedUserId') IS NULL
BEGIN
    ALTER TABLE [dbo].[hrm_Post]
    ADD [ApprovedUserId] UNIQUEIDENTIFIER NULL;
END
GO
