USE [ERP];
GO
IF COL_LENGTH('dbo.hrm_Holidays', 'DayType') IS NULL
BEGIN
    ALTER TABLE dbo.hrm_Holidays
    ADD DayType NVARCHAR(20) NOT NULL
        CONSTRAINT DF_hrm_Holidays_DayType DEFAULT ('full');
END
GO
