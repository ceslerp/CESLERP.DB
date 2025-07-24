IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[hrm_EmployeeTransitionType]') 
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[hrm_EmployeeTransitionType] (
        [EmployeeTransitionTypeId] UNIQUEIDENTIFIER NOT NULL 
            DEFAULT NEWSEQUENTIALID() PRIMARY KEY,
        [Name] NVARCHAR(255) NOT NULL UNIQUE
    );
END
ELSE
BEGIN
    PRINT 'Table [hrm_EmployeeTransitionType] already exists.';
END
GO

-- Insert values (avoiding duplicate inserts)
MERGE [dbo].[hrm_EmployeeTransitionType] AS target
USING (
    VALUES
        ('10432d6d-72bb-4a74-bc58-a6704b9f3446', 'Attach To Ministry'),
        ('5f0dd074-f04d-41b8-9cc3-408bde42af7b', 'Back To Cecb'),
        ('0ada5785-2566-4138-ae9c-1f261d5e545a', 'Expiration'),
        ('d9d43e24-9a21-40d2-b2bc-7775bbaa107f', 'No Pay Leave'),
        ('5d0a5639-9e60-4c90-ad71-def539041c68', 'Passed Away'),
        ('92d826e8-f6d1-4bdd-8bc5-b46e1c3648ae', 'Promotion'),
        ('ed04847b-df53-44c6-a60e-febdc60703dd', 'Rejoin'),
        ('35bc84cc-3d97-4a74-8d20-5d9efcfd49f0', 'Retirement'),
        ('e9fb9493-e657-45d8-b077-d2f92790ef82', 'Suspended'),
        ('a0671fb3-f14b-47c1-92c7-0cd50270c18d', 'Transfer'),
        ('8e149372-dd26-4a16-8b7c-bfb1ca17c879', 'Transfer To Cecb'),
        ('5e978e88-e321-4394-a403-70e150316e17', 'Vacated Of Post')
) AS source (EmployeeTransitionTypeId, Name)
ON target.EmployeeTransitionTypeId = source.EmployeeTransitionTypeId
WHEN NOT MATCHED BY TARGET THEN
    INSERT (EmployeeTransitionTypeId, Name)
    VALUES (source.EmployeeTransitionTypeId, source.Name);
