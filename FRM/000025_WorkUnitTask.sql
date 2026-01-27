USE [FRM]
GO

-- Work Unit
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE TaskId = 'f51899c2-3dd1-40ac-b369-eca5fd177f4d'
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
            'f51899c2-3dd1-40ac-b369-eca5fd177f4d',
            'HRM_workunit',
            'work unit',
            'work unit',
            'work unit',
            NULL,
            NULL,
            2029,
            NULL,
            '/workunit/index',
            'workunit',
            NULL,
            1,          -- True
            'HRM',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1           -- True
        )
END
GO
