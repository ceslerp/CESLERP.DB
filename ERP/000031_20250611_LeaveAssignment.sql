USE [ERP];
GO

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[hrm_LeaveAssignment](
    [LeaveAssignmentId] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [LeaveYearId] UNIQUEIDENTIFIER NOT NULL,
    [LeaveTypeId] UNIQUEIDENTIFIER NOT NULL,
    [EmployeeId] UNIQUEIDENTIFIER NOT NULL,
    [LeaveStartDate] DATE NOT NULL,
    [LeaveEndDate] DATE NOT NULL,
    [CreatedDateTime] DATETIME NOT NULL DEFAULT GETDATE(),
    [NoOfDays] DECIMAL(18, 2) NULL,
    CONSTRAINT [PK_hrm_LeaveAssignment] PRIMARY KEY CLUSTERED 
    (
        [LeaveAssignmentId] ASC
    )
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

-- Foreign Key to cmn_Employee
ALTER TABLE [dbo].[hrm_LeaveAssignment]  WITH CHECK ADD CONSTRAINT [FK_hrm_LeaveAssignment_Employee] 
FOREIGN KEY([EmployeeId]) REFERENCES [dbo].[cmn_Employee]([EmployeeId]);
GO

ALTER TABLE [dbo].[hrm_LeaveAssignment] CHECK CONSTRAINT [FK_hrm_LeaveAssignment_Employee];
GO

-- Foreign Key to hrm_LeaveType
ALTER TABLE [dbo].[hrm_LeaveAssignment]  WITH CHECK ADD CONSTRAINT [FK_hrm_LeaveAssignment_LeaveType] 
FOREIGN KEY([LeaveTypeId]) REFERENCES [dbo].[hrm_LeaveType]([LeaveTypeId]);
GO

ALTER TABLE [dbo].[hrm_LeaveAssignment] CHECK CONSTRAINT [FK_hrm_LeaveAssignment_LeaveType];
GO

-- Foreign Key to hrm_LeaveYear
ALTER TABLE [dbo].[hrm_LeaveAssignment]  WITH CHECK ADD CONSTRAINT [FK_hrm_LeaveAssignment_LeaveYear] 
FOREIGN KEY([LeaveYearId]) REFERENCES [dbo].[hrm_LeaveYear]([LeaveYearId]);
GO

ALTER TABLE [dbo].[hrm_LeaveAssignment] CHECK CONSTRAINT [FK_hrm_LeaveAssignment_LeaveYear];
GO
