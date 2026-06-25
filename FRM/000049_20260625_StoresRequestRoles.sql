USE [FRM2]
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
    'C1F0766A-859D-409B-A47F-54AB0503B16D',
    'Approve Stores Request',
    'Approve Stores Request',
    'Approve Stores Request',
    1,
    'BAE027A7-2FA5-41BA-8753-1450FD21B181',
    'O0001',
    'F8AD62EE-8FC1-41C8-BF8D-2F1DFEBD1D0A',
    'B0001',
    '2026-06-22 16:56:50.587',
    '8C98DF6D-95DD-456C-A649-DB7393465536',
    NULL,
    NULL
),
(
    'F7B60A22-0CE6-466A-8D7D-6A7906E350E3',
    'Add Stores Request',
    'Add Stores Request',
    'Add Stores Request',
    1,
    'BAE027A7-2FA5-41BA-8753-1450FD21B181',
    'O0001',
    'F8AD62EE-8FC1-41C8-BF8D-2F1DFEBD1D0A',
    'B0001',
    '2026-06-22 16:55:14.317',
    '8C98DF6D-95DD-456C-A649-DB7393465536',
    NULL,
    NULL
),
(
    '4E852045-1FD3-4334-B3F8-D0A3EB12C0D2',
    'Add&ApproveStoresRequest',
    'Add&ApproveStoresRequest',
    'Add&ApproveStoresRequest',
    1,
    'BAE027A7-2FA5-41BA-8753-1450FD21B181',
    'O0001',
    'F8AD62EE-8FC1-41C8-BF8D-2F1DFEBD1D0A',
    'B0001',
    '2026-06-22 17:10:31.520',
    '8C98DF6D-95DD-456C-A649-DB7393465536',
    NULL,
    NULL
);
GO