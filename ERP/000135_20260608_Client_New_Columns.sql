USE [ERP];
GO

IF COL_LENGTH('dbo.cmn_Client', 'DiscardedUserId') IS NULL
BEGIN
    ALTER TABLE dbo.cmn_Client
    ADD DiscardedUserId UNIQUEIDENTIFIER NULL;
END
GO

IF COL_LENGTH('dbo.cmn_Client', 'DiscardedDateTime') IS NULL
BEGIN
    ALTER TABLE dbo.cmn_Client
    ADD DiscardedDateTime DATETIME NULL;
END
GO

IF COL_LENGTH('dbo.cmn_Client', 'DiscardComment') IS NULL
BEGIN
    ALTER TABLE dbo.cmn_Client
    ADD DiscardComment NVARCHAR(500) NULL
        CONSTRAINT DF_cmn_Client_DiscardComment DEFAULT ('');
END
GO
