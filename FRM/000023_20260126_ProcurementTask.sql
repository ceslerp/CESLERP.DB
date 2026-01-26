USE [FRM]
GO

-- Procurement
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = '96C678F1-DAB3-49D0-AD22-BA4C65D7D63D'
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
        ('96C678F1-DAB3-49D0-AD22-BA4C65D7D63D',
         'Procurement',
         'Procurement',
         'Procurement',
         'Procurement',
         NULL,
         NULL,
         2023,
         NULL,
         '/Procurement/index',
         'Procurement',
         NULL,
         1,              -- True
         'PRC',
         NULL, NULL, NULL, NULL,
         NULL, NULL, NULL,
         NULL, NULL,
         1)              -- True
END
GO