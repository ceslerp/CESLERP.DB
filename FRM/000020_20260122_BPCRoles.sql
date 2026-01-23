USE [FRM]
GO

BEGIN TRANSACTION;

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
    'b4ae92b9-b4bd-4380-84fa-9f601a17aefa',
    'View BPC Paper',
    'View BPC Paper',
    'View BPC Paper',
    1,
    'bae027a7-2fa5-41ba-8753-1450fd21b181',
    'O0001',
    'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
    'B0001',
    '2026-01-22 11:13:44.707',
    '8c98df6d-95dd-456c-a649-db7393465536',
    NULL,
    NULL
),
(
    'f3bbabbd-2132-422d-b6e5-d80afbe3bd42',
    'Approve BPC Paper',
    'Approve BPC Paper',
    'Approve BPC Paper',
    1,
    'bae027a7-2fa5-41ba-8753-1450fd21b181',
    'O0001',
    'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
    'B0001',
    '2026-01-21 09:20:53.747',
    '8c98df6d-95dd-456c-a649-db7393465536',
    NULL,
    NULL
),
(
    'c28e14f8-405d-4cf9-832b-d04574c74d76',
    'Add BPC Paper',
    'Add BPC Paper',
    'Add BPC Paper',
    1,
    'bae027a7-2fa5-41ba-8753-1450fd21b181',
    'O0001',
    'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
    'B0001',
    '2026-01-21 09:17:50.467',
    '8c98df6d-95dd-456c-a649-db7393465536',
    NULL,
    NULL
),
(
    'cede1f19-c378-4ca3-8907-4bcd8ee1c62f',
    'Add BPC Comitee',
    'Add BPC Comitee',
    'Add BPC Comitee',
    1,
    'bae027a7-2fa5-41ba-8753-1450fd21b181',
    'O0001',
    'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
    'B0001',
    '2026-01-13 10:53:35.040',
    '8c98df6d-95dd-456c-a649-db7393465536',
    NULL,
    NULL
);

COMMIT TRANSACTION;
GO
