USE [FRM]
GO

/* =====================================================
   Add Post
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'd639552c-06bb-4ba4-bb51-009a5b574c68'
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
            'd639552c-06bb-4ba4-bb51-009a5b574c68',
            'Add Post',
            'Add Post',
            'Add Post',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2026-01-21 12:28:33.780',
            '8c98df6d-95dd-456c-a649-db7393465536',
            NULL,
            NULL
        )
END
GO


/* =====================================================
   View Post
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '005cb017-2be6-4638-a414-608fd7c7132b'
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
            '005cb017-2be6-4638-a414-608fd7c7132b',
            'View Post',
            'View Post',
            'View Post',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2026-01-21 12:29:47.990',
            '8c98df6d-95dd-456c-a649-db7393465536',
            NULL,
            NULL
        )
END
GO


/* =====================================================
   Approve Post
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '639c73f8-c180-4ed8-ad06-cdac1a25eb30'
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
            '639c73f8-c180-4ed8-ad06-cdac1a25eb30',
            'Approve Post',
            'Approve Post',
            'Approve Post',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2026-01-21 12:29:18.140',
            '8c98df6d-95dd-456c-a649-db7393465536',
            NULL,
            NULL
        )
END
GO
