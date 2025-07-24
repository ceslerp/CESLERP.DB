IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[hrm_EmployeeTransition]') 
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[hrm_EmployeeTransition] (
        [EmployeeTransitionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
        [EmployeeId] UNIQUEIDENTIFIER NOT NULL,
        [TransitionTypeId] UNIQUEIDENTIFIER NOT NULL,
        [COEUnitId] UNIQUEIDENTIFIER NULL,
        [SOEUnitId] UNIQUEIDENTIFIER NULL,
        [DesignationId] UNIQUEIDENTIFIER NULL,
        [PostId] UNIQUEIDENTIFIER NULL,
        [GradeId] UNIQUEIDENTIFIER NULL,
        [Comment] NVARCHAR(MAX) NULL,
        [EffectiveDate] DATETIME NULL,
        [DataStatus] INT NOT NULL DEFAULT ((1)),
        [CreatedDateTime] DATETIME NOT NULL,
        [CreatedUserId] UNIQUEIDENTIFIER NOT NULL,
        [UpdatedDateTime] DATETIME NULL,
        [UpdatedUserId] UNIQUEIDENTIFIER NULL,
        [ApprovedDateTime] DATETIME NULL,
        [ApprovedUserId] UNIQUEIDENTIFIER NULL,
        [TypeOfTransaction] INT NULL,
        [TypeOfRelease] INT NULL,
        [Reason] NVARCHAR(255) NULL,
        [LeaveStartDate] DATETIME NULL,
        [LeaveEndDate] DATETIME NULL,
        [NoticePeriod] NVARCHAR(10) NULL,
        [NoticePeriodStartDate] DATETIME NULL,
        [NoticePeriodEndDate] DATETIME NULL,
        [RetirementDate] DATETIME NULL,
        [IsActive] BIT NULL,
        [TypeOfLeave] NCHAR(10) NULL
    );
END
ELSE
BEGIN
    PRINT 'Table [hrm_EmployeeTransition] already exists.';
END
