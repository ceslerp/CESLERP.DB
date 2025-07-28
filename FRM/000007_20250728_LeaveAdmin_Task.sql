USE [FRM]
GO

INSERT INTO [dbo].[TSys_Task]
    ([TaskId], [TaskCode], [TaskShortName], [TaskName], [Description], [DomainId], [LicenceId], 
     [TaskNumber], [ImageURL], [NavigateURL], [Controller], [Action], [IsActive], [Module], 
     [X], [Y], [Width], [Height], [TileGroup], [TileTitle], [TileContent], [TileClass], 
     [TileStyle], [IsShowAsTile])
VALUES
    ('b7cf2f60-e9cb-4f7b-ac08-07548cb9259d', 'HRM-Leave Admin', 'Leave Admin', 'Leave Admin', 'Leave Admin', 
     NULL, NULL, 33, 'a', 'Leave Admin/Index', 'Leave Admin', NULL, 1, 'HRM', 
     2.00, 0.00, 2.00, 0.50, 1, 'HRM', 'hrm', 'hrm', 'tileTtleText', 1)

GO
