USE [ERP]
GO
/****** Object:  StoredProcedure [dbo].[pm_SPGetMergeWorkspace]    Script Date: 5/7/2026 11:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [cmn_SPGetMergeWorkspace] '061e523f-e442-47ba-a523-737c2a38986d'

ALTER PROCEDURE [dbo].[pm_SPGetMergeWorkspace] 
    @employeeId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT MER.WorkSpaceId
	INTO #TempWorkspace
	FROM pm_MergeWorkSpace MER
	WHERE MER.EmployeeId = @employeeId

	DECLARE @IntCnt INT
	SELECT @IntCnt = COUNT(WorkSpaceId) FROM #TempWorkspace
	
	IF(@IntCnt = 0)
	BEGIN
		DECLARE @EmpWorkSpaceId UNIQUEIDENTIFIER;
				
			SELECT @EmpWorkSpaceId = WorkSpaceId
			FROM cmn_EmployeeVersion WHERE EmployeeId = @employeeId

			INSERT INTO #TempWorkspace VALUES (@EmpWorkSpaceId)
		
	END

	SELECT *
	FROM #TempWorkspace
END
