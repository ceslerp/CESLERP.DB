USE [ERP]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hrm_EmployeeTransitionType](
    [EmployeeTransitionTypeId] [uniqueidentifier] NOT NULL DEFAULT (newsequentialid()),
      NOT NULL,
      NULL,
    [IsActive] [bit] NOT NULL DEFAULT ((1)),
    CONSTRAINT [PK_hrm_EmployeeTransitionType] PRIMARY KEY CLUSTERED 
    (
        [EmployeeTransitionTypeId] ASC
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY],
    CONSTRAINT [UQ_hrm_EmployeeTransitionType_Name] UNIQUE NONCLUSTERED 
    (
        [Name] ASC
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON
    ) ON [PRIMARY]
) ON [PRIMARY]
GO
