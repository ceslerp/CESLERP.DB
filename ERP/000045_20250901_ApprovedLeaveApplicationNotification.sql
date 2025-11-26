BEGIN
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'LeaveApproved')
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
        (
            'LeaveApproved', -- Code
            'Leave Application Approved', -- Name
            'ProjectNotifications.html', -- TemplateFile
      
            'SELECT ''Leave is Approved'' AS Subject,
                   CONCAT(
                       ''Leave application from '', emp.NameWithInitial,
                       '' ('', emp.EPFNo, '') for '', lt.LeaveName, '' Leave'',
                       '' from '', CONVERT(VARCHAR, la.LeaveStartDate, 103),
                       '' to '', CONVERT(VARCHAR, la.LeaveEndDate, 103),
                       '' ('', la.NoOfDays, '' days) has been approved by '', 
                       appr.NameWithInitial,
                       '' ('', appr.EPFNo, '').''
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

                   -- NEW FIELD (only for covering employee) – simplified
                   CASE 
                       WHEN la.CoveringEmployeeId IS NOT NULL 
                       THEN ''You are the covering employee for '' + emp.NameWithInitial + ''.''
                       ELSE NULL
                   END AS CoveringMessage
            FROM hrm_LeaveApplication la
            LEFT JOIN cmn_EmployeeVersion emp 
                 ON emp.EmployeeId = la.EmployeeId AND emp.DataStatus = 5
            LEFT JOIN cmn_EmployeeVersion appr
                 ON appr.EmployeeId = @userEmployeeId AND appr.DataStatus = 5
            LEFT JOIN hrm_LeaveType lt
                 ON lt.LeaveTypeId = la.LeaveTypeId
            WHERE la.LeaveApplicationId = @leaveApplicationId',

            'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]',
    
            'SELECT ev.NameWithInitial,
                    ev.PrivateEmail AS Email
             FROM cmn_EmployeeVersion ev
             WHERE ev.EmployeeId = (
                 SELECT la.EmployeeId
                 FROM hrm_LeaveApplication la
                 WHERE la.LeaveApplicationId = @leaveApplicationId
             )
             AND ev.DataStatus = 5',

            'SELECT 
                ev.NameWithInitial,
                ev.PrivateEmail AS Email,
                ''You are the covering employee for '' + emp.NameWithInitial + ''.'' AS CoveringMessage
             FROM hrm_LeaveApplication la
             INNER JOIN cmn_EmployeeVersion ev 
                 ON ev.EmployeeId = la.CoveringEmployeeId AND ev.DataStatus = 5
             INNER JOIN cmn_EmployeeVersion emp 
                 ON emp.EmployeeId = la.EmployeeId AND emp.DataStatus = 5
             WHERE la.LeaveApplicationId = @leaveApplicationId
               AND la.CoveringEmployeeId IS NOT NULL',

            NULL,

            '<leaveApplicationId,guid><userEmployeeId,guid>',

            1,
            GETDATE(),
            GETDATE()
        );

        PRINT 'Insert successful into cmn_EmailNotificationConfig.';
    END
    ELSE
    BEGIN
        PRINT ''Error: LeaveApproved notification already exists.'';';
    END
END
GO
