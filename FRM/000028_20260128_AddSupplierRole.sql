USE [FRM]
GO

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
    '3dbdc5e3-fd3f-4e4b-8f46-832957687aca',
    'Add Supplier',
    'Add Supplier',
    'Add Supplier',
    1,
    'bae027a7-2fa5-41ba-8753-1450fd21b181',
    'O0001',
    'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
    'B0001',
    '2026-01-28 08:39:06.873',
    '8c98df6d-95dd-456c-a649-db7393465536',
    NULL,
    NULL
);
GO
