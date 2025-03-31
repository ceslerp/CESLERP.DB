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
    ev.WorkspaceId,
	ev.SOEUnitId
FROM FRM.dbo.TSys_UserRole ur
LEFT JOIN FRM.dbo.TSys_Role r ON r.RoleId = ur.RoleId
LEFT JOIN FRM.dbo.Users u ON u.UserId = ur.UserId
INNER JOIN cmn_EmployeeVersion ev ON ev.EPFNo = u.UserName AND ev.DataStatus = 5
WHERE ur.IsActive = 1;
GO

BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'COEProjectApproval')
    BEGIN
          -- Insert the new notification configuration
            UPDATE cmn_EmailNotificationConfig SET [DataQuery] = 'SELECT ''Project Approval Notification - COE'' AS Subject, 
				CONCAT(
					''Project code request "'', w.WorkSpaceName, 
					''" from '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '') is pending for your approval.''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', [TemplateFile] = 'ProjectNotifications.html'
				where Code = 'COEProjectApproval'
				   
    END
END
BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'CEOProjectApproval')
    BEGIN
          -- Insert the new notification configuration
            UPDATE cmn_EmailNotificationConfig SET [DataQuery] = 'SELECT ''Project Approval Notification - CEO'' AS Subject, 
				CONCAT(
					''Project code request "'', w.WorkSpaceName, 
					''" from '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '') is pending for your approval.''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', [TemplateFile] = 'ProjectNotifications.html'
				where Code = 'CEOProjectApproval'
				   
    END
END
BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'ProjectApproved')
    BEGIN
          -- Insert the new notification configuration
            UPDATE cmn_EmailNotificationConfig SET [DataQuery] = 'SELECT ''Project is Approved'' AS Subject, 
				CONCAT(
					''Project code "'', w.WorkSpaceName, 
					''" is approved by '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '').''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', [TemplateFile] = 'ProjectNotifications.html'
				where Code = 'ProjectApproved'
				   
    END
END
BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'COEProjectRejected')
    BEGIN
          -- Insert the new notification configuration
            UPDATE cmn_EmailNotificationConfig SET [DataQuery] = 'SELECT ''Project Rejected Notification - COE'' AS Subject, 
				CONCAT(
					''Project code "'', w.WorkSpaceName, 
					''" is rejected by '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '').''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', [TemplateFile] = 'ProjectNotifications.html'
				where Code = 'COEProjectRejected'
				   
    END
END
BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'CEOProjectRejected')
    BEGIN
          -- Insert the new notification configuration
            UPDATE cmn_EmailNotificationConfig SET [DataQuery] = 'SELECT ''Project Rejected Notification - CEO'' AS Subject, 
				CONCAT(
					''Project code "'', w.WorkSpaceName, 
					''" is rejected by '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '').''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', [TemplateFile] = 'ProjectNotifications.html'
				where Code = 'CEOProjectRejected'
				   
    END
END
