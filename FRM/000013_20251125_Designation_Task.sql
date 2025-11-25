IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE [TaskId] = '26075142-3d43-4e12-a590-0e78ba5bf837'
)
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
        '26075142-3d43-4e12-a590-0e78ba5bf837',   -- TaskId
        'HRM_Designations',                       -- TaskCode
        'Designations',                           -- TaskShortName
        'Designations',                           -- TaskName
        'Designations',                           -- Description
        NULL,                                     -- DomainId
        NULL,                                     -- LicenceId
        2026,                                     -- TaskNumber
        NULL,                                     -- ImageURL
        '/Designations/index',                    -- NavigateURL
        'Designations',                           -- Controller
        NULL,                                     -- Action
        1,                                        -- IsActive
        'HRM',                                    -- Module
        NULL,                                     -- X
        NULL,                                     -- Y
        NULL,                                     -- Width
        NULL,                                     -- Height
        NULL,                                     -- TileGroup
        NULL,                                     -- TileTitle
        NULL,                                     -- TileContent
        NULL,                                     -- TileClass
        NULL,                                     -- TileStyle
        1                                         -- IsShowAsTile
    );
END;
