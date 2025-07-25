USE [FRM]
GO

INSERT INTO [dbo].[TSys_Role]
    ([RoleId], [RoleCode], [RoleName], [Description], [IsActive], 
     [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode], 
     [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
VALUES
    ('54744146-7160-4476-9c55-3747907145c5', 'HRM Approve Employee', 'HRM Approve Employee', 'HRM Approve Employee', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-05-22 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL),
     
    ('d62069d6-382e-4af0-a100-3ffb2cdfe12f', 'HRM Approve Casual Employee', 'HRM Approve Casual Employee', 'HRM Approve Casual Employee', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-05-22 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL),
     
    ('ef18bd9b-bc20-4299-beef-a4651652aedd', 'HRM Add Casual Employee', 'HRM Add Casual Employee', 'HRM Add Casual Employee', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-05-22 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL),
     
    ('545c4482-f928-47b8-8871-f0847be5c931', 'HRM Add Employee', 'HRM Add Employee', 'HRM Add Employee', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-06-25 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL)
GO