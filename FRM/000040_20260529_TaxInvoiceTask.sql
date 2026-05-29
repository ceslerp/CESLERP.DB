USE [FRM]
GO

-- Tax Invoice
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Task]
    WHERE TaskId = 'acae8562-2570-45b7-a664-800638b374a1'
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
        ('acae8562-2570-45b7-a664-800638b374a1',
         'FIN_Tax_Invoice',
         'Tax_Invoice',
         'Tax_Invoice',
         'Tax_Invoice',
         NULL,
         NULL,
         2033,
         NULL,
         '/Tax_Invoice/index',
         'Tax_Invoice',
         NULL,
         1,              -- True
         'FIN',
         NULL, NULL, NULL, NULL,
         NULL, NULL, NULL,
         NULL, NULL,
         1)              -- True
END
GO
