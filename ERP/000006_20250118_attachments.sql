BEGIN TRY
    -- Create cmn_Attachment Table
    IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cmn_Attachment]') AND type = 'U')
    BEGIN
        CREATE TABLE [dbo].[cmn_Attachment] (
            [AttachmentId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
            [FileName] NVARCHAR(1024) NOT NULL,
            [ContentType] NVARCHAR(300) NOT NULL,
            [Extension] NVARCHAR(30) NOT NULL,
            [FileSize] BIGINT NOT NULL CHECK ([FileSize] >= 0),
            [StoragePath] NVARCHAR(4000) NOT NULL,
            [CreatedDateTime] DATE NOT NULL DEFAULT (GETDATE()),
            [CreatedUserId] UNIQUEIDENTIFIER NOT NULL
        );
    END;

    -- Create cmn_WorkspaceAttachment Table
    IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cmn_WorkspaceAttachment]') AND type = 'U')
    BEGIN
        CREATE TABLE [dbo].[cmn_WorkspaceAttachment] (
            [WorkspaceId] UNIQUEIDENTIFIER NOT NULL,
            [AttachmentId] UNIQUEIDENTIFIER NOT NULL,
            CONSTRAINT [PK_cmn_WorkspaceAttachment] PRIMARY KEY ([WorkspaceId], [AttachmentId]),
            CONSTRAINT [FK_WorkspaceAttachment_Workspace] FOREIGN KEY ([WorkspaceId]) REFERENCES [dbo].[cmn_WorkSpace]([WorkspaceId]) ON DELETE CASCADE,
            CONSTRAINT [FK_WorkspaceAttachment_Attachment] FOREIGN KEY ([AttachmentId]) REFERENCES [dbo].[cmn_Attachment]([AttachmentId]) ON DELETE CASCADE
        );
    END;

    PRINT 'Tables cmn_Attachment, cmn_WorkspaceAttachment created successfully.';
END TRY
BEGIN CATCH
    PRINT 'An error occurred: 000006 ' + ERROR_MESSAGE();
    THROW;
END CATCH;
