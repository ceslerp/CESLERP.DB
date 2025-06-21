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

ALTER TABLE cmn_EmployeeVersion
ADD TitleInt INT;
GO

UPDATE cmn_EmployeeVersion
SET TitleInt = CASE 
    WHEN LOWER(Title) = 'mr' THEN 1
    WHEN LOWER(Title) = 'miss' THEN 2
    WHEN LOWER(Title) = 'mrs' THEN 3
    ELSE NULL  -- You can choose how to handle unexpected values
END;
GO

SELECT Title FROM cmn_EmployeeVersion
WHERE TitleInt IS NULL
GROUP BY Title;
GO

-- Drop old Title column
ALTER TABLE cmn_EmployeeVersion
DROP COLUMN Title;
GO

-- Rename the new column
EXEC sp_rename 'dbo.cmn_EmployeeVersion.TitleInt', 'Title', 'COLUMN';
GO