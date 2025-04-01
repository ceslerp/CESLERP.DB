BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'COEBusinessSegmentApproval')
    BEGIN
        -- Check if the required view and tables exist
        IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'EmployeeRoleView')
            AND EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'cmn_WorkSpace')
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
                ('COEBusinessSegmentApproval', -- Code
                'COE BusinessSegment Approval', -- Name
                'ProjectNotifications.html', -- TemplateFile
                'SELECT ''Business Segment Approval Notification - COE'' AS Subject, 
				CONCAT(
					''Business segment request "'', w.WorkSpaceName, 
					''" from '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '') is pending for your approval.''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', -- DataQuery
                'select ''notifications.ceslerp@gmail.com'' as [Email]', -- FromQuery
                'SELECT rv.NameWithInitial,  rv.email AS Email
				FROM EmployeeRoleView rv
				WHERE rv.RoleCode = ''COE'' and rv.workspaceId = (select coeWorkSpaceId 
				from pm_BusinessSegment p
				where workspaceId = @workspaceId)', -- ToQuery
                null, -- CcQuery
                null, -- BccQuery
                '<workspaceId,guid><userEmployeeId,guid>', -- Comma separated parameters list
                1, -- Active
                GETDATE(), -- CreatedDate
                GETDATE()); -- UpdatedDate

            PRINT 'Insert successful into cmn_EmailNotificationConfig.';
        END
        ELSE
        BEGIN
            PRINT 'Error: Required view (EmployeeRoleView) or table (cmn_WorkSpace) does not exist.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Error: Record with Code ''COEBusinessSegmentApproval'' already exists in cmn_EmailNotificationConfig.';
    END
END