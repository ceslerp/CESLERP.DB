USE [ERP]
GO

-- Add RejectComment column if not exists
IF COL_LENGTH('dbo.cmn_Client', 'RejectComment') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_Client]
    ADD [RejectComment] NVARCHAR(MAX) NULL;
END
GO

-- Add RejectDateTime column if not exists
IF COL_LENGTH('dbo.cmn_Client', 'RejectDateTime') IS NULL
BEGIN
    ALTER TABLE [dbo].[cmn_Client]
    ADD [RejectDateTime] DATETIME NULL;
END
GO
