BEGIN TRY
    BEGIN TRANSACTION;

    -- Drop the procedure if it already exists
    IF OBJECT_ID('[dbo].[cmn_SPGetAllWorkspaceUnderParentWorkSpaceAll]', 'P') IS NOT NULL
    BEGIN
        DROP PROCEDURE [dbo].[cmn_SPGetAllWorkspaceUnderParentWorkSpaceAll];
    END
    COMMIT TRANSACTION; -- Commit the DROP operation

END TRY
BEGIN CATCH
    -- Rollback on error
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Error occurred while dropping the procedure: ' + ERROR_MESSAGE();
    RETURN;
END CATCH
GO

-- Create the procedure
CREATE PROCEDURE [dbo].[cmn_SPGetAllWorkspaceUnderParentWorkSpaceAll] 
    @workSpaceId NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH ret AS (
        SELECT *
        FROM [ERP].[dbo].[cmn_WorkSpace]
        WHERE [WorkSpaceId] = @workSpaceId
        UNION ALL
        SELECT t.*
        FROM [ERP].[dbo].[cmn_WorkSpace] t
            INNER JOIN ret r ON t.[ParentWorkSpaceId] = r.[WorkSpaceId]
    )
    SELECT [WorkSpaceId]
    FROM ret
    OPTION (MAXRECURSION 32767);
END;
GO
