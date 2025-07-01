ALTER TABLE cmn_EmployeeVersion
ADD CountryId UNIQUEIDENTIFIER
GO

-- Step 2: Update all existing rows with the specified GUID
UPDATE cmn_EmployeeVersion
SET CountryId = '11111111-1111-1111-1111-111111111111'
GO

-- Step 3: remove nullable
ALTER TABLE cmn_EmployeeVersion
ALTER COLUMN CountryId UNIQUEIDENTIFIER NOT NULL;
GO
