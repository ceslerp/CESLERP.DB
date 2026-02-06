USE [FRM]
GO

-- HRM Holiday
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = 'c837c046-3d5e-482c-bd73-6993c1e006b8'
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
            'c837c046-3d5e-482c-bd73-6993c1e006b8',
            'HRM_Holiday',
            'Holiday',
            'Holiday',
            'Holiday Management',
            NULL,
            NULL,
            2032,              -- Next number after Post (change if needed)
            NULL,
            '/holiday/index',
            'holiday',
            NULL,
            1,                -- True
            'HRM',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1                 -- True
        )
END
GO
