USE [ERP]
GO

/****** Object:  Table [dbo].[hrm_OTP]    Script Date: 10/13/2025 5:42:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[hrm_OTP](
	[OTPId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[OTP] [nvarchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL DEFAULT (getdate()),
	[IsVerified] [bit] NOT NULL DEFAULT ((0)),
	[ExpireDateTime] [datetime] NULL,
 CONSTRAINT [PK_dbo.hrm_OTP] PRIMARY KEY CLUSTERED 
(
	[OTPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


