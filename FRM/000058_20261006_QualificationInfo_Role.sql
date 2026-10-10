USE [FRM];
GO

IF EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE [RoleId] = 'ff1d5764-00c6-4404-b2e5-b01a261fecb3'
)
BEGIN
    UPDATE [dbo].[TSys_Role]
    SET
        [RoleCode]         = 'View Qualification Info',
        [RoleName]         = 'View Qualification Info',
        [Description]      = 'View Qualification Info',
        [IsActive]         = 1,
        [OrganizationId]   = 'bae027a7-2fa5-41ba-8753-1450fd21b181',
        [OrganizationCode] = 'O0001',
        [BusinessUnitId]   = 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        [BusinessUnitCode] = 'B0001',
        [CreatedDateTime]  = '2026-10-06T16:23:07.830',
        [CreatedUserId]    = 'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
        [UpdatedDateTime]  = NULL,
        [UpdatedUserId]    = NULL
    WHERE [RoleId] = 'ff1d5764-00c6-4404-b2e5-b01a261fecb3';
END
ELSE
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
        'ff1d5764-00c6-4404-b2e5-b01a261fecb3',
        'View Qualification Info',
        'View Qualification Info',
        'View Qualification Info',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        '2026-10-06T16:23:07.830',
        'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
        NULL,
        NULL
    );
END;
GO