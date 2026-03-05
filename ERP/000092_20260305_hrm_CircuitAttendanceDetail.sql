IF NOT EXISTS (
    SELECT * 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[hrm_CircuitAttendanceDetail]') 
    AND type = 'U'
)
BEGIN
    CREATE TABLE [dbo].[hrm_CircuitAttendanceDetail](
        [CircuitAttendanceDetailId] UNIQUEIDENTIFIER NOT NULL,
        [CircuitAttendanceId] UNIQUEIDENTIFIER NOT NULL,
        [AttendanceDate] DATETIME NOT NULL,
        [TimeIn] NVARCHAR(10) NULL,
        [TimeOut] NVARCHAR(10) NULL,

        CONSTRAINT PK_CircuitAttendanceDetail 
            PRIMARY KEY (CircuitAttendanceDetailId),

        CONSTRAINT FK_CircuitAttendanceDetail_Header
            FOREIGN KEY (CircuitAttendanceId)
            REFERENCES hrm_CircuitAttendance(CircuitAttendanceId)
    );
END
