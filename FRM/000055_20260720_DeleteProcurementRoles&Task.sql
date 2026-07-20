USE [FRM2];
GO

BEGIN TRANSACTION;

-------------------------------------------------------
-- Step 1 - Delete Role Task Actions
-------------------------------------------------------
DELETE FROM dbo.TSys_RoleTaskAction
WHERE RoleId IN (
    '6161e3ed-61e1-418f-ae49-dff3e21cdb60',
    'fc9763bb-47ef-4000-ba7d-70f9177e402e'
)
AND TaskActionId IN (
    '923A2D16-365A-46D5-8528-20D488624703',
    '20A39815-10EA-4534-9939-21D688442891',
    '4E15F34A-D852-4946-8790-591531BD2597',
    '0436DC92-BD54-4D4A-BD6A-B32992957C37',
    'B7FCDAFC-6BEB-47B1-87A5-DFDF6B751942',
    '5C2F87E4-6A73-498D-85BE-E4AC5CBCAB1A'
);

-------------------------------------------------------
-- Step 2 - Delete Task Actions
-------------------------------------------------------
DELETE FROM dbo.TSys_TaskAction
WHERE TaskActionId IN (
    '923A2D16-365A-46D5-8528-20D488624703',
    '20A39815-10EA-4534-9939-21D688442891',
    '4E15F34A-D852-4946-8790-591531BD2597',
    '0436DC92-BD54-4D4A-BD6A-B32992957C37',
    'B7FCDAFC-6BEB-47B1-87A5-DFDF6B751942',
    '5C2F87E4-6A73-498D-85BE-E4AC5CBCAB1A'
);

-------------------------------------------------------
-- Step 3 - Delete Task
-------------------------------------------------------
DELETE FROM dbo.TSys_Task
WHERE TaskId = '5d13bfc4-5bfd-4e6d-ac18-d606eab3fde3';

COMMIT TRANSACTION;
GO

-------------------------------------------------------
-- Step 4 - Delete Role
-------------------------------------------------------
DELETE FROM dbo.TSys_Role
WHERE RoleId IN(
'6161e3ed-61e1-418f-ae49-dff3e21cdb60',
'fc9763bb-47ef-4000-ba7d-70f9177e402e'
);