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
