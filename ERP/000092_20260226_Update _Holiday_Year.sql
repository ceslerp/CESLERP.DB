USE [ERP]
GO

-- Update 2025 holidays
UPDATE dbo.hrm_Holidays
SET HolidayYearId = '8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc'
WHERE Holiday >= '2025-01-01'
  AND Holiday <= '2025-12-31';


-- Update 2026 holidays
UPDATE dbo.hrm_Holidays
SET HolidayYearId = '660a89ae-c622-43b0-8c15-93fabc9cdd1b'
WHERE Holiday >= '2026-01-01'
  AND Holiday <= '2026-12-31';

GO
