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
GO

