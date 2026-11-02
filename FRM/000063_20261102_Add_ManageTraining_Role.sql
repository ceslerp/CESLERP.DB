USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE [RoleId] = '81d78a64-4103-42ba-ad17-bfab5ebffc02'
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
        '81d78a64-4103-42ba-ad17-bfab5ebffc02',   -- RoleId
        'ManageTrainingProgrammes',               -- RoleCode
        'ManageTrainingProgrammes',               -- RoleName
        'ManageTrainingProgrammes',               -- Description
        1,                                        -- IsActive
        'bae027a7-2fa5-41ba-8753-1450fd21b181',   -- OrganizationId
        'O0001',                                  -- OrganizationCode
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',   -- BusinessUnitId
        'B0001',                                  -- BusinessUnitCode
        '2026-11-02 16:18:57.760',                -- CreatedDateTime
        '8c98df6d-95dd-456c-a649-db7393465536',   -- CreatedUserId
        NULL,                                     -- UpdatedDateTime
        NULL                                      -- UpdatedUserId
    );
END;
GO