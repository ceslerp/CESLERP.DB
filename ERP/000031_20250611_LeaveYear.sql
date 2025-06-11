USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hrm_LeaveYear](
	[LeaveYearId] [uniqueidentifier] NOT NULL,
	[LeaveYear] [nvarchar](20) NOT NULL,
	[LeaveYearStartDate] [datetime] NOT NULL,
	[LeaveYearEndDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Leave_Year] PRIMARY KEY CLUSTERED 
(
	[LeaveYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

