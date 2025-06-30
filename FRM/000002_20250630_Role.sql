USE [FRM]
GO

INSERT INTO [dbo].[TSys_Role]
    ([RoleId], [RoleCode], [RoleName], [Description], [IsActive], 
     [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode], 
     [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
VALUES
    ('b16032f8-9da0-4e71-bd06-075ceb66bd71', 'Approve Leave', 'Approve Leave', 'Approve Leave', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-05-22 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL),
     
    ('b301fa83-fb72-46c0-b5c5-239a91dd521e', 'Assign Leave', 'Assign Leave', 'Assign Leave', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-05-22 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL),
     
    ('1754b729-3d70-4189-9317-bfb172946e82', 'Add Leave', 'Add Leave', 'Add Leave', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-05-22 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL),
     
    ('26cc6702-2a7d-4ccb-b208-7122fdeb68f0', 'General', 'General', 'General', 1,
     'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
     '2025-06-25 10:40:00.000', 'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d', NULL, NULL)
GO