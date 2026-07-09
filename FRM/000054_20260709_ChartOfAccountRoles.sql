USE [FRM]
GO
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '57136700-4d9f-4997-a41c-48ee03266168'
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
        '57136700-4d9f-4997-a41c-48ee03266168',
        'Add Chart Of Account',
        'Add Chart Of Account',
        'Add Chart Of Account',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        GETDATE(),
        '8c98df6d-95dd-456c-a649-db7393465536',
        NULL,
        NULL
    )
END
GO
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '9cf429d9-3f39-4ce5-b242-13e7214594dd'
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
        '9cf429d9-3f39-4ce5-b242-13e7214594dd',
        'View Chart Of Account',
        'View Chart Of Account',
        'View Chart Of Account',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        GETDATE(),
        '8c98df6d-95dd-456c-a649-db7393465536',
        NULL,
        NULL
    )
END
GO
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'eae67082-a637-4439-b41f-05d9d54adbb5'
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
        'eae67082-a637-4439-b41f-05d9d54adbb5',
        'Approve Chart Of Account',
        'Approve Chart Of Account',
        'Approve Chart Of Account',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        GETDATE(),
        '8c98df6d-95dd-456c-a649-db7393465536',
        NULL,
        NULL
    )
END
GO
