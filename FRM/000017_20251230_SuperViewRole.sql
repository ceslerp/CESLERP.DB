USE [FRM]
GO

-- Super View Leave
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '277f3702-5bdb-4c23-9246-8a97c947b0fc'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('277f3702-5bdb-4c23-9246-8a97c947b0fc',
         'SuperViewLeave',
         'Super View Leave',
         'Super View Leave',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181',
         'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
         'B0001',
         '2025-12-30 14:22:36.857',
         'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
         NULL,
         NULL)
END
GO
