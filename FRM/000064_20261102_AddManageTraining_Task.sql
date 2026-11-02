USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE [TaskId] = 'ab7e9014-a9af-49d4-8f77-27602969d95f'
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
        'ab7e9014-a9af-49d4-8f77-27602969d95f',   -- TaskId
        'HRM_HRM-ManageTrainingProgrammes',       -- TaskCode
        'HRM-ManageTrainingProgrammes',           -- TaskShortName
        'HRM-ManageTrainingProgrammes',           -- TaskName
        'HRM-ManageTrainingProgrammes',           -- Description
        NULL,                                     -- DomainId
        NULL,                                     -- LicenceId
        2041,                                     -- TaskNumber
        NULL,                                     -- ImageURL
        '/HRM-ManageTrainingProgrammes/index',    -- NavigateURL
        'HRM-ManageTrainingProgrammes',           -- Controller
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
GO