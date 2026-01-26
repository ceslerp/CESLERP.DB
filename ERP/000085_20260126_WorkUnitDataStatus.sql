UPDATE cmn_WorkSpace
SET DataStatus = 
    CASE 
        WHEN IsActive = 1 THEN 5
        WHEN IsActive = 0 THEN 8
    END
WHERE DataStatus IS NULL;
