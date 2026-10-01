-----Create column-----
USE [ERP]
GO

ALTER TABLE [dbo].[cmn_WorkspaceAttachment]
ADD [FileType] INT NULL;
GO

-----Update Column-----
USE [ERP]
GO

ALTER TABLE [dbo].[cmn_WorkspaceAttachment]
ADD [FileType] INT NOT NULL CONSTRAINT DF_cmn_WorkspaceAttachment_FileType DEFAULT 4;
GO

-----NOT NULL-----

ALTER TABLE [dbo].[cmn_WorkspaceAttachment]
ALTER COLUMN [FileType] INT NOT NULL;
GO
