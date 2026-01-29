USE [FRM]
GO

-- HRM Post
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = '2a572daa-bafa-4353-931a-2f8d43105167'
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
            '2a572daa-bafa-4353-931a-2f8d43105167',
            'HRM_Post',
            'Post',
            'Post',
            'Post Management',
            NULL,
            NULL,
            2031,
            NULL,
            '/post/index',
            'post',
            NULL,
            1,              -- True
            'HRM',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1               -- True
        )
END
GO
