USE [ERP]
GO

-- Add CreatedUserName column
IF NOT EXISTS (
    SELECT 1 FROM sys.columns 
    WHERE object_id = OBJECT_ID(N'[dbo].[cir_CircularInformation]') 
    AND name = 'CreatedUserName'
)
BEGIN
    ALTER TABLE [dbo].[cir_CircularInformation]
    ADD [CreatedUserName] [nvarchar](300) NULL
END
GO

-- Add UpdatedUserName column
IF NOT EXISTS (
    SELECT 1 FROM sys.columns 
    WHERE object_id = OBJECT_ID(N'[dbo].[cir_CircularInformation]') 
    AND name = 'UpdatedUserName'
)
BEGIN
    ALTER TABLE [dbo].[cir_CircularInformation]
    ADD [UpdatedUserName] [nvarchar](300) NULL
END
GO