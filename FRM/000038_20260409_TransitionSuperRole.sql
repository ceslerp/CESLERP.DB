USE [FRM]
GO

/* =====================================================
   Transition Super Role
   ===================================================== */
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '7a8f4303-75e2-4825-8a8d-5c8b72c45d42'
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
            '7a8f4303-75e2-4825-8a8d-5c8b72c45d42',
            'Transition Super Role',
            'Transition Super Role',
            'Transition Super Role',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2026-04-07 15:23:30.270',
            '8c98df6d-95dd-456c-a649-db7393465536',
            NULL,
            NULL
        )
END
GO