USE [ERP];
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'hrm_EmployeeSignatures'
      AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE [dbo].[hrm_EmployeeSignatures](
        [SignatureId] UNIQUEIDENTIFIER NOT NULL DEFAULT (NEWID()),
        [EmployeeId] UNIQUEIDENTIFIER NOT NULL,
        [SignatureData] TEXT NOT NULL,
        [Nic] NVARCHAR(50) NULL,
        [SignedDate] DATETIME NOT NULL,
        [CreatedDate] DATETIME NOT NULL 
            CONSTRAINT [DF_hrm_EmployeeSignatures_CreatedDate] DEFAULT (GETDATE()),
        [UpdatedDate] DATETIME NOT NULL 
            CONSTRAINT [DF_hrm_EmployeeSignatures_UpdatedDate] DEFAULT (GETDATE()),
        [IsActive] BIT NOT NULL 
            CONSTRAINT [DF_hrm_EmployeeSignatures_IsActive] DEFAULT ((1)),
        CONSTRAINT [PK_hrm_EmployeeSignatures]
            PRIMARY KEY CLUSTERED ([SignatureId])
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
END;
GO
