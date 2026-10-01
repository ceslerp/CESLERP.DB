IF NOT EXISTS
(
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[hrm_EmployeeCV]')
      AND type = N'U'
)
BEGIN

    CREATE TABLE [dbo].[hrm_EmployeeCV]
    (
	EmployeeCVId UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_hrm_EmployeeCV PRIMARY KEY,
    EmployeeId   UNIQUEIDENTIFIER NOT NULL,        
    AttachmentId UNIQUEIDENTIFIER NOT NULL

           );

    PRINT 'Table [dbo].[hrm_EmployeeCV] created successfully.';

END
ELSE
BEGIN
    PRINT 'Table [dbo].[hrm_EmployeeCV] already exists.';
END
GO