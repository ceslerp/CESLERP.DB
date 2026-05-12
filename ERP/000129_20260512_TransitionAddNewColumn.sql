IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'hrm_EmployeeTransition'
      AND COLUMN_NAME = 'WorkUnitAllocationRemove'
)
BEGIN
    ALTER TABLE [dbo].[hrm_EmployeeTransition]
    ADD [WorkUnitAllocationRemove] BIT NOT NULL DEFAULT 0;

    PRINT 'Column WorkUnitAllocationRemove added to hrm_EmployeeTransition table.';
END
ELSE
BEGIN
    PRINT 'Column WorkUnitAllocationRemove already exists in hrm_EmployeeTransition table.';
END
GO