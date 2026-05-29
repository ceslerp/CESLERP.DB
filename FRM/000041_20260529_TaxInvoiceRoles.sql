USE [FRM]
GO

-- Add TaxInvoice
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '13fa1bdd-29f8-4a93-bf9f-7ef20d1940ac'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('13fa1bdd-29f8-4a93-bf9f-7ef20d1940ac',
         'Add TaxInvoice',
         'Add TaxInvoice',
         'Add TaxInvoice',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-05-29 13:10:49.223',
         'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
         NULL, NULL)
END
GO

-- Approve TaxInvoice
IF NOT EXISTS (
    SELECT 1
    FROM [dbo].[TSys_Role]
    WHERE RoleId = '6c2030c8-1771-4214-ae21-d536d86c0ca4'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('6c2030c8-1771-4214-ae21-d536d86c0ca4',
         'Approve TaxInvoice',
         'Approve TaxInvoice',
         'Approve TaxInvoice',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181', 'O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 'B0001',
         '2026-05-29 13:11:01.040',
         'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
         NULL, NULL)
END
GO
