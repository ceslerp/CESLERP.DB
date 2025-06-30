USE [FRM]
GO

INSERT INTO [dbo].[TSys_Task]
    ([TaskId], [TaskCode], [TaskShortName], [TaskName], [Description], [DomainId], [LicenceId], 
     [TaskNumber], [ImageURL], [NavigateURL], [Controller], [Action], [IsActive], [Module], 
     [X], [Y], [Width], [Height], [TileGroup], [TileTitle], [TileContent], [TileClass], 
     [TileStyle], [IsShowAsTile])
VALUES
    ('e7460713-89a6-4376-aeaf-8495163fef50', 'HRM-Leave Assignment', 'Leave Assignment', 'Leave Assignment', 'Leave Assignment', 
     NULL, NULL, 29, 'a', 'Leave Assignment/Index', 'Leave Assignment', NULL, 1, 'HRM', 
     2.00, 0.00, 2.00, 0.50, 1, 'HRM', 'hrm', 'hrm', 'tileTtleText', 1),
     
    ('28ff3b20-815a-4b7e-9e3c-a17243a5ad06', 'HRM-Leave Application', 'Leave Application', 'Leave Application', 'Leave Application', 
     NULL, NULL, 28, 'a', 'Leave Application/Index', 'Leave Application', NULL, 1, 'HRM', 
     2.00, 0.00, 2.00, 0.50, 1, 'HRM', 'hrm', 'hrm', 'tileTtleText', 1)
GO