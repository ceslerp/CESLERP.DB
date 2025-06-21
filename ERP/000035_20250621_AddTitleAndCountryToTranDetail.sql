ALTER TABLE hrm_EmployeeTransactionDetail
ADD TitleInt INT;
GO

UPDATE hrm_EmployeeTransactionDetail
SET TitleInt = CASE 
    WHEN LOWER(Title) = 'Mr' THEN 1
    WHEN LOWER(Title) = 'Miss' THEN 2
    WHEN LOWER(Title) = 'Mrs' THEN 3
    ELSE NULL  -- You can choose how to handle unexpected values
END;
GO

SELECT Title FROM hrm_EmployeeTransactionDetail
WHERE TitleInt IS NULL
GROUP BY Title;
GO

-- Drop old Title column
ALTER TABLE hrm_EmployeeTransactionDetail
DROP COLUMN Title;
GO

-- Rename the new column
EXEC sp_rename 'dbo.hrm_EmployeeTransactionDetail.TitleInt', 'Title', 'COLUMN';
GO

-- Add Country Id
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