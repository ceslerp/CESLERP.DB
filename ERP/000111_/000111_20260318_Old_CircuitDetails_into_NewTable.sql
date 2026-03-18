INSERT INTO hrm_CircuitAttendanceDetail
(
    CircuitAttendanceDetailId,
    CircuitAttendanceId,
    AttendanceDate,
    TimeIn,
    TimeOut
)
SELECT
    NEWID(),
    ca.CircuitAttendanceId,
    CAST(ca.CircuitDate AS DATE),

    CASE 
        WHEN DATEPART(HOUR, ca.CircuitDate) < 12 
        THEN CONVERT(VARCHAR(5), ca.CircuitDate, 108)
        ELSE NULL
    END AS TimeIn,

    CASE 
        WHEN DATEPART(HOUR, ca.CircuitDate) >= 12 
        THEN CONVERT(VARCHAR(5), ca.CircuitDate, 108)
        ELSE NULL
    END AS TimeOut

FROM hrm_CircuitAttendance ca
WHERE NOT EXISTS (
    SELECT 1
    FROM hrm_CircuitAttendanceDetail cad
    WHERE cad.CircuitAttendanceId = ca.CircuitAttendanceId
)
