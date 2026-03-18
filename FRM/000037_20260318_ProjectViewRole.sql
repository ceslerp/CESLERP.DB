USE [FRM]
GO

-- Project View
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = 'e8d234c7-b1c7-47a7-b802-9a0c75783be1'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        (
         'e8d234c7-b1c7-47a7-b802-9a0c75783be1',
         'Project View',
         'Project View',
         'Project View',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181','O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','B0001',
         '2026-01-28 08:38:43.750',
         '8c98df6d-95dd-456c-a649-db7393465536',
         NULL,NULL
        )
END
GO