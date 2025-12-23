USE [ERP]
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.tables t
    INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE t.name = 'hrm_LeaveBalance'
      AND s.name = 'dbo'
)
BEGIN
    CREATE TABLE [dbo].[hrm_LeaveBalance](
        [LeaveBalanceId] UNIQUEIDENTIFIER NOT NULL,
        [LeaveApplicationId] UNIQUEIDENTIFIER NOT NULL,
        [LeaveTypeId] UNIQUEIDENTIFIER NOT NULL,
        [PreviousCasual] DECIMAL(5,2) NULL,
        [PreviousAnnual] DECIMAL(5,2) NULL,
        [PreviousMedical] DECIMAL(5,2) NULL,
        [PreviousDuty] DECIMAL(5,2) NULL,
        [PreviousSpecialFullPay] DECIMAL(5,2) NULL,
        [PreviousSpecial] DECIMAL(5,2) NULL,
        [PreviousPaternity] DECIMAL(5,2) NULL,
        [PreviousAccident] DECIMAL(5,2) NULL,
        [PreviousSpecialNoPay] DECIMAL(5,2) NULL,
        [PreviousNoPay] DECIMAL(5,2) NULL,
        [PreviousLieu] DECIMAL(5,2) NULL,
        [PreviousMaternity] DECIMAL(5,2) NULL,

        CONSTRAINT [PK_hrm_LeaveBalance] PRIMARY KEY CLUSTERED
        (
            [LeaveBalanceId] ASC
        )
    ) ON [PRIMARY];
END
GO
