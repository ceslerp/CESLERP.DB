IF NOT EXISTS (
    SELECT 1 
    FROM sys.columns 
    WHERE Name = 'IsActive'
      AND Object_ID = Object_ID('dbo.hrm_HRMWorkUnitAllocationTransaction')
)
BEGIN
    ALTER TABLE [dbo].[hrm_HRMWorkUnitAllocationTransaction]
    ADD [IsActive] [bit] NOT NULL 
        CONSTRAINT [DF_hrm_HRMWorkUnitAllocationTransaction_IsActive] DEFAULT ((1));
END
GO
