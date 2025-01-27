IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[pm_ExtendJobCode]') AND type = N'U')
BEGIN
    CREATE TABLE [pm_ExtendJobCode] (
        [ExtendJobCodeId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
		[WorkSpaceId] UNIQUEIDENTIFIER NOT NULL,
		[ProjectId] UNIQUEIDENTIFIER NOT NULL,
		[PreviousScheduledDateOfCompletion] DATETIME NOT NULL,
		[PreviousEstimatedValue] DECIMAL(18, 2) NOT NULL DEFAULT 0.00,
		[PreviousAnticipatedProfit] DECIMAL(18, 2) NOT NULL DEFAULT 0.00,
		[ScheduledDateOfCompletion] DATETIME NOT NULL,
		[EstimatedValue] DECIMAL(18, 2) NOT NULL DEFAULT 0.00,
		[AnticipatedProfit] DECIMAL(18, 2) NOT NULL DEFAULT 0.00,
		[CreatedDateTime] DATETIME NOT NULL DEFAULT (GETDATE()),
		[CreatedUserId] UNIQUEIDENTIFIER NOT NULL
    );
	PRINT 'Tables [pm_ExtendJobCode] created successfully.';
END
ELSE
BEGIN
    PRINT 'Table [pm_ExtendJobCode] already exists.';
END