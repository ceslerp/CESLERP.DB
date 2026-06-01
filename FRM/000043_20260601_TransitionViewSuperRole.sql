IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '6941ef5f-b99d-479b-840e-ee99de12ffb5'
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
        '6941ef5f-b99d-479b-840e-ee99de12ffb5',
        'View Supper Transition',
        'View Supper Transition',
        'View Supper Transition',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        '2026-06-01 09:52:34.950',
        '8c98df6d-95dd-456c-a649-db7393465536',
        NULL,
        NULL
    );
END
GO