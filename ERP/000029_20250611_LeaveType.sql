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
	[LineNumber] [int] NOT NULL,
 CONSTRAINT [PK_Leave_Type] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
INSERT INTO [dbo].[hrm_LeaveType] (
    [LeaveTypeId], 
    [LeaveCode], 
    [LeaveName], 
    [LeaveDescription], 
    [IsUncountable], 
    [NoOfDays], 
    [SpanOverLeaveYear], 
    [Active],
    [LineNumber] 

) VALUES
('89ff6742-d0ea-4a0f-9c97-0127043411ca', 'AL', 'Annual', 'Leave granted annually to employees.', 0, 14, 1, 1,2),
('add3702f-4210-499f-8822-07fd0444c19c', 'DL', 'Duty', 'Leave for Duties.', 0, 3, 0, 1,7),
('fe0a689a-15ca-4cee-a6bf-32d17fc163b3', 'PL', 'Paternity', 'Leave for fathers after childbirth.', 0, 3, 0, 1,6),
('b4e902de-6e07-4eb5-a9d1-383ea62a60a8', 'AL', 'Accident', 'Leave granted for health-related reasons.', 0, NULL, 0, 1,4),
('13d21c76-260f-44a4-b25e-9987e6d5415f', 'NL', 'NoPay', 'Leave without salary deduction.', 1, NULL, 0, 1,9),
('b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7', 'CL', 'Casual', 'Short-term leave for personal reasons.', 0, 7, 0, 1,1),
('a64c02c2-c53c-4661-8786-a6fcd19f51b8', 'LL', 'Lieu', 'Leave granted for health-related reasons.', 0, NULL, 0, 1,8),
('bfd472b7-c255-4e56-9d4e-b96de2dffc3b', 'MT', 'Maternity', 'Leave for maternity purposes.', 1, NULL, 1, 1,5),
('daf1eb45-6580-401a-8fb1-fb1fb9356648', 'ML', 'Medical', 'Leave granted for health-related reasons.', 0, 21, 0, 1,3)
GO
