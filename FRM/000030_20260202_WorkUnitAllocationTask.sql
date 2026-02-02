USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = '948cde96-87c2-4ab0-9b7a-a68a6c844cab'
)
BEGIN
    INSERT INTO [dbo].[TSys_Task]
        ([TaskId], [TaskCode], [TaskShortName], [TaskName], [Description],
         [DomainId], [LicenceId], [TaskNumber], [ImageURL], [NavigateURL],
         [Controller], [Action], [IsActive], [Module],
         [X], [Y], [Width], [Height],
         [TileGroup], [TileTitle], [TileContent],
         [TileClass], [TileStyle], [IsShowAsTile])
    VALUES
        ('948cde96-87c2-4ab0-9b7a-a68a6c844cab',
         'HRM_WorkUnitsAllocation',
         'WorkUnitsAllocation',
         'WorkUnitsAllocation',
         'WorkUnitsAllocation',
         NULL,
         NULL,
         2023,
         NULL,
         '/WorkUnitsAllocation/index',
         'WorkUnitsAllocation',
         NULL,
         1,              -- True
         'SMS',
         NULL, NULL, NULL, NULL,
         NULL, NULL, NULL,
         NULL, NULL,
         1)              -- True
END
GO