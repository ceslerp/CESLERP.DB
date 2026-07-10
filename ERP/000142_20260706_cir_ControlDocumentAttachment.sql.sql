USE [ERP]
GO

ALTER TABLE [dbo].[cir_ControlDocumentAttachment] 
ADD [IsActive] BIT NOT NULL DEFAULT 1;

ALTER TABLE [dbo].[cir_ControlDocumentAttachment] 
ADD [UpdatedDateTime] [datetime] NULL;

ALTER TABLE [dbo].[cir_ControlDocumentAttachment] 
ADD [UpdatedUserId] [uniqueidentifier] NULL;

GO
