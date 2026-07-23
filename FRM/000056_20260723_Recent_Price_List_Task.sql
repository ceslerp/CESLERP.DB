USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE TaskId = 'f7d710be-f038-4558-bf7e-460379cddef5'
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
        'f7d710be-f038-4558-bf7e-460379cddef5',
        'PRC_RecentPriceList',
        'Recent Price List',
        'Recent Price List',
        'Recent Price List',
        NULL,
        NULL,
        2038,
        NULL,
        '/RecentPriceList/index',
        'RecentPriceList',
        NULL,
        1,
        'PRC',
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
