USE [FRM]
GO


IF NOT EXISTS (
SELECT 1
FROM [dbo].[TSys_Role]
WHERE RoleId = '0e2ccb9e-aa17-46d3-a4b5-162345ebd3b4'
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
'0e2ccb9e-aa17-46d3-a4b5-162345ebd3b4',
'Add Item',
'Add Item',
'Add Item',
1,
'bae027a7-2fa5-41ba-8753-1450fd21b181',
'O0001',
'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
'B0001',
GETDATE(),
'8c98df6d-95dd-456c-a649-db7393465536',
NULL,
NULL
)
END
GO

IF NOT EXISTS (
SELECT 1
FROM [dbo].[TSys_Role]
WHERE RoleId = '0d6d96fd-3f8e-4008-bd23-dd0bf8073976'
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
'0d6d96fd-3f8e-4008-bd23-dd0bf8073976',
'View Item',
'View Item',
'View Item',
1,
'bae027a7-2fa5-41ba-8753-1450fd21b181',
'O0001',
'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
'B0001',
GETDATE(),
'8c98df6d-95dd-456c-a649-db7393465536',
NULL,
NULL
)
END
GO

IF NOT EXISTS (
SELECT 1
FROM [dbo].[TSys_Role]
WHERE RoleId = '18090606-ff30-4643-9940-13d509db29d6'
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
'18090606-ff30-4643-9940-13d509db29d6',
'Approve Item',
'Approve Item',
'Approve Item',
1,
'bae027a7-2fa5-41ba-8753-1450fd21b181',
'O0001',
'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',
'B0001',
GETDATE(),
'8c98df6d-95dd-456c-a649-db7393465536',
NULL,
NULL
)
END
GO
