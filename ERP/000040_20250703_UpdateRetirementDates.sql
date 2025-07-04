USE [ERP]
GO

UPDATE ERP.dbo.cmn_EmployeeVersion
SET RetirementDate = DATEADD(YEAR, 60, DateOfBirth)
WHERE IsActive = 1 AND (TypeOfContract = 1 OR TypeOfContract = 5) AND DataStatus = 5

GO