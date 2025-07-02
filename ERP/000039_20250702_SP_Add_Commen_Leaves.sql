---Casual Leaves
INSERT INTO hrm_LeaveAssignment
SELECT NEWID(),'8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7',EMP.EmployeeId,'2024-12-31','2025-12-30',GETDATE(),7
FROM cmn_EmployeeVersion EMP
WHERE EMP.DataStatus = 5 AND EMP.TypeOfContract != 4 AND YEAR(EMP.DateOfAppointment) != 2025 AND (EMP.WorkSpaceId = '351d9af2-2b79-42b1-bf44-0cb25396fcf1' OR EMP.WorkSpaceId = '06a2fe19-829f-4ea0-b521-73330c401b1b')

---Anual Leaves
INSERT INTO hrm_LeaveAssignment
SELECT NEWID(),'8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','89ff6742-d0ea-4a0f-9c97-0127043411ca',EMP.EmployeeId,'2024-12-31','2025-12-30',GETDATE(),14
FROM cmn_EmployeeVersion EMP
WHERE EMP.DataStatus = 5 AND EMP.TypeOfContract != 4 AND YEAR(EMP.DateOfAppointment) != 2025 AND (EMP.WorkSpaceId = '351d9af2-2b79-42b1-bf44-0cb25396fcf1' OR EMP.WorkSpaceId = '06a2fe19-829f-4ea0-b521-73330c401b1b')

---Medical Leaves
INSERT INTO hrm_LeaveAssignment
SELECT NEWID(),'8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc','daf1eb45-6580-401a-8fb1-fb1fb9356648',EMP.EmployeeId,'2024-12-31','2025-12-30',GETDATE(),21
FROM cmn_EmployeeVersion EMP
WHERE EMP.DataStatus = 5 AND EMP.TypeOfContract != 4 AND YEAR(EMP.DateOfAppointment) != 2025 AND (EMP.WorkSpaceId = '351d9af2-2b79-42b1-bf44-0cb25396fcf1' OR EMP.WorkSpaceId = '06a2fe19-829f-4ea0-b521-73330c401b1b')