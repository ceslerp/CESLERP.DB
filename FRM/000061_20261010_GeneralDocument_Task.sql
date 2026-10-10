USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE [TaskId] = '18eb0d4e-58b2-4f52-b1f1-4243d1923776'
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
        '18eb0d4e-58b2-4f52-b1f1-4243d1923776',   -- TaskId
        'CIR_GeneralDocument',              -- TaskCode
        'General Document',                -- TaskShortName
        'General Document',                -- TaskName
        'General Document',                -- Description
        NULL,                                     -- DomainId
        NULL,                                     -- LicenceId
        2040,                                     -- TaskNumber
        NULL,                                     -- ImageURL
        '/GeneralDocument/index',           -- NavigateURL
        'GeneralDocument',                  -- Controller
        NULL,                                     -- Action
        1,                                        -- IsActive
        'CIR',                                    -- Module
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
GO