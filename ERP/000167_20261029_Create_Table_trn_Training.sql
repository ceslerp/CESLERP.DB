IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[trn_Training]') 
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[trn_Training] (
        [TrainingId] UNIQUEIDENTIFIER NOT NULL 
            DEFAULT NEWSEQUENTIALID() PRIMARY KEY,
        [Title] NVARCHAR(200) NOT NULL,
        [Venue] NVARCHAR(200) NULL,
        [EventDate] DATE NOT NULL,                          -- Sri Lanka local date of the event
        [RegistrationDeadline] DATETIME2(0) NOT NULL,       -- UTC
        [RegistrationQrToken] UNIQUEIDENTIFIER NOT NULL 
            DEFAULT NEWID() UNIQUE,                         -- random, encoded in Registration QR
        [AttendanceQrToken] UNIQUEIDENTIFIER NOT NULL 
            DEFAULT NEWID() UNIQUE,                         -- random, encoded in Attendance QR
        [IsActive] BIT NOT NULL DEFAULT 1,
        [CreatedDateTime] DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),  -- UTC
        [CreatedUserId] UNIQUEIDENTIFIER NOT NULL,          -- EmployeeId of creator
        [UpdatedDateTime] DATETIME2(0) NULL,                -- UTC
        [UpdatedUserId] UNIQUEIDENTIFIER NULL,              -- EmployeeId of last editor

        CONSTRAINT [CK_trn_Training_QrTokensDifferent] 
            CHECK ([RegistrationQrToken] <> [AttendanceQrToken])
    );
END
ELSE
BEGIN
    PRINT 'Table [trn_Training] already exists.';
END
GO