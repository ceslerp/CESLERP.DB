USE [FRM];
GO

IF EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE [TaskId] = '391a4bbf-b1c7-4db1-8d78-f3c93106a43d'
)
BEGIN
    UPDATE [dbo].[TSys_Task]
    SET
        [TaskCode]      = 'CIR_QualificationInfo',
        [TaskShortName] = 'QualificationInfo',
        [TaskName]      = 'QualificationInfo',
        [Description]  = 'QualificationInfo',
        [DomainId]     = NULL,
        [LicenceId]    = NULL,
        [TaskNumber]   = 2039,
        [ImageURL]     = NULL,
        [NavigateURL]  = '/QualificationInfo/index',
        [Controller]   = 'QualificationInfo',
        [Action]       = NULL,
        [IsActive]     = 1,
        [Module]       = 'CIR',
        [X]            = NULL,
        [Y]            = NULL,
        [Width]        = NULL,
        [Height]       = NULL,
        [TileGroup]    = NULL,
        [TileTitle]    = NULL,
        [TileContent]  = NULL,
        [TileClass]    = NULL,
        [TileStyle]    = NULL,
        [IsShowAsTile] = 1
    WHERE [TaskId] = '391a4bbf-b1c7-4db1-8d78-f3c93106a43d';
END
ELSE
BEGIN
    INSERT INTO [dbo].[TSys_Task] (
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
    VALUES (
        '391a4bbf-b1c7-4db1-8d78-f3c93106a43d',
        'CIR_QualificationInfo',
        'QualificationInfo',
        'QualificationInfo',
        'QualificationInfo',
        NULL,
        NULL,
        2039,
        NULL,
        '/QualificationInfo/index',
        'QualificationInfo',
        NULL,
        1,
        'CIR',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        1
    );
END;
GO