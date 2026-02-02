USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '2c98ffd7-fa17-45c3-a945-ab3584fb3b87'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('2c98ffd7-fa17-45c3-a945-ab3584fb3b87',
         'SuperWorkUnitAllocation',
         'Super WorkUnit Allocation',
         'Super WorkUnit Allocation',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:46:12.723',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO


IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '1d7ac54a-db3e-4890-bc3b-6443acc58142'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('1d7ac54a-db3e-4890-bc3b-6443acc58142',
         'AddWorkUnitsAllocation',
         'Add Work Units Allocation',
         'Add Work Units Allocation',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:45:57.853',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO