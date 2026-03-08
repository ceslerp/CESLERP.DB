-- AttendanceTypeId
IF COL_LENGTH('dbo.hrm_CircuitAttendance', 'AttendanceTypeId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_CircuitAttendance
    ADD AttendanceTypeId UNIQUEIDENTIFIER NULL;
END


-- Approval / Reject / Discard columns
IF COL_LENGTH('dbo.hrm_CircuitAttendance', 'ApprovedDateTime') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_CircuitAttendance
    ADD
        ApprovedDateTime DATETIME NULL,
        ApprovedUserId UNIQUEIDENTIFIER NULL,

        RejectedDateTime DATETIME NULL,
        RejectedUserId UNIQUEIDENTIFIER NULL,

        DiscardedDateTime DATETIME NULL,
        DiscardedUserId UNIQUEIDENTIFIER NULL;
END


-- Update tracking columns
IF COL_LENGTH('dbo.hrm_CircuitAttendance', 'UpdatedUserId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_CircuitAttendance
    ADD
        UpdatedUserId UNIQUEIDENTIFIER NULL,
        UpdatedDateTime DATETIME NULL;
END

    --Reject Comment and Discard Comment
IF COL_LENGTH('dbo.hrm_CircuitAttendance', 'RejectComment') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_CircuitAttendance
    ADD RejectComment VARCHAR(MAX) NULL;
END

IF COL_LENGTH('dbo.hrm_CircuitAttendance', 'DiscardComment') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_CircuitAttendance
    ADD DiscardComment VARCHAR(MAX) NULL;
END
