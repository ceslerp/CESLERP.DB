USE [FRM]
GO

-- View Tax Invoice
IF NOT EXISTS (
SELECT 1
FROM [dbo].[TSys_Role]
WHERE RoleId = 'b122e559-fe5d-4849-b263-a3e3f54f8bc4'
)
BEGIN
INSERT INTO [dbo].[TSys_Role]
([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
[OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
[CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
VALUES
('b122e559-fe5d-4849-b263-a3e3f54f8bc4',
'View Tax Invoice',
'View Tax Invoice',
'View Tax Invoice',
1,
'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
'2026-06-09 10:39:05.247',
'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
NULL, NULL)
END
GO

-- Super View Tax Invoice
IF NOT EXISTS (
SELECT 1
FROM [dbo].[TSys_Role]
WHERE RoleId = 'b6a369bc-c86c-465d-84ab-94aab664eb88'
)
BEGIN
INSERT INTO [dbo].[TSys_Role]
([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
[OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
[CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
VALUES
('b6a369bc-c86c-465d-84ab-94aab664eb88',
'Super View Tax Invoice',
'Super View Tax Invoice',
'Super View Tax Invoice',
1,
'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
'2026-06-09 10:39:38.623',
'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
NULL, NULL)
END
GO
