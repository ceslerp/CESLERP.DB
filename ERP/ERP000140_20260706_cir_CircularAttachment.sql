USE [ERP]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cir_CircularAttachment](
    [CircularInformationId] [uniqueidentifier] NOT NULL,
    [AttachmentId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cir_CircularAttachment] PRIMARY KEY CLUSTERED 
(
    [CircularInformationId] ASC,
    [AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO