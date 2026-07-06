USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'a76190fe-698a-4d62-ab96-d48c840f8c19'
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
            'a76190fe-698a-4d62-ab96-d48c840f8c19',
            'Upload Circular',
            'Upload Circular',
            'Upload Circular',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2026-07-06 15:48:38.780',
            '953bdd9d-43d3-43f3-a301-30bb9985a219',
            NULL,
            NULL
        )
END
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = 'ecd87e0c-fb79-463d-89b4-60285edc655c'
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
            'ecd87e0c-fb79-463d-89b4-60285edc655c',
            'Upload Control Document',
            'Upload Control Document',
            'Upload Control Document',
            1,
            'bae027a7-2fa5-41ba-8753-1450fd21b181',
            'O0001',
            'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
            'B0001',
            '2026-07-06 16:03:35.693',
            '953bdd9d-43d3-43f3-a301-30bb9985a219',
            NULL,
            NULL
        )
END
GO
