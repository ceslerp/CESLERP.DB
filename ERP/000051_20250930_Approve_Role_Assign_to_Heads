SET NOCOUNT ON;

DECLARE @COEUnitTypeId UNIQUEIDENTIFIER;
DECLARE @SOEUnitTypeId UNIQUEIDENTIFIER;
DECLARE @RoleId UNIQUEIDENTIFIER;

SET @COEUnitTypeId = 'bd1cf5f7-0a8c-4880-a44a-71650416d11a';
SET @SOEUnitTypeId = 'bd1cf5f7-0a8c-4880-a44a-71650416d09e';
SET @RoleId        = 'b16032f8-9da0-4e71-bd06-075ceb66bd71';

BEGIN TRY
    BEGIN TRANSACTION;

    INSERT INTO FRM.dbo.TSys_UserRole
    SELECT 
        NEWID(),
        WRK.HeadOfWorkSpace,
        @RoleId,
        1,
        'bae027a7-2fa5-41ba-8753-1450fd21b181',  
        'O0001',                                 
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',  
        'B0001',                                 
        GETDATE(),                               
        'd3d1ba1e-6dd1-4eea-aa12-a025c838bc9d',  
        NULL,
        NULL
    FROM cmn_WorkSpace WRK
    WHERE WRK.WorkSpaceTypeId IN (@COEUnitTypeId, @SOEUnitTypeId)
      AND WRK.IsActive = 1
      AND WRK.HeadOfWorkSpace IS NOT NULL
      AND WRK.HeadOfWorkSpace IS NOT NULL
      AND NOT EXISTS (
            SELECT 1
            FROM FRM.dbo.TSys_UserRole UR
            WHERE UR.UserId = WRK.HeadOfWorkSpace
              AND UR.RoleId = @RoleId
              AND UR.IsActive = 1
        );

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
