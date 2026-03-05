USE [FRM]
GO

-- Apply Attendance
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '0e28049b-0c39-4b67-adeb-2c6f76e37515'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        (
         '0e28049b-0c39-4b67-adeb-2c6f76e37515',
         'Apply Attendance',
         'Apply Attendance',
         'Apply Attendance',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181','O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','B0001',
         '2026-03-05 18:05:05.683',
         'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
         NULL,NULL
        )
END
GO


-- Add Attendance
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = '56582ff2-56a0-4103-97ab-e43eaeb5addd'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        (
         '56582ff2-56a0-4103-97ab-e43eaeb5addd',
         'Add Attendance',
         'Add Attendance',
         'Add Attendance',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181','O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','B0001',
         '2026-03-05 18:03:59.770',
         'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
         NULL,NULL
        )
END
GO


-- Approve Attendance
IF NOT EXISTS (
    SELECT 1 
    FROM [dbo].[TSys_Role] 
    WHERE RoleId = 'd5ecaf5b-f4ad-4a8c-abd9-eaceed387939'
)
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive],
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode],
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        (
         'd5ecaf5b-f4ad-4a8c-abd9-eaceed387939',
         'Approve Attendance',
         'Approve Attendance',
         'Approve Attendance',
         1,
         'bae027a7-2fa5-41ba-8753-1450fd21b181','O0001',
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','B0001',
         '2026-03-05 18:04:14.050',
         'e1c3d9d0-0bac-4f44-bad3-9c30273b5d7d',
         NULL,NULL
        )
END
GO
