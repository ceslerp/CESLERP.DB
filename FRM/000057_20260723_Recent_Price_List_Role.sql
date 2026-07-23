USE [FRM]
GO

IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '378b824a-4167-421f-9551-6781ccd6f6cd'
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
        '378b824a-4167-421f-9551-6781ccd6f6cd',
        'Recent Price List',
        'Recent Price List',
        'Recent Price List',
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',
        'O0001',
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
        'B0001',
        GETDATE(),
        'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
        NULL,
        NULL
    )
END
GO
