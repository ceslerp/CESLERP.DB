IF OBJECT_ID('dbo.hrm_AttendanceType', 'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[hrm_AttendanceType](
        [AttendanceTypeId] UNIQUEIDENTIFIER NOT NULL,
        [Name] NVARCHAR(100) NOT NULL,
        [Description] NVARCHAR(250) NULL,
        [IsActive] BIT NOT NULL DEFAULT ((1)),
        [CreatedDateTime] DATETIME NOT NULL DEFAULT (GETDATE()),

        CONSTRAINT PK_hrm_AttendanceType 
        PRIMARY KEY CLUSTERED ([AttendanceTypeId] ASC)
    );
END



IF NOT EXISTS (SELECT 1 FROM dbo.hrm_AttendanceType WHERE AttendanceTypeId = 'a575d412-ffb8-4fa9-8664-00b401760f85')
BEGIN
INSERT INTO dbo.hrm_AttendanceType
(AttendanceTypeId, Name, Description, IsActive, CreatedDateTime)
VALUES
('a575d412-ffb8-4fa9-8664-00b401760f85','Circuit','Official circuit attendance',1,'2026-01-27 20:22:35.473')
END

IF NOT EXISTS (SELECT 1 FROM dbo.hrm_AttendanceType WHERE AttendanceTypeId = '7dbcd08b-28bb-45f9-9201-5ce7f0d9fc52')
BEGIN
INSERT INTO dbo.hrm_AttendanceType
(AttendanceTypeId, Name, Description, IsActive, CreatedDateTime)
VALUES
('7dbcd08b-28bb-45f9-9201-5ce7f0d9fc52','Missed Attendance','Missed Attendance Correction',1,'2026-01-27 20:22:35.473')
END

IF NOT EXISTS (SELECT 1 FROM dbo.hrm_AttendanceType WHERE AttendanceTypeId = 'd8707d6e-a714-4fb5-ade9-9d9aaa547735')
BEGIN
INSERT INTO dbo.hrm_AttendanceType
(AttendanceTypeId, Name, Description, IsActive, CreatedDateTime)
VALUES
('d8707d6e-a714-4fb5-ade9-9d9aaa547735','DRC','Driver Running Chart',1,'2026-01-27 20:22:35.473')
END
