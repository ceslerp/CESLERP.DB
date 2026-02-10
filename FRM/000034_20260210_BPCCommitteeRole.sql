USE [FRM];
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
    'a13d3a0f-cef6-4f5c-be4d-2a9f657a0059', 
    'Approve BPC Committee',               
    'Approve BPC Committee',                
    'Approve BPC Committee',                 
    1,                                       
    'bae027a7-2fa5-41ba-8753-1450fd21b181', 
    'O0001',                                 
    'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 
    'B0001',                                 
    '2026-02-10 11:21:28.457',              
    '8c98df6d-95dd-456c-a649-db7393465536',
    NULL,                                   
    NULL                                     
);

COMMIT TRANSACTION;
GO
