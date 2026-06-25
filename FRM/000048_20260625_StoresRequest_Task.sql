USE [FRM2]
GO

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
    '317061A3-6BB3-41E5-99FB-8DEDAB6572FC', -- TaskId
    'SMS_StoresRequest',                   -- TaskCode
    'StoresRequest',                      -- TaskShortName
    'StoresRequest',                      -- TaskName
    'Stores Request',                      -- Description
    NULL,                                  -- DomainId
    NULL,                                  -- LicenceId
    2034,                                  -- TaskNumber
    NULL,                                  -- ImageURL
    '/StoresRequest/index',                -- NavigateURL
    'StoresRequest',                       -- Controller
    NULL,                                  -- Action
    1,                                     -- IsActive (True)
    'SMS',                                 -- Module
    NULL,                                  -- X
    NULL,                                  -- Y
    NULL,                                  -- Width
    NULL,                                  -- Height
    NULL,                                  -- TileGroup
    NULL,                                  -- TileTitle
    NULL,                                  -- TileContent
    NULL,                                  -- TileClass
    NULL,                                  -- TileStyle
    1                                      -- IsShowAsTile (True)
);
GO