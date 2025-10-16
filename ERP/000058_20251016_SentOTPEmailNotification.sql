BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'SentOTP')
    BEGIN
        -- Insert the new notification configuration
        INSERT INTO [cmn_EmailNotificationConfig]
            ([Code]
            ,[Name]
            ,[TemplateFile]
            ,[DataQuery]
            ,[FromQuery]
            ,[ToQuery]
            ,[CcQuery]
            ,[BccQuery]
            ,[TupleParameters]
            ,[Active]
            ,[CreatedDate]
            ,[UpdatedDate])
        VALUES
            ('SentOTP', -- Code
            'OTP Sent', -- Name
            'ProjectNotifications.html', -- TemplateFile
            'SELECT TOP 1
    ''Your CESL Account OTP Code'' AS Subject,
    CONCAT(
        ''Dear '', ev.Title, '' '', ev.NameWithInitial, '', '',
        ''your One-Time Password (OTP) for account verification is '', @plainOtp, ''. '',
        ''This code is valid for the next 04 minutes. ''
    ) AS BodyData
FROM cmn_EmployeeVersion ev
WHERE ev.EmployeeId = @userEmployeeId
  AND ev.DataStatus = 5;', -- DataQuery
            'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]', -- FromQuery
            'SELECT 
    rv.NameWithInitial,  
    rv.Email AS Email
FROM EmployeeRoleView rv
WHERE rv.EmployeeId = @userEmployeeId;', -- ToQuery
            NULL, -- CcQuery
            NULL, -- BccQuery
            '<plainOtp,string><userEmployeeId,guid>', -- TupleParameters
            1, -- Active
            GETDATE(), -- CreatedDate
            GETDATE()); -- UpdatedDate

        PRINT 'Insert successful into cmn_EmailNotificationConfig for SentOTP.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Record with Code ''SentOTP'' already exists in cmn_EmailNotificationConfig.';
    END
END
GO
