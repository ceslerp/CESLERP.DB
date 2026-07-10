USE [ERP]
GO
/****** Object:  StoredProcedure [dbo].[hrm_SPGetLeaveDetailReport]    Script Date: 7/9/2026 2:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description: Leave Detail Report
-- Kaveen
-- 2026.05.19
-- =============================================
-- EXEC hrm_SPGetLeaveDetailReport @EmployeeId='aa732813-c489-4798-b4a4-890511fb3cf1',  @DateRangeFrom='2026-04-01', @DateRangeTo='2026-04-30'
ALTER PROCEDURE [dbo].[hrm_SPGetLeaveDetailReport]
    @EmployeeId              UNIQUEIDENTIFIER,
    @EPFNo                   VARCHAR(50)  = NULL,
    @NameWithInitial         VARCHAR(200) = NULL,
    @Designation             VARCHAR(150) = NULL,
    @COEUnit                 VARCHAR(100) = NULL,
    @SOEUnit                 VARCHAR(100) = NULL,
    @EmployeeCategory        VARCHAR(10)  = NULL,
    @AppointmentType         VARCHAR(10)  = NULL,
    @DateRangeFrom           VARCHAR(30)  = NULL,
    @DateRangeTo             VARCHAR(30)  = NULL,
	@Columns NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TempWorkspaces TABLE (WorkSpaceId UNIQUEIDENTIFIER NOT NULL);
    INSERT INTO @TempWorkspaces EXEC cmn_SPGetMergeWorkspace @EmployeeId, 2;

    DECLARE @FromDate DATE = CASE WHEN ISDATE(@DateRangeFrom) = 1 THEN CAST(@DateRangeFrom AS DATE) ELSE NULL END;
    DECLARE @ToDate   DATE = CASE WHEN ISDATE(@DateRangeTo)   = 1 THEN CAST(@DateRangeTo   AS DATE) ELSE NULL END;

    WITH FilteredLeaveData AS (
        SELECT
            LAD.LeaveApplicationId,
            LAD.EmployeeId,
            LAD.LeaveTypeId,
            LAD.LeaveFraction,
            EMPV.EPFNo,
            EMPV.NameWithInitial,
            EMPV.EmployeeRecruitmentType,
            EMPV.TypeOfContract,
            DESG.DesignationName,
            WS_COE.WorkSpaceCode AS DepartmentCode,
            WS_SOE.WorkSpaceCode AS BranchCode,
            LA.CreatedDateTime
        FROM hrm_LeaveApplicationDetail LAD
        INNER JOIN hrm_LeaveApplication  LA   ON LAD.LeaveApplicationId = LA.LeaveApplicationId
        INNER JOIN cmn_EmployeeVersion   EMPV ON LAD.EmployeeId = EMPV.EmployeeId
        LEFT  JOIN hrm_Designation       DESG ON EMPV.DesignationId = DESG.DesignationId
        LEFT  JOIN cmn_WorkSpace         WS_COE ON EMPV.WorkSpaceId = WS_COE.WorkSpaceId
        LEFT  JOIN cmn_WorkSpace         WS_SOE ON EMPV.SOEUnitId   = WS_SOE.WorkSpaceId
        
        WHERE
            EMPV.IsActive = 1
            AND EMPV.EPFNo <> '000000'
            AND EMPV.WorkSpaceId IN (SELECT WorkSpaceId FROM @TempWorkspaces)
            -- Date range filters
            AND (@FromDate IS NULL OR CAST(LAD.LeaveDate AS DATE) >= @FromDate)
	    AND (@ToDate IS NULL OR CAST(LAD.LeaveDate AS DATE) <= @ToDate)
            -- Employee attribute filters
            AND (@EPFNo            IS NULL OR @EPFNo            = '' OR EMPV.EPFNo            LIKE '%' + @EPFNo + '%')
            AND (@NameWithInitial  IS NULL OR @NameWithInitial  = '' OR EMPV.NameWithInitial  LIKE '%' + @NameWithInitial + '%')
            AND (@Designation      IS NULL OR @Designation      = '' OR DESG.DesignationName  LIKE '%' + @Designation + '%')
            AND (@COEUnit       IS NULL OR @COEUnit       = '' OR WS_COE.WorkSpaceCode  LIKE '%' + @COEUnit + '%')
            AND (@SOEUnit           IS NULL OR @SOEUnit           = '' OR WS_SOE.WorkSpaceCode  LIKE '%' + @SOEUnit + '%')
            AND (@EmployeeCategory IS NULL OR @EmployeeCategory = '' OR @EmployeeCategory = '0' OR EMPV.EmployeeRecruitmentType = @EmployeeCategory)
            AND (@AppointmentType  IS NULL OR @AppointmentType  = '' OR @AppointmentType = '0' OR EMPV.TypeOfContract = @AppointmentType)
    )

    SELECT
        EmployeeId,
        EPFNo,
        NameWithInitial,
        DesignationName                                                 AS Designation,
        DepartmentCode                                                  AS COEUnit,
        BranchCode                                                      AS SOEUnit,
        CASE WHEN EmployeeRecruitmentType = '1' THEN 'CECB'
             WHEN EmployeeRecruitmentType = '2' THEN 'CESL'
             ELSE '' END                                                AS EmployeeCategory,
        CASE WHEN TypeOfContract = '1' THEN 'Permanent'
             WHEN TypeOfContract = '5' THEN 'Contract'
             ELSE '' END                                                AS AppointmentType,
			 MAX(CreatedDateTime)                                       AS CreatedDateTime,

        COALESCE(SUM(CASE WHEN LeaveTypeId = 'b886edb2-6e4d-4e50-9669-9fe7cf0fc7c7' THEN LeaveFraction ELSE 0 END), 0) AS Casual,
        COALESCE(SUM(CASE WHEN LeaveTypeId = '89ff6742-d0ea-4a0f-9c97-0127043411ca' THEN LeaveFraction ELSE 0 END), 0) AS Annual,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'daf1eb45-6580-401a-8fb1-fb1fb9356648' THEN LeaveFraction ELSE 0 END), 0) AS Medical,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'b4e902de-6e07-4eb5-a9d1-383ea62a60a8' THEN LeaveFraction ELSE 0 END), 0) AS Accident,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'add3702f-4210-499f-8822-07fd0444c19c' THEN LeaveFraction ELSE 0 END), 0) AS Duty,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'bfd472b7-c255-4e56-9d4e-b96de2dffc3b' THEN LeaveFraction ELSE 0 END), 0) AS Maternity,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'a64c02c2-c53c-4661-8786-a6fcd19f51b8' THEN LeaveFraction ELSE 0 END), 0) AS Lieu,
        COALESCE(SUM(CASE WHEN LeaveTypeId = '13d21c76-260f-44a4-b25e-9987e6d5415f' THEN LeaveFraction ELSE 0 END), 0) AS NoPay,
        COALESCE(SUM(CASE WHEN LeaveTypeId = '522615d1-8d58-427f-a121-328836a6632f' THEN LeaveFraction ELSE 0 END), 0) AS Special,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'fe0a689a-15ca-4cee-a6bf-32d17fc163b3' THEN LeaveFraction ELSE 0 END), 0) AS Paternity,
        COALESCE(SUM(CASE WHEN LeaveTypeId = 'b0695296-5d3e-461f-810c-23be0bdb5e12' THEN LeaveFraction ELSE 0 END), 0) AS SpecialFullPay,
        COALESCE(SUM(CASE WHEN LeaveTypeId = '140293d7-2d82-4d83-a812-627b6c912e4e' THEN LeaveFraction ELSE 0 END), 0) AS SpecialNoPay

    FROM FilteredLeaveData

    GROUP BY
        EmployeeId,
        EPFNo,
        NameWithInitial,
        DesignationName,
        DepartmentCode,
        BranchCode,
        EmployeeRecruitmentType,
        TypeOfContract

    ORDER BY
        --CreatedDateTime DESC,
        --EmployeeRecruitmentType,
        EPFNo;

END
