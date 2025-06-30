-- Drop temp table first if it exists
IF OBJECT_ID('tempdb..#T') IS NOT NULL
    DROP TABLE #T

-- Create temp table with distinct active userIds
SELECT userId 
INTO #T
FROM TSys_UserRole 
WHERE IsActive = 1
GROUP BY userId 

-- See what you selected
SELECT * FROM #T

-- Declare variables for cursor
DECLARE @UserId uniqueidentifier

-- Declare cursor to loop through #T
DECLARE user_cursor CURSOR FOR
SELECT userId FROM #T

OPEN user_cursor
FETCH NEXT FROM user_cursor INTO @UserId

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Insert new record for this user
    INSERT INTO TSys_UserRole (
        UserRoleId,
        UserId,
        RoleId,
        IsActive,
        OrganizationId,
        OrganizationCode,
        BusinessUnitId,
        BusinessUnitCode,
        CreatedDateTime,
        CreatedUserId,
        UpdatedDateTime,
        UpdatedUserId
    )
    VALUES (
        NEWID(),                                -- UserRoleId
        @UserId,                                -- <-- use the UserId from cursor
        '26cc6702-2a7d-4ccb-b208-7122fdeb68f0',  -- RoleId
        1,                                      -- IsActive
        'bae027a7-2fa5-41ba-8753-1450fd21b181', -- OrganizationId
        '',                                     -- OrganizationCode
        'f8ad62ee-8fc1-41c8-bf8d-2f1dfebd1d0a',  -- BusinessUnitId
        '',                                     -- BusinessUnitCode
        GETDATE(),                              -- CreatedDateTime
        @UserId,                                -- CreatedUserId (or use your userId)
        NULL,                                   -- UpdatedDateTime
        NULL                                    -- UpdatedUserId
    )

    FETCH NEXT FROM user_cursor INTO @UserId
END

CLOSE user_cursor
DEALLOCATE user_cursor

-- Drop temp table
DROP TABLE #T
GO
