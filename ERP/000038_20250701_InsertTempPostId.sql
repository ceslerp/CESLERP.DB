USE [ERP]
GO

INSERT INTO [dbo].[hrm_Post]
    ([PostId], [PostCode], [PostName], [IsActive], [BusinessUnitId], [OrganizationId], [CreatedDateTime], 
	[CreatedUserId], [UpdatedDateTime], [UpdatedUserId])
VALUES
    ('29236937-3e03-4839-bdbc-452aaaeada78', 'PST00999', 'TempPost', 'True', 'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a', 
     'bae027a7-2fa5-41ba-8753-1450fd21b181', '2025-07-01 10:29:13.657', 'a0214f87-a66a-4dc4-96b1-e76faedc7414', NULL, NULL)
GO