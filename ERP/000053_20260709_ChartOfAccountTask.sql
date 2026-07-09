USE [FRM]
GO
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE TaskId = 'b9492075-cf8e-4a47-9c79-0d767b7155a8'
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
        'b9492075-cf8e-4a47-9c79-0d767b7155a8',
        'ChartOfAccount',
        'Chart of Account',
        'Chart of Account',
        'Chart of Account Management',
        NULL,
        NULL,
        2034,
        NULL,
        '/chartOfAccount/index',
        'chartOfAccount',
        NULL,
        1,
        'FIN',
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
    )
END
GO
