IF OBJECT_ID('dbo.EmployeeRoleView', 'V') IS NOT NULL
    DROP VIEW dbo.EmployeeRoleView;
GO

CREATE VIEW dbo.EmployeeRoleView AS
SELECT 
    r.RoleId, 
    r.RoleCode, 
    ur.UserId, 
    u.UserName, 
    ev.NameWithInitial, 
    ev.PrivateEmail AS Email,
    ev.EmployeeId,
    ev.WorkspaceId
FROM FRM.dbo.TSys_UserRole ur
LEFT JOIN FRM.dbo.TSys_Role r ON r.RoleId = ur.RoleId
LEFT JOIN FRM.dbo.Users u ON u.UserId = ur.UserId
INNER JOIN cmn_EmployeeVersion ev ON ev.EPFNo = u.UserName AND ev.DataStatus = 5
WHERE ur.IsActive = 1;
GO

BEGIN
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'LeaveApproval')
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
            'LeaveApproval',
            'LeaveApproval',
            'ProjectNotifications.html',

            -- DataQuery (UNCHANGED)
            'SELECT 
                ''Leave Application – Approval Pending'' AS Subject,
                CONCAT(
                    ''Leave application from '', ev.NameWithInitial,
                    '' ('', ev.EPFNo, '') for '', lt.LeaveName, '' Leave'', 
                    '' from '', CONVERT(VARCHAR, la.LeaveStartDate, 103),
                    '' to '', CONVERT(VARCHAR, la.LeaveEndDate, 103),
                    '' ('', la.NoOfDays, '' days)'',
                    CASE WHEN la.Reason IS NOT NULL THEN ''. Reason: '' + la.Reason ELSE '''' END
                ) AS BodyData,
                la.LeaveApplicationId,
                la.EmployeeId,
                ev.NameWithInitial AS EmployeeName,
                ev.EPFNo,
                CONCAT(lt.LeaveName, '' Leave'') AS LeaveName, 
                la.LeaveStartDate,
                la.LeaveEndDate,
                la.NoOfDays,
                la.Reason
            FROM hrm_LeaveApplication la
            INNER JOIN cmn_EmployeeVersion ev 
                ON ev.EmployeeId = la.EmployeeId 
                AND ev.DataStatus = 5
            INNER JOIN hrm_LeaveType lt 
                ON lt.LeaveTypeId = la.LeaveTypeId
            WHERE la.LeaveApplicationId = @leaveApplicationId',

            -- FromQuery (UNCHANGED)
            'select ''notifications.ceslerp@gmail.com'' as [Email]',

            -- ToQuery (UPDATED WITH @employeeId LOGIC)
            'DECLARE @employeeId UNIQUEIDENTIFIER;

            SELECT @employeeId = EmployeeId
            FROM hrm_LeaveApplication
            WHERE LeaveApplicationId = @leaveApplicationId;

            SELECT DISTINCT rv.NameWithInitial, rv.Email
            FROM EmployeeRoleView rv
            WHERE rv.EmployeeId IN (

                SELECT ws.HeadOfWorkSpace
                FROM cmn_EmployeeVersion ev
                INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.SOEUnitId
                WHERE ev.EmployeeId = @employeeId
                  AND ev.DataStatus = 5
                  AND ev.SOEUnitId IS NOT NULL
                  AND ev.SOEUnitId != ''00000000-0000-0000-0000-000000000000''
                  AND ws.HeadOfWorkSpace IS NOT NULL
                  AND ws.HeadOfWorkSpace != ev.EmployeeId
                  AND NOT EXISTS (
                      SELECT 1 FROM cmn_WorkSpace coe_ws 
                      WHERE coe_ws.WorkSpaceId = ev.WorkSpaceId 
                      AND coe_ws.HeadOfWorkSpace = ev.EmployeeId
                  )

                UNION

                SELECT ws.HeadOfWorkSpace
                FROM cmn_EmployeeVersion ev
                INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.WorkSpaceId
                WHERE ev.EmployeeId = @employeeId
                  AND ev.DataStatus = 5
                  AND (ev.SOEUnitId IS NULL OR ev.SOEUnitId = ''00000000-0000-0000-0000-000000000000'')
                  AND ws.HeadOfWorkSpace IS NOT NULL
                  AND ws.HeadOfWorkSpace != ev.EmployeeId

                UNION

                SELECT ws_main.HeadOfWorkSpace
                FROM cmn_EmployeeVersion ev
                INNER JOIN cmn_WorkSpace ws_soe ON ws_soe.WorkSpaceId = ev.SOEUnitId
                INNER JOIN cmn_WorkSpace ws_main ON ws_main.WorkSpaceId = ev.WorkSpaceId
                WHERE ev.EmployeeId = @employeeId
                  AND ev.DataStatus = 5
                  AND ev.SOEUnitId IS NOT NULL
                  AND ev.SOEUnitId != ''00000000-0000-0000-0000-000000000000''
                  AND ws_soe.HeadOfWorkSpace IS NULL
                  AND ws_main.HeadOfWorkSpace IS NOT NULL
                  AND ws_main.HeadOfWorkSpace != ev.EmployeeId

                UNION

                SELECT ws_main.HeadOfWorkSpace
                FROM cmn_EmployeeVersion ev
                INNER JOIN cmn_WorkSpace ws_soe ON ws_soe.WorkSpaceId = ev.SOEUnitId
                INNER JOIN cmn_WorkSpace ws_main ON ws_main.WorkSpaceId = ev.WorkSpaceId
                WHERE ev.EmployeeId = @employeeId
                  AND ev.DataStatus = 5
                  AND ev.SOEUnitId IS NOT NULL
                  AND ev.SOEUnitId != ''00000000-0000-0000-0000-000000000000''
                  AND ws_soe.HeadOfWorkSpace = ev.EmployeeId  
                  AND ws_main.HeadOfWorkSpace IS NOT NULL
                  AND ws_main.HeadOfWorkSpace != ev.EmployeeId

                UNION

                SELECT ceo.EmployeeId
                FROM cmn_EmployeeVersion ev
                INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.WorkSpaceId
                CROSS JOIN EmployeeRoleView ceo
                WHERE ev.EmployeeId = @employeeId
                  AND ev.DataStatus = 5
                  AND ws.HeadOfWorkSpace = ev.EmployeeId 
                  AND ceo.RoleCode = ''CEO''
            )
            AND rv.Email IS NOT NULL',

            NULL,
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
        PRINT 'Error: Record with Code ''LeaveApproval'' already exists in cmn_EmailNotificationConfig.';
    END
END

