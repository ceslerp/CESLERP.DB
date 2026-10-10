USE [ERP];
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[cir_GeneralDocumentAttachment]')
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[cir_GeneralDocumentAttachment]
    (
        [DocumentId] UNIQUEIDENTIFIER NOT NULL,
        [AttachmentId] UNIQUEIDENTIFIER NOT NULL,
        [UpdatedDateTime] DATETIME NULL,
        [UpdatedUserId] UNIQUEIDENTIFIER NULL,

        CONSTRAINT [PK_cir_GeneralDocumentAttachment]
            PRIMARY KEY CLUSTERED ([DocumentId] ASC, [AttachmentId] ASC),

        CONSTRAINT [FK_cir_GeneralDocumentAttachment_Document]
            FOREIGN KEY ([DocumentId])
            REFERENCES [dbo].[cir_GeneralDocuments] ([DocumentId]),

        CONSTRAINT [FK_cir_GeneralDocumentAttachment_Attachment]
            FOREIGN KEY ([AttachmentId])
            REFERENCES [dbo].[cmn_Attachment] ([AttachmentId])
    );

    PRINT 'Table [dbo].[cir_GeneralDocumentAttachment] created successfully.';
END
ELSE
BEGIN
    PRINT 'Table [dbo].[cir_GeneralDocumentAttachment] already exists.';
END;
GO