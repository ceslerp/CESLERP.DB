USE [ERP];
GO
IF COL_LENGTH('dbo.cmn_Client', 'TINNo') IS NULL
BEGIN
    ALTER TABLE dbo.cmn_Client
    ADD TINNo NVARCHAR(15) NULL
        CONSTRAINT DF_cmn_Client_TINNo DEFAULT ('');
END
GO
