USE [ERP]
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[cir_ControlDocument]') AND name = 'CreatedUserName')
BEGIN
    ALTER TABLE [dbo].[cir_ControlDocument]
    ADD [CreatedUserName] [nvarchar](200) NULL
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID(N'[dbo].[cir_ControlDocument]') AND name = 'UpdatedUserName')
BEGIN
    ALTER TABLE [dbo].[cir_ControlDocument]
    ADD [UpdatedUserName] [nvarchar](200) NULL
END
GO