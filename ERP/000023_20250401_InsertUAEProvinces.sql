BEGIN TRY
    -- Ensure the referenced CountryID exists before inserting
    IF NOT EXISTS (SELECT 1 FROM cmn_Country WHERE CountryId = '22222222-2222-2222-2222-222222222222')
    BEGIN
        RAISERROR('Invalid CountryId: The referenced country does not exist.', 16, 1);
        RETURN;
    END

    -- Insert provinces only if they do not already exist
    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Abu Dhabi', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Abu Dhabi');

    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Dubai', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Dubai');

    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Sharjah', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Sharjah');

    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Ajman', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Ajman');

    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Umm Al-Quwain', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Umm Al-Quwain');

    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Ras Al Khaimah', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Ras Al Khaimah');

    INSERT INTO hrm_Province (ProvinceID, ProvinceName, CountryID)
    SELECT 
        NEWID(), 'Fujairah', '22222222-2222-2222-2222-222222222222'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_Province WHERE ProvinceName = 'Fujairah');

    PRINT 'Provinces inserted successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;
