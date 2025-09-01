BEGIN
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'LeaveNotification')
    BEGIN
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
            ('LeaveNotification', -- Code
            'Leave Notification', -- Name
            'LeaveNotification.html', -- TemplateFile
            'SELECT ''Leave Application Notification'' AS Subject,
                    CONCAT(''Leave request has been submitted for LeaveApplicationId: '', @leaveApplicationId) AS BodyData', -- DataQuery
            'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]', -- FromQuery
            'SELECT ev.NameWithInitial, ev.PrivateEmail AS Email
             FROM cmn_EmployeeVersion ev
             WHERE ev.EmployeeId = (
                 SELECT la.EmployeeId 
                 FROM hrm_LeaveApplication la 
                 WHERE la.LeaveApplicationId = @leaveApplicationId
             )
             AND ev.DataStatus = 5
             UNION ALL
             SELECT ev.NameWithInitial, ev.PrivateEmail AS Email
             FROM cmn_EmployeeVersion ev
             WHERE ev.EmployeeId = (
                 SELECT la.CoveringEmployeeId 
                 FROM hrm_LeaveApplication la 
                 WHERE la.LeaveApplicationId = @leaveApplicationId
                   AND la.CoveringEmployeeId IS NOT NULL
             )
             AND ev.DataStatus = 5', -- ToQuery
            NULL, -- CcQuery
            NULL, -- BccQuery
            '<leaveApplicationId,guid>', -- Parameters
            1, -- Active
            GETDATE(), -- CreatedDate
            GETDATE()); -- UpdatedDate

        PRINT 'Insert successful into cmn_EmailNotificationConfig.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Record with Code ''LeaveNotification'' already exists in cmn_EmailNotificationConfig.';
    END
END
GO
