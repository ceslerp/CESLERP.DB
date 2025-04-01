BEGIN TRY
    -- Insert districts only if they do not already exist
    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Abu Dhabi', '925a76bb-b7c1-4b2e-8d8a-64c452ad0a57'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Abu Dhabi');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Al Ain', '925a76bb-b7c1-4b2e-8d8a-64c452ad0a57'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Al Ain');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Madinat Zayed', '925a76bb-b7c1-4b2e-8d8a-64c452ad0a57'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Madinat Zayed');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Ruwais', '925a76bb-b7c1-4b2e-8d8a-64c452ad0a57'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Ruwais');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Dubai', 'c1edf205-d2ba-404c-8e0c-049d472706cc'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Dubai');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Sharjah', '5136f53d-bbf6-4eaa-b11b-7c2ddfa33645'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Sharjah');

    INSERT INTO hrm_District (DistrictID, DistrictName, ProvinceId)
    SELECT NEWID(), 'Khor Fakkan', '5136f53d-bbf6-4eaa-b11b-7c2ddfa33645'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Khor Fakkan');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Kalba', '5136f53d-bbf6-4eaa-b11b-7c2ddfa33645'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Kalba');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Dibba Al-Hisn', '5136f53d-bbf6-4eaa-b11b-7c2ddfa33645'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Dibba Al-Hisn');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Ajman', '6198a5a4-8bd2-492b-907b-13774351c672'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Ajman');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Umm Al-Quwain', '6e34c21b-bd14-4db4-ac8f-04169b29b602'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Umm Al-Quwain');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Ras Al Khaimah', '278d0ec3-430b-4dfb-a554-374241fbaea6'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Ras Al Khaimah');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Al Rams', '278d0ec3-430b-4dfb-a554-374241fbaea6'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Al Rams');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Al Jazirah Al Hamra', '278d0ec3-430b-4dfb-a554-374241fbaea6'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Al Jazirah Al Hamra');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Fujairah', '4ba9837b-a86c-4e5e-a0c4-3856d6e41bc7'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Fujairah');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Dibba Al-Fujairah', '4ba9837b-a86c-4e5e-a0c4-3856d6e41bc7'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Dibba Al-Fujairah');

    INSERT INTO hrm_District (DistrictId, DistrictName, ProvinceId)
    SELECT NEWID(), 'Masafi', '4ba9837b-a86c-4e5e-a0c4-3856d6e41bc7'
    WHERE NOT EXISTS (SELECT 1 FROM hrm_District WHERE DistrictName = 'Masafi');

    PRINT 'Districts inserted successfully.';
END TRY
BEGIN CATCH
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;
