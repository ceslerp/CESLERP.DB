DECLARE @WorkspaceId UNIQUEIDENTIFIER;
DECLARE @Year INT;
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;

--SET @WorkspaceId = '4D08FE85-1E63-4702-A01D-4DDAE0F9B7F9'	--ANU
--SET @WorkspaceId = '479806B8-5530-4FB2-B6BD-B2966466950A'	--APS
--SET @WorkspaceId = 'AB844422-3D20-4422-8F2F-D4522323B353'	--CEN
--SET @WorkspaceId = 'D2F1E41C-A1F5-4303-B92C-AE1DA3B6841C'	--ENU
--SET @WorkspaceId = 'C037E3A6-4664-4A4E-8AE2-9D1229A95E7D'	--ESE
--SET @WorkspaceId = '9FAE38F8-8AE5-4568-A7E3-84F812861FC8'	--GDE
--SET @WorkspaceId = '77FE8872-8853-4DF5-BDDD-D4223C2CD0A5'	--HED
--SET @WorkspaceId = '193CE8FD-75BA-445B-AD0E-E7134C01F514'	--IRC
--SET @WorkspaceId = 'CD9F80B3-12B7-446C-BF8C-C29F3DFE79D8'	--MEP
--SET @WorkspaceId = '21DBBC90-6008-4C70-B60C-D8273233F61B'	--NCL
--SET @WorkspaceId = 'C82037F3-84AD-4496-864C-B85F58C66F36'	--NOR
--SET @WorkspaceId = 'EB16EC4C-C35A-4AA3-9B70-125E88B18BAA'	--NOW
--SET @WorkspaceId = '4C64654F-98F7-4B99-BF1C-8F94F738962E'	--PCM
--SET @WorkspaceId = '48EC83F2-0C60-4FD7-9B45-4CF69C642D77'	--POL
--SET @WorkspaceId = '351D9AF2-2B79-42B1-BF44-0CB25396FCF1'	--SAB
--SET @WorkspaceId = 'B7C894CA-7FA9-4B61-B2DE-A0C012C6A162'	--SOU
--SET @WorkspaceId = '1EADB3AF-CFC8-4CE1-AD29-915ED1092ED3'	--UVA
--SET @WorkspaceId = '00E4C82B-F78E-48B0-9C8C-23B5574CBE3D'	--WP1
--SET @WorkspaceId = '06A2FE19-829F-4EA0-B521-73330C401B1B'	--WP2

SET @Year = 2026;

-- Define leave year period dynamically
SET @StartDate = DATEFROMPARTS(@Year - 1, 12, 31);  -- 2025-12-31
SET @EndDate   = DATEFROMPARTS(@Year, 12, 30);      -- 2026-12-30

-- Define cutoff date: March 31, 2025
DECLARE @CutoffDate DATE = DATEFROMPARTS(@Year, 3, 31);

;WITH LeaveTypes AS (
    SELECT 'b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7' AS LeaveTypeId, 7  AS Days -- Casual
    UNION ALL SELECT '89ff6742-d0ea-4a0f-9c97-0127043411ca', 14  -- Annual
    UNION ALL SELECT 'daf1eb45-6580-401a-8fb1-fb1fb9356648', 21  -- Medical
    --UNION ALL SELECT 'b4e902de-6e07-4eb5-a9d1-383ea62a60a8',  0  -- Accident
    --UNION ALL SELECT 'add3702f-4210-499f-8822-07fd0444c19c',  0  -- Duty
    --UNION ALL SELECT 'bfd472b7-c255-4e56-9d4e-b96de2dffc3b',  0  -- Maternity
    --UNION ALL SELECT 'a64c02c2-c53c-4661-8786-a6fcd19f51b8',  0  -- Lieu
    --UNION ALL SELECT '13d21c76-260f-44a4-b25e-9987e6d5415f',  0  -- NoPay
    --UNION ALL SELECT 'fe0a689a-15ca-4cee-a6bf-32d17fc163b3',  0  -- Paternity
    --UNION ALL SELECT '522615d1-8d58-427f-a121-328836a6632f',  0  -- Special
    --UNION ALL SELECT 'b0695296-5d3e-461f-810c-23be0bdb5e12',  0  -- Special Full Pay
    --UNION ALL SELECT '140293d7-2d82-4d83-a812-627b6c912e4e',  0  -- Special No Pay
)
INSERT INTO hrm_LeaveAssignment
SELECT 
    NEWID(),
    '660a89ae-c622-43b0-8c15-93fabc9cdd1b',
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
  AND EMP.DateOfAppointment <= @CutoffDate  -- Hired on or before March 31, 2025
  AND EMP.WorkSpaceId = @WorkspaceId
  AND NOT EXISTS (
        SELECT 1
        FROM hrm_LeaveAssignment L
        WHERE L.EmployeeId = EMP.EmployeeId
          AND L.LeaveTypeId = LT.LeaveTypeId
          AND L.LeaveYearId = '660a89ae-c622-43b0-8c15-93fabc9cdd1b'
          AND L.LeaveStartDate = @StartDate
          AND L.LeaveEndDate   = @EndDate
    );
