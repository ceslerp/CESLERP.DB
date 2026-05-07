IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '1d9bced4-27e9-4fd7-b5a7-76a999800724'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
    (
        [RoleId],
        [RoleCode],
        [RoleName],
        [Description],
        [IsActive],
        [OrganizationId],
        [OrganizationCode],
        [BusinessUnitId],
        [BusinessUnitCode],
        [CreatedDateTime],
        [CreatedUserId],
        [UpdatedDateTime],
        [UpdatedUserId]
    )
    VALUES
    (
        '1d9bced4-27e9-4fd7-b5a7-76a999800724',
        'Transition View',
        'Transition View',
        'Transition View',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        '2026-05-07 15:02:27.433',
        '8c98df6d-95dd-456c-a649-db7393465536',
        NULL,
        NULL
    )
END
GO