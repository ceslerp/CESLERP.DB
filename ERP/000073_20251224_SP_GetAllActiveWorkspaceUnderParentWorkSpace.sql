USE [ERP]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[cmn_SPGetAllActiveWorkspaceUnderParentWorkSpace] 
(
    @employeeId UNIQUEIDENTIFIER,
    @permissionType INT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF (@permissionType = 2)
    BEGIN
        SELECT 
            WorkSpaceId AS Id,
            (WorkSpaceCode + '-' + WorkSpaceName) AS Text
        FROM cmn_WorkSpace
        WHERE IsActive = 1
        ORDER BY WorkSpaceName;

        RETURN;
    END

    ;WITH ret AS
    (
        SELECT *
        FROM cmn_WorkSpace
        WHERE WorkSpaceId IN
        (
            SELECT WorkSpaceId
            FROM cmn_EmployeeVersion
            WHERE EmployeeId = @employeeId
        )

        UNION ALL

        SELECT t.*
        FROM cmn_WorkSpace t
        INNER JOIN ret r
            ON t.ParentWorkSpaceId = r.WorkSpaceId
    )
    SELECT DISTINCT
        WorkSpaceId AS Id,
        (WorkSpaceCode + '-' + WorkSpaceName) AS Text
    FROM ret
    WHERE IsActive = 1
    ORDER BY Text
    OPTION (MAXRECURSION 32767);
END



