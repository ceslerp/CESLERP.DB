BEGIN
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'CircuitAttendanceRejected')
    BEGIN
        INSERT INTO [cmn_EmailNotificationConfig]
        (
            [Code],
            [Name],
            [TemplateFile],
            [DataQuery],
            [FromQuery],
            [ToQuery],
            [CcQuery],
            [BccQuery],
            [TupleParameters],
            [Active],
            [CreatedDate],
            [UpdatedDate]
        )
        VALUES
        (
            'CircuitAttendanceRejected',
            'Circuit Attendance Rejected',
            'ProjectNotifications.html',

            -- ✅ FIXED DataQuery
            'SELECT 
                ''Attendance Rejected'' AS Subject,
                CONCAT(
                    ''Attendance request from '', ISNULL(emp.NameWithInitial, ''''),
                    '' ('', ISNULL(emp.EPFNo, ''''), '') on '',
                    CONVERT(VARCHAR, ca.CircuitDate, 103),
                    CASE 
                        WHEN at.Name IS NOT NULL 
                        THEN '' for '' + at.Name 
                        ELSE '''' 
                    END,
                    '' has been rejected by '',
                    ISNULL(appr.NameWithInitial, ''''),
                    '' ('', ISNULL(appr.EPFNo, ''''), '').'',
                    CASE 
                        WHEN ca.RejectComment IS NOT NULL 
                        THEN '' Reason: '' + ca.RejectComment 
                        ELSE '''' 
                    END
                ) AS BodyData,
                ca.CircuitAttendanceId,
                ca.EmployeeId,
                emp.NameWithInitial AS EmployeeName,
                emp.EPFNo AS EmployeeEPFNo,
                ca.CircuitDate,
                at.Name AS AttendanceTypeName,
                appr.NameWithInitial AS ApproverName,
                appr.EPFNo AS ApproverEPFNo,
                ca.RejectComment
            FROM hrm_CircuitAttendance ca
            LEFT JOIN cmn_EmployeeVersion emp 
                ON emp.EmployeeId = ca.EmployeeId 
                AND emp.DataStatus = 5
                AND emp.Version = (
                    SELECT MAX(Version)
                    FROM cmn_EmployeeVersion
                    WHERE EmployeeId = ca.EmployeeId
                )
            LEFT JOIN cmn_EmployeeVersion appr 
                ON appr.EmployeeId = @userEmployeeId 
                AND appr.DataStatus = 5
                AND appr.Version = (
                    SELECT MAX(Version)
                    FROM cmn_EmployeeVersion
                    WHERE EmployeeId = @userEmployeeId
                )
            LEFT JOIN hrm_AttendanceType at
                ON at.AttendanceTypeId = ca.AttendanceTypeId
            WHERE ca.CircuitAttendanceId = @circuitAttendanceId',

            -- FromQuery
            'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]',

            -- ToQuery
            'SELECT ev.NameWithInitial,
                    ISNULL(ev.PrivateEmail, '''') AS Email
             FROM cmn_EmployeeVersion ev
             WHERE ev.EmployeeId = (
                 SELECT ca.EmployeeId 
                 FROM hrm_CircuitAttendance ca 
                 WHERE ca.CircuitAttendanceId = @circuitAttendanceId
             )
             AND ev.DataStatus = 5',

            NULL,
            NULL,

            '<circuitAttendanceId,guid><userEmployeeId,guid>',

            1,
            GETDATE(),
            GETDATE()
        );

        PRINT 'Insert successful into cmn_EmailNotificationConfig.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Record with Code ''CircuitAttendanceRejected'' already exists.';
    END
END
GO
