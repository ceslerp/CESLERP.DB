IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[trn_TrainingParticipant]') 
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[trn_TrainingParticipant] (
        [TrainingParticipantId] UNIQUEIDENTIFIER NOT NULL 
            DEFAULT NEWSEQUENTIALID() PRIMARY KEY,
        [TrainingId] UNIQUEIDENTIFIER NOT NULL,
        [EmployeeId] UNIQUEIDENTIFIER NOT NULL,
        [WorkSpaceId] UNIQUEIDENTIFIER NULL,                -- COE unit (base) at the time of registration
        [RegisteredDateTime] DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),  -- UTC
        [AttendedDateTime] DATETIME2(0) NULL,               -- UTC, NULL until attendance is marked

        CONSTRAINT [FK_trn_TrainingParticipant_Training] 
            FOREIGN KEY ([TrainingId]) REFERENCES [dbo].[trn_Training] ([TrainingId]),
        CONSTRAINT [UQ_trn_TrainingParticipant_Training_Employee] 
            UNIQUE ([TrainingId], [EmployeeId])
    );
END
ELSE
BEGIN
    PRINT 'Table [trn_TrainingParticipant] already exists.';
END
GO

-- Index for the admin participants summary (filter by base / attended)
IF NOT EXISTS (
    SELECT 1 
    FROM sys.indexes 
    WHERE name = N'IX_trn_TrainingParticipant_Training_WorkSpace' 
      AND object_id = OBJECT_ID(N'[dbo].[trn_TrainingParticipant]')
)
BEGIN
    CREATE NONCLUSTERED INDEX [IX_trn_TrainingParticipant_Training_WorkSpace]
        ON [dbo].[trn_TrainingParticipant] ([TrainingId], [WorkSpaceId])
        INCLUDE ([EmployeeId], [RegisteredDateTime], [AttendedDateTime]);
END
ELSE
BEGIN
    PRINT 'Index [IX_trn_TrainingParticipant_Training_WorkSpace] already exists.';
END
GO