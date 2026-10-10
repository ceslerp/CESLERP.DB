USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE [RoleId] = '0b2f6ea6-a24f-4e4a-b398-72271fd6aaf3'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role] (
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
    VALUES (
        '0b2f6ea6-a24f-4e4a-b398-72271fd6aaf3',   -- RoleId
        'Upload General Document',                -- RoleCode
        'Upload General Document',                -- RoleName
        'Upload General Document',                -- Description
        1,                                        -- IsActive
        'bae027a7-2fa5-41ba-8753-1450fd21b181',   -- OrganizationId
        'O0001',                                  -- OrganizationCode
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',   -- BusinessUnitId
        'B0001',                                  -- BusinessUnitCode
        '2026-10-10 10:53:44.360',                -- CreatedDateTime
        '8c98df6d-95dd-456c-a649-db7393465536',   -- CreatedUserId
        NULL,                                     -- UpdatedDateTime
        NULL                                      -- UpdatedUserId
    );
END;
GO