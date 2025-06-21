BEGIN
    -- Check if the RoleCode already exists to prevent duplicate entries
    IF NOT EXISTS (
        SELECT 1 FROM [dbo].[TSys_Role] 
        WHERE [RoleCode] = 'Approve Supplier'
    )
    BEGIN
        -- Insert the new role
        INSERT INTO [dbo].[TSys_Role]
            ([RoleId]
            ,[RoleCode]
            ,[RoleName]
            ,[Description]
            ,[IsActive]
            ,[OrganizationId]
            ,[OrganizationCode]
            ,[BusinessUnitId]
            ,[BusinessUnitCode]
            ,[CreatedDateTime]
            ,[CreatedUserId]
            ,[UpdatedDateTime]
            ,[UpdatedUserId])
        VALUES
            ('28c9c487-a75d-4c1c-ab5f-a64ce310c421' -- RoleId
            ,'Approve Supplier' -- RoleCode
            ,'Approve Supplier' -- RoleName
            ,'Approve Supplier' -- Description
            ,1 -- IsActive (True = 1)
            ,'bae027a7-2fa5-41ba-8753-1450fd21b181' -- OrganizationId
            ,'O0001' -- OrganizationCode
            ,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a' -- BusinessUnitId
            ,'B0001' -- BusinessUnitCode
            ,'2025-04-11 10:40' -- CreatedDateTime
            ,'d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d' -- CreatedUserId
            ,NULL -- UpdatedDateTime
            ,NULL); -- UpdatedUserId

        PRINT 'Insert successful into TSys_Role.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Role with the given RoleCode already exists in TSys_Role.';
    END
END
