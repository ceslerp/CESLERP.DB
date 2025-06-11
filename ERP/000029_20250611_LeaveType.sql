USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hrm_LeaveType](
	[LeaveTypeId] [uniqueidentifier] NOT NULL,
	[LeaveCode] [nvarchar](50) NOT NULL,
	[LeaveName] [nvarchar](100) NOT NULL,
	[LeaveDescription] [nvarchar](max) NULL,
	[IsUncountable] [bit] NOT NULL,
	[NoOfDays] [int] NULL,
	[SpanOverLeaveYear] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Leave_Type] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
INSERT INTO [dbo].[hrm_LeaveType] (
    [LeaveTypeId], 
    [LeaveCode], 
    [LeaveName], 
    [LeaveDescription], 
    [IsUncountable], 
    [NoOfDays], 
    [SpanOverLeaveYear], 
    [Active]
	
) VALUES
('89ff6742-d0ea-4a0f-9c97-0127043411ca', 'AL', 'Annual Leave', 'Leave granted annually to employees.', 0, 14, 1, 1),
('add3702f-4210-499f-8822-07fd0444c19c', 'DL', 'Duty Leave', 'Leave for Duties.', 0, 3, 0, 1),
('fe0a689a-15ca-4cee-a6bf-32d17fc163b3', 'PL', 'Paternity Leave', 'Leave for fathers after childbirth.', 0, 3, 0, 1),
('13d21c76-260f-44a4-b25e-9987e6d5415f', 'NL', 'NoPay Leave', 'Leave without salary deduction.', 1, NULL, 0, 1),
('b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7', 'CL', 'Casual Leave', 'Short-term leave for personal reasons.', 0, 7, 0, 1),
('bfd472b7-c255-4e56-9d4e-b96de2dffc3b', 'ML', 'Maternity Leave', 'Leave for maternity purposes.', 1, NULL, 1, 1),
('daf1eb45-6580-401a-8fb1-fb1fb9356648', 'SL', 'Medical Leave', 'Leave granted for health-related reasons.', 0, 21, 0, 1);
GO