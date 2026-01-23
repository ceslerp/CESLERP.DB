USE [FRM]
GO

-- PORequisition
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Task] 
    WHERE TaskId = 'aa682ba7-7784-4992-a315-64e42f2bccb7'
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
        ('aa682ba7-7784-4992-a315-64e42f2bccb7',
         'SMS_PORequisition',
         'PORequisition',
         'PORequisition',
         'PORequisition',
         NULL,
         NULL,
         2023,
         NULL,
         '/PORequisition/index',
         'PORequisition',
         NULL,
         1,              -- True
         'SMS',
         NULL, NULL, NULL, NULL,
         NULL, NULL, NULL,
         NULL, NULL,
         1)              -- True
END
GO
