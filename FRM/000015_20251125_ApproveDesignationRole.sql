IF NOT EXISTS (
    SELECT 1 FROM [dbo].[TSys_Role]
    WHERE [RoleId] = '22a81f80-b29b-40a5-b85d-a06dd293212e'
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
        '22a81f80-b29b-40a5-b85d-a06dd293212e',  -- RoleId
        'Approve Designation',                   -- RoleCode
        'Approve Designation',                   -- RoleName
        'Approve Designation',                   -- Description
        1,                                       -- IsActive (True)
        'bae027a7-2fa5-41ba-8753-1450fd21b181',  -- OrganizationId
        'O0001',                                 -- OrganizationCode
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',  -- BusinessUnitId
        'B0001',                                 -- BusinessUnitCode
        '2025-11-04 11:52:27.160',               -- CreatedDateTime
        '8c98df6d-95dd-456c-a649-db7393465536',  -- CreatedUserId
        NULL,                                    -- UpdatedDateTime
        NULL                                     -- UpdatedUserId
    );
END;
GO
IF NOT EXISTS (
    SELECT 1 FROM [dbo].[TSys_Role]
    WHERE [RoleId] = '22a81f80-b29b-40a5-b85d-a06dd293212e'
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
        '22a81f80-b29b-40a5-b85d-a06dd293212e',  -- RoleId
        'Approve Designation',                   -- RoleCode
        'Approve Designation',                   -- RoleName
        'Approve Designation',                   -- Description
        1,                                       -- IsActive (True)
        'bae027a7-2fa5-41ba-8753-1450fd21b181',  -- OrganizationId
        'O0001',                                 -- OrganizationCode
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',  -- BusinessUnitId
        'B0001',                                 -- BusinessUnitCode
        '2025-11-04 11:52:27.160',               -- CreatedDateTime
        '8c98df6d-95dd-456c-a649-db7393465536',  -- CreatedUserId
        NULL,                                    -- UpdatedDateTime
        NULL                                     -- UpdatedUserId
    );
END;
GO
