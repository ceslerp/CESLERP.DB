ALTER TABLE [dbo].[hrm_HRMWorkUnitAllocationTransaction]
ADD [IsActive] [bit] NOT NULL
    CONSTRAINT [DF_hrm_HRMWorkUnitAllocationTransaction_IsActive] DEFAULT ((1))
GO