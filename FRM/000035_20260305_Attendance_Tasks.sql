USE [FRM]
GO

-- HRM Add Attendance
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = 'f8d85bd0-8ba5-4595-be19-6a4b62705e53'
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
            'f8d85bd0-8ba5-4595-be19-6a4b62705e53',
            'HRM_AddAttendance',
            'Add Attendance',
            'Add Attendance',
            'Add Attendance',
            NULL,
            NULL,
            2030,
            NULL,
            '/AddAttendance/index',
            'AddAttendance',
            NULL,
            1,
            'HRM',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1
        )
END
GO


-- HRM Apply Attendance
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = '8a004a3c-2d14-45b4-9668-7664c0abc9fb'
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
            '8a004a3c-2d14-45b4-9668-7664c0abc9fb',
            'HRM_ApplyAttendance',
            'Apply Attendance',
            'Apply Attendance',
            'Apply Attendance',
            NULL,
            NULL,
            2031,
            NULL,
            '/ApplyAttendance/index',
            'ApplyAttendance',
            NULL,
            1,
            'HRM',
            NULL, NULL, NULL, NULL,
            NULL, NULL, NULL,
            NULL, NULL,
            1
        )
END
GO
