BEGIN
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'CircuitAttendanceApproved')
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
            'CircuitAttendanceApproved',
            'Circuit Attendance Approved',
            'ProjectNotifications.html',

            -- ✅ DataQuery
            'SELECT 
                ''Attendance Approved'' AS Subject,
                CONCAT(
                    ''Attendance request from '', emp.NameWithInitial,
                    '' ('', emp.EPFNo, '') on '',
                    CONVERT(VARCHAR, ca.CircuitDate, 103),
                    CASE 
                        WHEN at.AttendanceTypeName IS NOT NULL 
                        THEN '' for '' + at.AttendanceTypeName 
                        ELSE '''' 
                    END,
                    '' has been approved by '',
                    appr.NameWithInitial,
                    '' ('', appr.EPFNo, '').''
                ) AS BodyData,
                ca.CircuitAttendanceId,
                ca.EmployeeId,
                emp.NameWithInitial AS EmployeeName,
                emp.EPFNo AS EmployeeEPFNo,
                ca.CircuitDate,
                at.AttendanceTypeName,
                appr.NameWithInitial AS ApproverName,
                appr.EPFNo AS ApproverEPFNo
            FROM hrm_CircuitAttendance ca
            LEFT JOIN cmn_EmployeeVersion emp 
                    ON emp.EmployeeId = ca.EmployeeId 
                    AND emp.DataStatus = 5
            LEFT JOIN cmn_EmployeeVersion appr
                    ON appr.EmployeeId = @userEmployeeId 
                    AND appr.DataStatus = 5
            LEFT JOIN hrm_AttendanceType at
                    ON at.AttendanceTypeId = ca.AttendanceTypeId
            WHERE ca.CircuitAttendanceId = @circuitAttendanceId',

            -- FromQuery
            'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]',

            -- ✅ ToQuery (Send to Employee)
            'SELECT ev.NameWithInitial,
                    ev.PrivateEmail AS Email
             FROM cmn_EmployeeVersion ev
             WHERE ev.EmployeeId = (
                    SELECT ca.EmployeeId
                    FROM hrm_CircuitAttendance ca
                    WHERE ca.CircuitAttendanceId = @circuitAttendanceId
             )
             AND ev.DataStatus = 5',

            -- No CC
            NULL,

            -- No BCC
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
        PRINT 'Error: Record with Code ''CircuitAttendanceApproved'' already exists.';
    END
END
GO
Is this also Ok for approved mail
