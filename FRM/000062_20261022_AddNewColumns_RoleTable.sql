USE [FRM];
GO

IF COL_LENGTH('dbo.TSys_Role', 'Module') IS NULL
BEGIN
    ALTER TABLE dbo.TSys_Role
    ADD Module INT NULL;
END

IF COL_LENGTH('dbo.TSys_Role', 'Feature') IS NULL
BEGIN
    ALTER TABLE dbo.TSys_Role
    ADD Feature NVARCHAR(MAX) NULL;
END

IF COL_LENGTH('dbo.TSys_Role', 'ActionType') IS NULL
BEGIN
    ALTER TABLE dbo.TSys_Role
    ADD ActionType NVARCHAR(MAX) NULL;
END