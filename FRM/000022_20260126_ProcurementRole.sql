USE [FRM]
GO

-- Approve Procurement
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = 'B1F81CA8-E26E-4ADA-9F91-0B25D9072E4E'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('B1F81CA8-E26E-4ADA-9F91-0B25D9072E4E',
         'Approve Procurement',
         'Approve Procurement',
         'Approve Procurement',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:46:12.723',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO

-- Add Procurement
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = 'FBC19474-C921-4A94-B223-785ECD3CB047'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('FBC19474-C921-4A94-B223-785ECD3CB047',
         'Add Procurement',
         'Add Procurement',
         'Add Procurement',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-01-23 08:46:51.143',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL, NULL)
END
GO
