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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO [dbo].[hrm_LeaveYear] (
    [LeaveYearId], 
    [LeaveYear], 
    [LeaveYearStartDate], 
    [LeaveYearEndDate], 
    [Active]

) VALUES
('6bfd9f83-7500-453d-8c7d-49e0dd32ac08', '2024', '2024-01-01 00:00:00.000', '2024-12-31 00:00:00.000', 0),
('8d73f914-fb5c-4e00-9c5c-6ef1fe447cdc', '2025', '2025-01-01 00:00:00.000', '2025-12-31 00:00:00.000', 1),
('660a89ae-c622-43b0-8c15-93fabc9cdd1b', '2026', '2026-01-01 00:00:00.000', '2026-12-31 00:00:00.000', 0),
('a8c0df32-da96-4e88-8fba-fb206ebf1a5d', '2023', '2023-01-01 00:00:00.000', '2023-12-31 00:00:00.000', 0)
GO

GO
