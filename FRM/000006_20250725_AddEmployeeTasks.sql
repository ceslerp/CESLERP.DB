USE [FRM]
GO

INSERT INTO [dbo].[TSys_Task]
    ([TaskId], [TaskCode], [TaskShortName], [TaskName], [Description], [DomainId], [LicenceId], 
     [TaskNumber], [ImageURL], [NavigateURL], [Controller], [Action], [IsActive], [Module], 
     [X], [Y], [Width], [Height], [TileGroup], [TileTitle], [TileContent], [TileClass], 
     [TileStyle], [IsShowAsTile])
VALUES
    ('5f364ff9-b40a-4b3f-b5f3-3722333219e4', 'HRM-Employee', 'Employee', 'Employee', 'Employee', 
     NULL, NULL, 31, NULL, 'Employee/Index', 'Employee', NULL, 1, 'HRM', 
     2.00, 0.00, 2.00, 0.50, 1, 'HRM', 'hrm', 'hrm', 'tileTtleText', 1),
     
    ('6239f36c-1005-4aa7-9356-eb9a26b645c7', 'HRM-CasualEmployee', 'CasualEmployee', 'CasualEmployee', 'CasualEmployee', 
     NULL, NULL, 32, NULL, 'CasualEmployee/Index', 'Casual Employee', NULL, 1, 'HRM', 
     2.00, 0.00, 2.00, 0.50, 1, 'HRM', 'hrm', 'hrm', 'tileTtleText', 1)
GO