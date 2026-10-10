USE [ERP];
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[cir_GeneralDocuments]')
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[cir_GeneralDocuments]
    (
        [DocumentId] UNIQUEIDENTIFIER NOT NULL,
        [DocumentNo] NVARCHAR(MAX) NULL,
        [DocumentName] NVARCHAR(MAX) NULL,
        [DocumentType] INT NOT NULL,
        [DocumentAttachment] NVARCHAR(MAX) NULL,
        [IsActive] BIT NOT NULL,
        [DataStatus] INT NOT NULL,
        [OrganizationId] UNIQUEIDENTIFIER NOT NULL,
        [BusinessUnitId] UNIQUEIDENTIFIER NOT NULL,
        [CreatedDateTime] DATETIME NOT NULL,
        [CreatedUserId] UNIQUEIDENTIFIER NOT NULL,
        [UpdatedDateTime] DATETIME NULL,
        [UpdatedUserId] UNIQUEIDENTIFIER NULL,
        [CreatedUserName] NVARCHAR(200) NULL,
        [UpdatedUserName] NVARCHAR(200) NULL,

        CONSTRAINT [PK_cir_GeneralDocument]
            PRIMARY KEY CLUSTERED ([DocumentId])
    );

    PRINT 'Table [dbo].[cir_GeneralDocuments] created successfully.';
END
ELSE
BEGIN
    PRINT 'Table [dbo].[cir_GeneralDocuments] already exists.';
END;
GO