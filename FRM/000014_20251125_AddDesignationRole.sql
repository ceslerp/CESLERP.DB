IF NOT EXISTS (
    SELECT 1 FROM [dbo].[TSys_Role]
    WHERE [RoleId] = 'ce1d8095-ce68-4c53-ac0b-dee05b581d8b'
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
        'ce1d8095-ce68-4c53-ac0b-dee05b581d8b',  -- RoleId
        'Add Designation',                       -- RoleCode
        'Add Designation',                       -- RoleName
        'Add Designation',                       -- Description
        1,                                       -- IsActive (True)
        'bae027a7-2fa5-41ba-8753-1450fd21b181',  -- OrganizationId
        'O0001',                                 -- OrganizationCode
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',  -- BusinessUnitId
        'B0001',                                 -- BusinessUnitCode
        '2025-11-04 11:52:08.777',               -- CreatedDateTime
        '8c98df6d-95dd-456c-a649-db7393465536',  -- CreatedUserId
        NULL,                                    -- UpdatedDateTime
        NULL                                     -- UpdatedUserId
    );
END;
GO
