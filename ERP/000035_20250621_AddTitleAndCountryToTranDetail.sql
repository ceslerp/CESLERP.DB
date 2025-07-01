-- Step 1: Add the new column (nullable at first)
ALTER TABLE hrm_EmployeeTransactionDetail
ADD CountryId UNIQUEIDENTIFIER;
GO

-- Step 2: Update all existing rows with the specified GUID
UPDATE hrm_EmployeeTransactionDetail
SET CountryId = '11111111-1111-1111-1111-111111111111';
GO

--nullable
ALTER TABLE hrm_EmployeeTransactionDetail
ALTER COLUMN CountryId UNIQUEIDENTIFIER NOT NULL;
GO
