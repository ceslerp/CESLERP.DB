USE [ERP]
GO
/****** Object:  StoredProcedure [dbo].[fin_SPGetTaxInvoiceSummaryReport]    Script Date: 6/24/2026 4:48:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Kaveen Vishwajith
-- Create date: 23-Jun-2026
-- Description: Get Tax Invoice Summary Report (Summary)
-- =============================================
-- EXEC dbo.fin_SPGetTaxInvoiceSummaryReport @EmployeeId = 'aa732813-c489-4798-b4a4-890511fb3cf1'
CREATE PROCEDURE [dbo].[fin_SPGetTaxInvoiceSummaryReport]
    @InvoiceNo NVARCHAR(50) = NULL,
    @ClaimNo NVARCHAR(100) = NULL,
    @JobCode NVARCHAR(100) = NULL,
    @PurchaserName NVARCHAR(200) = NULL,
    @InvoiceType VARCHAR(10) = NULL,
    @DataStatus VARCHAR(10) = NULL,
    @DateFrom VARCHAR(30) = NULL,
    @DateTo VARCHAR(30) = NULL,
	@TotalAmountDue VARCHAR(50) = NULL,
	@ContractSum VARCHAR(50) = NULL,
	@TotalWorkDone VARCHAR(50) = NULL,
	@NetAmount VARCHAR(50) = NULL,
	@VATAmount VARCHAR(50) = NULL,
	@CreatedUserName NVARCHAR(200) = NULL,      
    @ApprovedUserName NVARCHAR(200) = NULL,    
    @CreatedDateFrom VARCHAR(30) = NULL,       
    @CreatedDateTo VARCHAR(30) = NULL,          
    @ApprovedDateFrom VARCHAR(30) = NULL,      
    @ApprovedDateTo VARCHAR(30) = NULL,       
    @Columns NVARCHAR(MAX) = NULL,
    @EmployeeId UNIQUEIDENTIFIER
	AS
BEGIN
	BEGIN
		SELECT MER.WorkSpaceId
		INTO #TempWorkspace
		FROM cmn_MergeWorkSpace MER
		WHERE MER.EmployeeId = @EmployeeId

		DECLARE @IntCnt INT
		SELECT @IntCnt = COUNT(WorkSpaceId) FROM #TempWorkspace
		
		IF(@IntCnt = 0)
		BEGIN
		INSERT INTO #TempWorkspace SELECT WorkSpaceId FROM cmn_EmployeeVersion WHERE EmployeeId = @EmployeeId
		END
	END
	DECLARE @IsSuperView BIT = 0;

	DECLARE @SuperViewTaxInvoiceRoleId UNIQUEIDENTIFIER = 'B6A369BC-C86C-465D-84AB-94AAB664EB88';
	IF EXISTS
	(
		SELECT 1
		FROM EmployeeRoleView
		WHERE EmployeeId = @EmployeeId
		  AND RoleId = @SuperViewTaxInvoiceRoleId
	)
	BEGIN
		SET @IsSuperView = 1;
	END

	DECLARE @InvoiceTypeInt INT = CASE WHEN @InvoiceType NOT LIKE '%[^0-9]%' AND @InvoiceType <> '' AND @InvoiceType <> '0' THEN CAST(@InvoiceType AS INT) ELSE NULL END
	DECLARE @DataStatusInt INT = CASE WHEN @DataStatus NOT LIKE '%[^0-9]%' AND @DataStatus <> '' AND @DataStatus <> '0' THEN CAST(@DataStatus AS INT) ELSE NULL END
    DECLARE @DateFromDate DATE = CASE WHEN ISDATE(@DateFrom) = 1 THEN CAST(@DateFrom AS DATE) ELSE NULL END
    DECLARE @DateToDate   DATE = CASE WHEN ISDATE(@DateTo) = 1 THEN CAST(@DateTo AS DATE) ELSE NULL END
	DECLARE @CreatedDateFromDate DATE = CASE WHEN ISDATE(@CreatedDateFrom) = 1 THEN CAST(@CreatedDateFrom AS DATE) ELSE NULL END;
    DECLARE @CreatedDateToDate   DATE = CASE WHEN ISDATE(@CreatedDateTo) = 1 THEN CAST(@CreatedDateTo AS DATE) ELSE NULL END;
    DECLARE @ApprovedDateFromDate DATE = CASE WHEN ISDATE(@ApprovedDateFrom) = 1 THEN CAST(@ApprovedDateFrom AS DATE) ELSE NULL END;
    DECLARE @ApprovedDateToDate   DATE = CASE WHEN ISDATE(@ApprovedDateTo) = 1 THEN CAST(@ApprovedDateTo AS DATE) ELSE NULL END;
	DECLARE @TotalAmountDueDec DECIMAL(18,2) = CASE WHEN REPLACE(@TotalAmountDue, ',', '') <> '' THEN CAST(REPLACE(@TotalAmountDue, ',', '') AS DECIMAL(18,2)) ELSE NULL END
	DECLARE @ContractSumDec DECIMAL(18,2) =	CASE WHEN REPLACE(@ContractSum, ',', '') <> '' THEN CAST(REPLACE(@ContractSum, ',', '') AS DECIMAL(18,2)) ELSE NULL END
	DECLARE @TotalWorkDoneDec DECIMAL(18,2) = CASE WHEN REPLACE(@TotalWorkDone, ',', '') <> ''	THEN CAST(REPLACE(@TotalWorkDone, ',', '') AS DECIMAL(18,2)) ELSE NULL END
	DECLARE @NetAmountDec DECIMAL(18,2) = CASE WHEN REPLACE(@NetAmount, ',', '') <> '' THEN CAST(REPLACE(@NetAmount, ',', '') AS DECIMAL(18,2)) ELSE NULL END
	DECLARE @VATAmountDec DECIMAL(18,2) = CASE WHEN REPLACE(@VATAmount, ',', '') <> '' THEN CAST(REPLACE(@VATAmount, ',', '') AS DECIMAL(18,2)) ELSE NULL END

    SELECT
        TI.InvoiceNo,
        TI.InvoiceDate,
        CLI.ClientName AS PurchaserName,
        CASE 
            WHEN TI.InvoiceType = 1 THEN 'Tax Invoice'
            WHEN TI.InvoiceType = 2 THEN 'MOB'
            WHEN TI.InvoiceType = 3 THEN 'Retention'
            ELSE '' 
        END AS InvoiceType,
        TI.TotalAmountDue,
        CASE 
            WHEN TI.DataStatus = 1 THEN 'Pending'
            WHEN TI.DataStatus = 4 THEN 'Rejected'
            WHEN TI.DataStatus = 5 THEN 'Approved'
            WHEN TI.DataStatus = 8 THEN 'Discarded'
            ELSE '' 
        END AS DataStatus,
        TI.ClaimNo,
        WRK.WorkSpaceCode + ' - ' + WRK.WorkSpaceName AS JobCode,
        COE.WorkSpaceCode + ' - ' + COE.WorkSpaceName AS [COE Unit],
        TI.ContractSum,
        TI.TotalWorkDone,
        TI.NetAmount,
        TI.VATAmount,
        TI.CreatedDateTime,
        TI.ApprovedDateTime,
		ISNULL(EMPV1.NameWithInitial, '') AS CreatedUserName,      -- Fixed
        ISNULL(EMPV2.NameWithInitial, '') AS ApprovedUserName      -- Fixed
    FROM fin_TaxInvoice TI
    LEFT JOIN cmn_WorkSpace WRK ON WRK.WorkSpaceId = TI.WorkspaceId
    LEFT JOIN cmn_WorkSpace COE ON COE.WorkSpaceId = TI.COEUnitId
    LEFT JOIN cmn_Client CLI ON CLI.ClientId = TI.ClientId
	LEFT JOIN FRM.[dbo].[User] USR ON TI.CreatedUserId = USR.UserId
	LEFT JOIN cmn_EmployeeVersion EMPV2 ON TI.ApprovedUserId = EMPV2.EmployeeId
	LEFT JOIN cmn_EmployeeVersion EMPV1 ON EMPV1.EmployeeCode = USR.EmployeeCode
    WHERE(@IsSuperView = 1 OR TI.COEUnitId IN (SELECT WorkSpaceId FROM #TempWorkspace))
      AND (@InvoiceNo IS NULL OR @InvoiceNo = '' OR TI.InvoiceNo LIKE '%' + @InvoiceNo + '%')
      AND (@ClaimNo IS NULL OR @ClaimNo = '' OR TI.ClaimNo LIKE '%' + @ClaimNo + '%')
      AND (@JobCode IS NULL OR @JobCode = '' OR WRK.WorkSpaceCode LIKE '%' + @JobCode + '%' OR WRK.WorkSpaceName LIKE '%' + @JobCode + '%')
      AND (@PurchaserName IS NULL OR @PurchaserName = '' OR CLI.ClientName LIKE '%' + @PurchaserName + '%')
      AND (@InvoiceTypeInt IS NULL OR @InvoiceType = '' OR TI.InvoiceType = @InvoiceTypeInt)
	  AND (@TotalAmountDueDec IS NULL OR TI.TotalAmountDue = @TotalAmountDueDec)
	  AND (@ContractSumDec IS NULL OR TI.ContractSum = @ContractSumDec)
	  AND (@TotalWorkDoneDec IS NULL OR TI.TotalWorkDone = @TotalWorkDoneDec)
	  AND (@NetAmountDec IS NULL OR TI.NetAmount = @NetAmountDec)
	  AND (@VATAmountDec IS NULL OR TI.VATAmount = @VATAmountDec)
	  AND (@CreatedUserName IS NULL OR @CreatedUserName = '' OR EMPV1.NameWithInitial LIKE '%' + @CreatedUserName + '%')
	  AND (@ApprovedUserName IS NULL OR @ApprovedUserName = '' OR EMPV2.NameWithInitial LIKE '%' + @ApprovedUserName + '%')
	  AND (@CreatedDateFromDate IS NULL OR TI.CreatedDateTime >= @CreatedDateFromDate)
      AND (@CreatedDateToDate IS NULL OR TI.CreatedDateTime < DATEADD(DAY, 1, @CreatedDateToDate))
      AND (@ApprovedDateFromDate IS NULL OR TI.ApprovedDateTime >= @ApprovedDateFromDate)
      AND (@ApprovedDateToDate IS NULL OR TI.ApprovedDateTime < DATEADD(DAY, 1, @ApprovedDateToDate))
      AND (@DataStatusInt IS NULL OR @DataStatus = '' OR TI.DataStatus = @DataStatusInt)
      AND (@DateFromDate IS NULL OR TI.InvoiceDate >= @DateFromDate)
      AND (@DateToDate IS NULL OR TI.InvoiceDate < DATEADD(DAY, 1, @DateToDate))
    ORDER BY TI.InvoiceDate DESC, TI.InvoiceNo;
    DROP TABLE #TempWorkspace;
END

