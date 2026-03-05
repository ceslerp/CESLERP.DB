-- 1️⃣ Add AttendanceId column if not exists
IF COL_LENGTH('dbo.hrm_Attendance', 'AttendanceId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Attendance
    ADD AttendanceId UNIQUEIDENTIFIER NULL;
END
GO


-- 2️⃣ Populate existing rows with GUIDs
UPDATE dbo.hrm_Attendance
SET AttendanceId = NEWID()
WHERE AttendanceId IS NULL;
GO


-- 3️⃣ Make the column NOT NULL
ALTER TABLE dbo.hrm_Attendance
ALTER COLUMN AttendanceId UNIQUEIDENTIFIER NOT NULL;
GO


-- 4️⃣ Add PRIMARY KEY if not exists
IF NOT EXISTS (
    SELECT *
    FROM sys.key_constraints
    WHERE name = 'PK_hrm_Attendance_AttendanceId'
)
BEGIN
    ALTER TABLE dbo.hrm_Attendance
    ADD CONSTRAINT PK_hrm_Attendance_AttendanceId 
    PRIMARY KEY (AttendanceId);
END
GO
