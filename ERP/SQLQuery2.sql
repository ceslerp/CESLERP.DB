DECLARE @WorkspaceId UNIQUEIDENTIFIER;
DECLARE @Year INT;
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;

SET @WorkspaceId = '77fe8872-8853-4df5-bddd-d4223c2cd0a5';
SET @Year = 2025;

-- Define leave year period dynamically
SET @StartDate = DATEFROMPARTS(@Year - 1, 12, 31);  -- 2024-12-31
SET @EndDate   = DATEFROMPARTS(@Year, 12, 30);      -- 2025-12-30

;WITH LeaveTypes AS (
    SELECT 'b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7' AS LeaveTypeId, 7  AS Days -- Casual
    UNION ALL SELECT '89ff6742-d0ea-4a0f-9c97-0127043411ca', 14  -- Annual
    UNION ALL SELECT 'daf1eb45-6580-401a-8fb1-fb1fb9356648', 21  -- Medical
    UNION ALL SELECT 'b4e902de-6e07-4eb5-a9d1-383ea62a60a8',  0  -- Accident
    UNION ALL SELECT 'add3702f-4210-499f-8822-07fd0444c19c',  0  -- Duty
    UNION ALL SELECT 'bfd472b7-c255-4e56-9d4e-b96de2dffc3b',  0  -- Maternity
    UNION ALL SELECT 'a64c02c2-c53c-4661-8786-a6fcd19f51b8',  0  -- Lieu
    UNION ALL SELECT '13d21c76-260f-44a4-b25e-9987e6d5415f',  0  -- NoPay
    UNION ALL SELECT 'fe0a689a-15ca-4cee-a6bf-32d17fc163b3',  0  -- Paternity
    UNION ALL SELECT '522615d1-8d58-427f-a121-328836a6632f',  0  -- Special
    UNION ALL SELECT 'b0695296-5d3e-461f-810c-23be0bdb5e12',  0  -- Special Full Pay
    UNION ALL SELECT '140293d7-2d82-4d83-a812-627b6c912e4e',  0  -- Special No Pay
)
--INSERT INTO hrm_LeaveAssignment
SELECT 
    NEWID(),
    '8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc',
    LT.LeaveTypeId,
    EMP.EmployeeId,
    @StartDate,
    @EndDate,
    GETDATE(),
    LT.Days
FROM cmn_EmployeeVersion EMP
CROSS JOIN LeaveTypes LT
WHERE EMP.DataStatus = 5 
  AND EMP.TypeOfContract != 4
  AND YEAR(EMP.DateOfAppointment) != @Year
  AND EMP.WorkSpaceId = @WorkspaceId
  AND NOT EXISTS (
        SELECT 1
        FROM hrm_LeaveAssignment L
        WHERE L.EmployeeId = EMP.EmployeeId
          AND L.LeaveTypeId = LT.LeaveTypeId
          AND L.LeaveYearId = '8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc'
          AND L.LeaveStartDate = @StartDate
          AND L.LeaveEndDate   = @EndDate
    );
