USE [ERP];
GO

-- Approved info
IF COL_LENGTH('dbo.hrm_Holidays', 'ApprovedUserId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD ApprovedUserId UNIQUEIDENTIFIER NULL;
END
GO

IF COL_LENGTH('dbo.hrm_Holidays', 'ApprovedDateTime') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD ApprovedDateTime DATETIME NULL;
END
GO

-- Rejection info
IF COL_LENGTH('dbo.hrm_Holidays', 'RejectDateTime') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD RejectDateTime DATETIME NULL;
END
GO

IF COL_LENGTH('dbo.hrm_Holidays', 'RejectComment') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD RejectComment NVARCHAR(MAX) NULL;
END
GO

-- Status
IF COL_LENGTH('dbo.hrm_Holidays', 'DataStatus') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD DataStatus INT NOT NULL CONSTRAINT DF_hrm_Holidays_DataStatus DEFAULT (0);
END
GO

-- Update audit
IF COL_LENGTH('dbo.hrm_Holidays', 'UpdatedUserId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD UpdatedUserId UNIQUEIDENTIFIER NULL;
END
GO

IF COL_LENGTH('dbo.hrm_Holidays', 'UpdatedDateTime') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD UpdatedDateTime DATETIME NULL;
END
GO

-- Active flag
IF COL_LENGTH('dbo.hrm_Holidays', 'IsActive') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD IsActive BIT NOT NULL CONSTRAINT DF_hrm_Holidays_IsActive DEFAULT (1);
END
GO

-- Organization / Business unit
IF COL_LENGTH('dbo.hrm_Holidays', 'OrganizationId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD OrganizationId UNIQUEIDENTIFIER NULL;
END
GO

IF COL_LENGTH('dbo.hrm_Holidays', 'BusinessUnitId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD BusinessUnitId UNIQUEIDENTIFIER NULL;
END
GO
