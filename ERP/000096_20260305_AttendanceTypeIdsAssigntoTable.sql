IF COL_LENGTH('dbo.hrm_CircuitAttendance', 'AttendanceTypeId') IS NOT NULL
AND COL_LENGTH('dbo.hrm_CircuitAttendance', 'AttendanceType') IS NOT NULL
BEGIN
    UPDATE dbo.hrm_CircuitAttendance
    SET AttendanceTypeId =
        CASE AttendanceType
            WHEN 0 THEN 'a575d412-ffb8-4fa9-8664-00b401760f85' -- Circuit
            WHEN 1 THEN '7dbcd08b-28bb-45f9-9201-5ce7f0d9fc52' -- Missed Attendance
            WHEN 2 THEN 'd8707d6e-a714-4fb5-ade9-9d9aaa547735' -- DRC
        END
    WHERE AttendanceType IN (0,1,2)
    AND AttendanceTypeId IS NULL;
END
