-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kaveen Vishwajith
-- Create date: 12/31/2025
-- Description:	Retrieve Leave Summary Report
-- =============================================
--EXEC hrm_SPGetLeaveSummaryData'add5d725-cdce-48ac-8085-3274112bb916',2025,12
ALTER PROCEDURE hrm_SPGetLeaveSummaryData 
	-- Add the parameters for the stored procedure here
	@EmployeeId					UNIQUEIDENTIFIER,
	@Year						INT,
	@Month						INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  
    EMPV.EPFNo,
    EMPV.NameWithInitial,
    DESG.DesignationName,
	EMPV.EmployeeRecruitmentType,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7' THEN LAD.LeaveFraction END), 0) AS Casual,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = '89ff6742-d0ea-4a0f-9c97-0127043411ca' THEN LAD.LeaveFraction END), 0) AS Annual,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'daf1eb45-6580-401a-8fb1-fb1fb9356648' THEN LAD.LeaveFraction END), 0) AS Medical,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'b4e902de-6e07-4eb5-a9d1-383ea62a60a8' THEN LAD.LeaveFraction END), 0) AS Accident,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'add3702f-4210-499f-8822-07fd0444c19c' THEN LAD.LeaveFraction END), 0) AS Duty,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'bfd472b7-c255-4e56-9d4e-b96de2dffc3b' THEN LAD.LeaveFraction END), 0) AS Maternity,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'a64c02c2-c53c-4661-8786-a6fcd19f51b8' THEN LAD.LeaveFraction END), 0) AS Lieu,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = '13d21c76-260f-44a4-b25e-9987e6d5415f' THEN LAD.LeaveFraction END), 0) AS NoPay,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = '522615d1-8d58-427f-a121-328836a6632f' THEN LAD.LeaveFraction END), 0) AS Special,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'fe0a689a-15ca-4cee-a6bf-32d17fc163b3' THEN LAD.LeaveFraction END), 0) AS Paternity,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = 'b0695296-5d3e-461f-810c-23be0bdb5e12' THEN LAD.LeaveFraction END), 0) AS SpecialFullPay,
    COALESCE(SUM(CASE WHEN LAD.LeaveTypeId = '140293d7-2d82-4d83-a812-627b6c912e4e' THEN LAD.LeaveFraction END), 0) AS SpecialNoPay

FROM hrm_LeaveApplicationDetail LAD
JOIN cmn_EmployeeVersion EMPV 
    ON LAD.EmployeeId = EMPV.EmployeeId
JOIN hrm_Designation DESG 
    ON EMPV.DesignationId = DESG.DesignationId

WHERE 
    YEAR(LAD.LeaveDate) = @Year
    AND MONTH(LAD.LeaveDate) = @Month
	    AND EMPV.WorkSpaceId IN (
        SELECT WorkSpaceId
        FROM cmn_MergeWorkSpace
        WHERE EmployeeId = @EmployeeId
    )

GROUP BY 
    EMPV.EPFNo,
    EMPV.NameWithInitial,
    DESG.DesignationName,
	EMPV.EmployeeRecruitmentType;

END
GO
