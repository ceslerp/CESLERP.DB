UPDATE [FRM].[dbo].[TSys_Role]
SET 
    RoleCode        = 'Super View Transition',
    RoleName        = 'Super View Transition',
    Description     = 'Super View Transition',
    UpdatedDateTime = GETDATE()
WHERE RoleId = '6941ef5f-b99d-479b-840e-ee99de12ffb5';

UPDATE [FRM].[dbo].[TSys_Role]
SET 
    RoleCode        = 'Super View Project',
    RoleName        = 'Super View Project',
    Description     = 'Super View Project',
    UpdatedDateTime = GETDATE()
WHERE RoleId = '872eac05-7081-4c9a-8081-c6887bb559d4';

UPDATE [FRM].[dbo].[TSys_Role]
SET 
    RoleCode        = 'View Transition',
    RoleName        = 'View Transition',
    Description     = 'View Transition',
    UpdatedDateTime = GETDATE()
WHERE RoleId = '1d9bced4-27e9-4fd7-b5a7-76a999800724';

UPDATE [FRM].[dbo].[TSys_Role]
SET 
    RoleCode        = 'View Project',
    RoleName        = 'View Project',
    Description     = 'View Project',
    UpdatedDateTime = GETDATE()
WHERE RoleId = 'e8d234c7-b1c7-47a7-b802-9a0c75783be1';

UPDATE [FRM].[dbo].[TSys_Role]
SET 
    RoleCode        = 'Super Transition',
    RoleName        = 'Super Transition',
    Description     = 'Super Transition',
    UpdatedDateTime = GETDATE()
WHERE RoleId = '7a8f4303-75e2-4825-8a8d-5c8b72c45d42';