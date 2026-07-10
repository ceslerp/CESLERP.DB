USE [FRM]
GO
-- CIR Upload Circular
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = 'eb06ecdb-fb2b-45ca-8e1c-d284baf3497a'
)
BEGIN
    INSERT INTO [dbo].[TSys_Task]
        (
            [TaskId],
            [TaskCode],
            [TaskShortName],
            [TaskName],
            [Description],
            [DomainId],
            [LicenceId],
            [TaskNumber],
            [ImageURL],
            [NavigateURL],
            [Controller],
            [Action],
            [IsActive],
            [Module],
            [X],
            [Y],
            [Width],
            [Height],
            [TileGroup],
            [TileTitle],
            [TileContent],
            [TileClass],
            [TileStyle],
            [IsShowAsTile]
        )
    VALUES
        (
            'eb06ecdb-fb2b-45ca-8e1c-d284baf3497a',
            'CIR_UploadCircular',
            'Upload Circular',
            'Upload Circular',
            'Upload Circular',
            NULL,
            NULL,
            2036,
            NULL,
            '/UploadCircular/index',
            'UploadCircular',
            NULL,
            1,              -- True
            'CIR',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1               -- True
        )
END
GO
-- CIR Upload Control Document
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = 'dd3f5303-0966-4893-9124-22eac3d6be5c'
)
BEGIN
    INSERT INTO [dbo].[TSys_Task]
        (
            [TaskId],
            [TaskCode],
            [TaskShortName],
            [TaskName],
            [Description],
            [DomainId],
            [LicenceId],
            [TaskNumber],
            [ImageURL],
            [NavigateURL],
            [Controller],
            [Action],
            [IsActive],
            [Module],
            [X],
            [Y],
            [Width],
            [Height],
            [TileGroup],
            [TileTitle],
            [TileContent],
            [TileClass],
            [TileStyle],
            [IsShowAsTile]
        )
    VALUES
        (
            'dd3f5303-0966-4893-9124-22eac3d6be5c',
            'CIR_UploadControlDocument',
            'Upload Control Document',
            'Upload Control Document',
            'Upload Control Document',
            NULL,
            NULL,
            2037,
            NULL,
            '/UploadControlDocument/index',
            'UploadControlDocument',
            NULL,
            1,              -- True
            'CIR',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1               -- True
        )
END
GO
