USE [ERP]
GO
/****** Object:  StoredProcedure [dbo].[cmn_SPGetMergeWorkspace]    Script Date: 6/26/2025 8:46:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [cmn_SPGetMergeWorkspace] '3d997732-5d4a-4d9a-b6cd-29915a42206f'

ALTER PROCEDURE [dbo].[cmn_SPGetMergeWorkspace] 
    @employeeId UNIQUEIDENTIFIER
AS
BEGIN
	SELECT MER.WorkSpaceId
	INTO #TempWorkspace
	FROM cmn_MergeWorkSpace MER
	WHERE MER.EmployeeId = @employeeId

	DECLARE @IntCnt INT
	SELECT @IntCnt = COUNT(WorkSpaceId) FROM #TempWorkspace
	
	IF(@IntCnt = 0)
	BEGIN
		DECLARE @EmpWorkSpaceId UNIQUEIDENTIFIER;
		SELECT @EmpWorkSpaceId = WorkSpaceId FROM cmn_EmployeeVersion WHERE EmployeeId = @employeeId

		INSERT INTO #TempWorkspace VALUES (@EmpWorkSpaceId)
	END

	SELECT *
	FROM #TempWorkspace
END