USE [ERP];
GO

IF COL_LENGTH('dbo.hrm_Holidays', 'HolidayYearId') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD HolidayYearId UNIQUEIDENTIFIER NOT NULL
        CONSTRAINT DF_hrm_Holidays_HolidayYearId DEFAULT NEWID();
END
GO
