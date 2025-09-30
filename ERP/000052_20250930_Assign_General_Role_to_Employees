DECLARE @RoleId UNIQUEIDENTIFIER;
SET @RoleId = '26cc6702-2a7d-4ccb-b208-7122fdeb68f0';

INSERT INTO FRM.dbo.TSys_UserRole
SELECT 
    NEWID(),
    USR.UserId,
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
FROM FRM.dbo.[User] USR
WHERE USR.IsActive = 1
  AND NOT EXISTS (
        SELECT 1
        FROM FRM.dbo.TSys_UserRole UR
        WHERE UR.UserId = USR.UserId
          AND UR.RoleId = @RoleId
          AND UR.IsActive = 1
    );
