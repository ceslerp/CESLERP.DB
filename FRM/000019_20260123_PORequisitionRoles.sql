USE [FRM]
GO

-- Approve PORequisition
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '7681aa97-5445-4ace-8152-47e898ea592d'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('7681aa97-5445-4ace-8152-47e898ea592d',
         'Approve PORequisition',
         'Approve PORequisition',
         'Approve PORequisition',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:46:12.723',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO

-- View PORequisition
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '47ea1c01-aa68-4ff0-841b-9eff0ea56324'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('47ea1c01-aa68-4ff0-841b-9eff0ea56324',
         'View PORequisition',
         'View PORequisition',
         'View PORequisition',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:46:51.143',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO

-- Add PORequisition
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '7c04deea-86e7-4d70-980a-e5174f960121'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('7c04deea-86e7-4d70-980a-e5174f960121',
         'Add PORequisition',
         'Add PORequisition',
         'Add PORequisition',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:45:57.853',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO
