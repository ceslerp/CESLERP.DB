USE [FRM]
GO

/* =====================================================
   Add Holiday
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'c2660954-c85a-4236-911e-2ed082ebe350'
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
            'c2660954-c85a-4236-911e-2ed082ebe350',
            'Add Holiday',
            'Add Holiday',
            'Add new holiday',
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


/* =====================================================
   View Holiday
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'e0411894-1666-450a-b130-a78dda154e4d'
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
            'e0411894-1666-450a-b130-a78dda154e4d',
            'View Holiday',
            'View Holiday',
            'View holiday',
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


/* =====================================================
   Approve Holiday
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '2be1b8ad-dd59-4791-954b-72c325b50553'
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
            '2be1b8ad-dd59-4791-954b-72c325b50553',
            'Approve Holiday',
            'Approve Holiday',
            'Approve holiday',
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
