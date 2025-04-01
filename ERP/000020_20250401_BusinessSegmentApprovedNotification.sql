BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'BusinessSegmentApproved')
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
                ('BusinessSegmentApproved', -- Code
                'Business Segment Approved', -- Name
                'ProjectNotifications.html', -- TemplateFile
                'SELECT ''Business Segment Approved Notification'' AS Subject, 
				CONCAT(
					''Business Segment "'', w.WorkSpaceName, 
					''" from '', ev.Title, '' '', ev.NameWithInitial, 
					'' ('', ev.EPFNo, '') is approved.''
				) AS BodyData
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', -- DataQuery
		 'select ''notifications.ceslerp@gmail.com'' as [Email]', -- FromQuery
				'SELECT rv.NameWithInitial,  rv.email AS Email
				FROM EmployeeRoleView rv
				WHERE (rv.RoleCode = ''COE'') and rv.workspaceId = (select coeWorkSpaceId 
				from pm_BusinessSegment p
				where workspaceId = @workspaceId) 
				union all
				SELECT rv.NameWithInitial,  rv.email AS Email
				FROM EmployeeRoleView rv
				WHERE rv.RoleCode = ''SOE'' and rv.SOEUnitId = (select soeWorkSpaceId 
				from pm_BusinessSegment p
				where workspaceId = @workspaceId)', -- ToQuery

				'SELECT rv.NameWithInitial,  rv.email AS Email
				FROM EmployeeRoleView rv
				WHERE (rv.RoleCode = ''ERP CFO'' OR rv.RoleCode = ''CIA'') ', -- CcQuery
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
        PRINT 'Error: Record with Code ''BusinessSegmentApproved'' already exists in cmn_EmailNotificationConfig.';
    END
END