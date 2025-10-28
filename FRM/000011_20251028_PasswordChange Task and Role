
USE [FRM]
GO

-- Security Password Change
IF NOT EXISTS (SELECT 1 FROM [dbo].[TSys_Task] WHERE TaskId = '4ee16c59-345b-4255-9206-cd5bdafb05a9')
BEGIN
    INSERT INTO [dbo].[TSys_Task]
        ([TaskId], [TaskCode], [TaskShortName], [TaskName], [Description], [DomainId], [LicenceId], 
         [TaskNumber], [ImageURL], [NavigateURL], [Controller], [Action], [IsActive], [Module], 
         [X], [Y], [Width], [Height], [TileGroup], [TileTitle], [TileContent], [TileClass], 
         [TileStyle], [IsShowAsTile])
    VALUES
        ('4ee16c59-345b-4255-9206-cd5bdafb05a9',  -- TaskId
         'FRM_PasswordChange',                    -- TaskCode
         'PasswordChange',                        -- TaskShortName
         'Password Change',                       -- TaskName
         'Password Change',                       -- Description
         NULL,                                    -- DomainId
         NULL,                                    -- LicenceId
         2019,                                    -- TaskNumber
         NULL,                                    -- ImageURL
         '/PasswordChange/index',                 -- NavigateURL
         'PasswordChange',                        -- Controller
         NULL,                                    -- Action
         1,                                       -- IsActive (True)
         'FRM',                                   -- Module
         NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
         1)                                       -- IsShowAsTile (True)
END
GO


USE [FRM]
GO

-- Password Change Role
IF NOT EXISTS (SELECT 1 FROM [dbo].[TSys_Role] WHERE RoleId = 'a28c9839-0c3d-4b83-b634-141225a83977')
BEGIN
    INSERT INTO [dbo].[TSys_Role]
        ([RoleId], [RoleCode], [RoleName], [Description], [IsActive], 
         [OrganizationId], [OrganizationCode], [BusinessUnitId], [BusinessUnitCode], 
         [CreatedDateTime], [CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
    VALUES
        ('a28c9839-0c3d-4b83-b634-141225a83977',  -- RoleId
         'Password Change',                       -- RoleCode
         'Password Change',                       -- RoleName
         'Password Change',                       -- Description
         1,                                       -- IsActive (True)
         'bae027a7-2fa5-41ba-8753-1450fd21b181',  -- OrganizationId
         'O0001',                                 -- OrganizationCode
         'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',  -- BusinessUnitId
         'B0001',                                 -- BusinessUnitCode
         '2025-10-28 14:05:05.340',               -- CreatedDateTime
         '2a9186ef-a859-4888-bb67-340b4f0fda22',  -- CreatedUserId
         NULL,                                    -- UpdatedDateTime
         NULL)                                    -- UpdatedUserId
END
GO


