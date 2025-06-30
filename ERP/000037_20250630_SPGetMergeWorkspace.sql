USE [ERP]
GO
/****** Object:  StoredProcedure [dbo].[cmn_SPGetMergeWorkspace]    Script Date: 6/30/2025 5:12:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [cmn_SPGetMergeWorkspace] 'ec6e740e-72c5-4d13-ac6a-4097ecc74b9c'

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
		SELECT @EmpWorkSpaceId = (CASE WHEN SOEUnitId IS NULL THEN WorkSpaceId ELSE SOEUnitId END)							
		FROM cmn_EmployeeVersion WHERE EmployeeId = @employeeId

		INSERT INTO #TempWorkspace VALUES (@EmpWorkSpaceId)
	END

	SELECT *
	FROM #TempWorkspace
END
