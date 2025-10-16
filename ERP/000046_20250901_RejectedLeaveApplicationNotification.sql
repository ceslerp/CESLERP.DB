BEGIN
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'LeaveRejected')
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
            ('LeaveRejected', -- Code
            'Leave Application Rejected', -- Name
            'ProjectNotifications.html', -- TemplateFile
            'SELECT ''Leave is Rejected'' AS Subject,
                   CONCAT(
                       ''Leave application from '', emp.NameWithInitial,
                       '' ('', emp.EPFNo, '') for '', lt.LeaveName, '' Leave'',
                       '' from '', CONVERT(VARCHAR, la.LeaveStartDate, 103),
                       '' to '', CONVERT(VARCHAR, la.LeaveEndDate, 103),
                       '' ('', la.NoOfDays, '' days) has been rejected by '', 
                       appr.NameWithInitial,
                       '' ('', appr.EPFNo, '').'',
                       CASE WHEN la.RejectComment IS NOT NULL THEN '' Reason: '' + la.RejectComment ELSE '''' END
                   ) AS BodyData,
                   la.LeaveApplicationId,
                   la.EmployeeId,
                   emp.NameWithInitial AS EmployeeName,
                   emp.EPFNo AS EmployeeEPFNo,
                   lt.LeaveName + '' Leave'' AS LeaveType,
                   la.LeaveStartDate,
                   la.LeaveEndDate,
                   la.NoOfDays,
                   appr.NameWithInitial AS ApproverName,
                   appr.EPFNo AS ApproverEPFNo,
                   la.RejectComment
            FROM hrm_LeaveApplication la
            LEFT JOIN cmn_EmployeeVersion emp ON emp.EmployeeId = la.EmployeeId 
                AND emp.DataStatus = 5
            LEFT JOIN cmn_EmployeeVersion appr ON appr.EmployeeId = @userEmployeeId 
                AND appr.DataStatus = 5
            LEFT JOIN hrm_LeaveType lt ON lt.LeaveTypeId = la.LeaveTypeId
            WHERE la.LeaveApplicationId = @leaveApplicationId', -- DataQuery
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
            '<leaveApplicationId,guid><userEmployeeId,guid>', -- Parameters
            1, -- Active
            GETDATE(), -- CreatedDate
            GETDATE()); -- UpdatedDate

        PRINT 'Insert successful into cmn_EmailNotificationConfig.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Record with Code ''LeaveRejected'' already exists in cmn_EmailNotificationConfig.';
    END
END
GO
