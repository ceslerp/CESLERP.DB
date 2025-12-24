USE [ERP]
GO
/****** Object:  StoredProcedure [dbo].[hrm_SPGetLeaveReport]    Script Date: 12/24/2025 8:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kaveen Vishwajith>
-- Create date: <12/23/2025>
-- Description:	<Retrieve Leave Report>
-- =============================================

--EXEC [hrm_SPGetLeaveReport] '03184801-a065-44c6-953c-279742106c99','aa732813-c489-4798-b4a4-890511fb3cf1'
ALTER PROCEDURE [dbo].[hrm_SPGetLeaveReport] 
	-- Add the parameters for the stored procedure here
	@LeaveApplicationId			UNIQUEIDENTIFIER
	--@EmployeeId					UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT EMPV.NameWithInitial, EMPV.EPFNo, EMPV.DateOfAppointment, 
		CASE WHEN EMPV.SOEUnitId IS NULL THEN WRK.WorkSpaceCode ELSE WRK1.WorkSpaceCode END AS Unit,
		CASE WHEN EMPV.PostId IS NULL OR EMPV.PostId = '29236937-3e03-4839-bdbc-452aaaeada78' THEN DSG.DesignationName ELSE PST.PostName END AS Designation,
		LEA.Address, LEB.PreviousCasual, LEB.PreviousAnnual, LEB.PreviousMedical, LEB.PreviousDuty, LEB.PreviousSpecialFullPay, LEB.PreviousSpecial, LEB.PreviousPaternity,
		LEB.PreviousAccident, LEB.PreviousSpecialNoPay, LEB.PreviousNoPay, LEB.PreviousLieu, LEB.PreviousMaternity, LEA.Reason,
		LEA.NoOfDays,LTY.LeaveCode, LEA.LeaveStartDate, LEA.LeaveEndDate, EMPV1.NameWithInitial AS CoveringEmployee
		FROM hrm_LeaveApplication LEA
		INNER JOIN cmn_EmployeeVersion EMPV ON LEA.EmployeeId = EMPV.EmployeeId
		LEFT OUTER JOIN cmn_EmployeeVersion EMPV1 ON LEA.CoveringEmployeeId = EMPV1.EmployeeId
		INNER JOIN cmn_WorkSpace WRK ON EMPV.WorkSpaceId = WRK.WorkSpaceId
		LEFT OUTER JOIN cmn_WorkSpace WRK1 ON EMPV.SOEUnitId = WRK1.WorkSpaceId
		INNER JOIN hrm_Designation DSG ON EMPV.DesignationId = DSG.DesignationId
		LEFT OUTER JOIN hrm_Post PST ON EMPV.PostId = PST.PostId
		INNER JOIN hrm_LeaveBalance LEB ON LEA.LeaveApplicationId = LEB.LeaveApplicationId
		INNER JOIN hrm_LeaveType LTY ON LEA.LeaveTypeId = LTY.LeaveTypeId
		WHERE LEA.LeaveApplicationId = @LeaveApplicationId
END
