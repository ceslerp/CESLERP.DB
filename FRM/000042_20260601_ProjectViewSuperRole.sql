IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '872eac05-7081-4c9a-8081-c6887bb559d4'
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
        '872eac05-7081-4c9a-8081-c6887bb559d4',
        'Project Supper View',
        'Project Supper View',
        'Project Supper View',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        '2026-05-19 16:00:26.410',
        '8c98df6d-95dd-456c-a649-db7393465536',
        NULL,
        NULL
    );
END
GO