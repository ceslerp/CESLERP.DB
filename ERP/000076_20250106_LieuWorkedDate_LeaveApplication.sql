IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'hrm_LeaveApplication'
      AND COLUMN_NAME = 'LieuWorkedDate'
)
BEGIN
    ALTER TABLE hrm_LeaveApplication
    ADD LieuWorkedDate DATE NULL;
END
