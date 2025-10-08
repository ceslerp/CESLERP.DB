--Casual Leave
INSERT INTO hrm_LeaveApplication 
SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Casual) AS Casual,NULL,'Opening',NULL,5,EMPV.EmployeeId,
'b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
NULL,NULL,NULL,NULL,NULL,NULL,0
FROM hrm_OpeningLeave OPL
INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
WHERE OPL.Casual > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Casual'
GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

--Annual Leave
UNION ALL 
SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Annual) AS Annual,NULL,'Opening',NULL,5,EMPV.EmployeeId,
'89ff6742-d0ea-4a0f-9c97-0127043411ca','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
NULL,NULL,NULL,NULL,NULL,NULL,0
FROM hrm_OpeningLeave OPL	
INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
WHERE OPL.Annual > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Annual'
GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

--Sick Leave
UNION ALL 
SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Sick) AS Medical,NULL,'Opening',NULL,5,EMPV.EmployeeId,
'daf1eb45-6580-401a-8fb1-fb1fb9356648','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
NULL,NULL,NULL,NULL,NULL,NULL,0
FROM hrm_OpeningLeave OPL
INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
WHERE OPL.Sick > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Medical'
GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Accident Leave
--UNION ALL 
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Accident) AS Accident,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'b4e902de-6e07-4eb5-a9d1-383ea62a60a8','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.Accident > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Accident'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Duty Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Duty) AS Duty,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'add3702f-4210-499f-8822-07fd0444c19c','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.Duty > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Duty'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Maternity Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Maternity + OPL.MaternityHalfPay + OPL.MaternityNoPay) AS Maternity,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'bfd472b7-c255-4e56-9d4e-b96de2dffc3b','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.Maternity > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Maternity'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Lieu Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Lieu) AS Lieu,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'a64c02c2-c53c-4661-8786-a6fcd19f51b8','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.Lieu > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Lieu'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----NoPay Leave 
--UNION ALL 
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.NoPay) AS NoPay,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'13d21c76-260f-44a4-b25e-9987e6d5415f','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.NoPay > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'NoPay'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Paternity Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Paternity) AS Paternity,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'fe0a689a-15ca-4cee-a6bf-32d17fc163b3','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.Paternity > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Paternity'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Special Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.Special) AS Special,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'522615d1-8d58-427f-a121-328836a6632f','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.Special > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Special'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Special Full Pay Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.SpecialFullPay) AS SpecialFullPay,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'b0695296-5d3e-461f-810c-23be0bdb5e12','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.SpecialFullPay > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Special Full Pay'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId

----Special No Pay Leave
--UNION ALL  
--SELECT NEWID(),LEA.LeaveAssignmentId,'2025-09-30','2025-09-30','Morning','2025-09-30','Evening',SUM(OPL.SpecialNoPay) AS SpecialNoPay,NULL,'Opening',NULL,5,EMPV.EmployeeId,
--'140293d7-2d82-4d83-a812-627b6c912e4e','8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a','bae027a7-2fa5-41ba-8753-1450fd21b181','2025-10-01','d3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',
--NULL,NULL,NULL,NULL,NULL,NULL,0
--FROM hrm_OpeningLeave OPL
--INNER JOIN cmn_EmployeeVersion EMPV ON OPL.EPFNo = EMPV.EPFNo
--INNER JOIN hrm_LeaveAssignment LEA ON EMPV.EmployeeId = LEA.EmployeeId
--INNER JOIN hrm_LeaveType LET ON LEA.LeaveTypeId = LET.LeaveTypeId
--WHERE OPL.SpecialNoPay > 0 AND EMPV.DataStatus = 5 AND LET.LeaveName = 'Special No Pay'
--GROUP BY LEA.LeaveAssignmentId,EMPV.EmployeeId
