USE [FRM]
GO

/* =====================================================
   Add Work Unit
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'ba210c6b-e702-46e9-bcbc-a6284a2de83b'
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
            'ba210c6b-e702-46e9-bcbc-a6284a2de83b',
            'Add work unit',
            'Add work unit',
            'Add work unit',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2025-12-08 11:54:56.997',
            '8c98df6d-95dd-456c-a649-db7393465536',
            NULL,
            NULL
        )
END
GO


/* =====================================================
   Approve Work Unit
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '583961eb-e232-44b2-8520-ba5697083a4b'
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
            '583961eb-e232-44b2-8520-ba5697083a4b',
            'Approve work unit',
            'Approve work unit',
            'Approve work unit',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2025-12-08 11:55:15.880',
            '8c98df6d-95dd-456c-a649-db7393465536',
            NULL,
            NULL
        )
END
GO
