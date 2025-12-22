IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[hrm_LeaveApplicationDetail]') 
      AND type = N'U'
)
BEGIN
    CREATE TABLE [dbo].[hrm_LeaveApplicationDetail](
        [LeaveApplicationDateId] [uniqueidentifier] NOT NULL,
        [LeaveApplicationId] [uniqueidentifier] NOT NULL,
        [EmployeeId] [uniqueidentifier] NOT NULL,
        [LeaveTypeId] [uniqueidentifier] NOT NULL,
        [LeaveYearId] [uniqueidentifier] NOT NULL,
        [LeaveDate] [date] NOT NULL,
        [LeaveFraction] [decimal](3, 2) NOT NULL,
        [IsHoliday] [bit] NOT NULL,
        [IsWeekend] [bit] NOT NULL,
        [CreatedDateTime] [datetime] NOT NULL,
        [LeaveDayType] [int] NOT NULL DEFAULT ((1)),
     CONSTRAINT [PK_hrm_LeaveApplicationDate] PRIMARY KEY CLUSTERED 
    (
        [LeaveApplicationDateId] ASC
    )WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
    ) ON [PRIMARY];

    ALTER TABLE [dbo].[hrm_LeaveApplicationDetail] WITH CHECK 
    ADD CONSTRAINT [FK_LAD_LeaveApplication] 
    FOREIGN KEY([LeaveApplicationId])
    REFERENCES [dbo].[hrm_LeaveApplication] ([LeaveApplicationId]);

    ALTER TABLE [dbo].[hrm_LeaveApplicationDetail] 
    CHECK CONSTRAINT [FK_LAD_LeaveApplication];
END
ELSE
BEGIN
    PRINT 'Table [dbo].[hrm_LeaveApplicationDetail] already exists.';
END
