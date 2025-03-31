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
    -- Check if the Code already exists to prevent duplicate entries
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'CESLTestMail')
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
            ('CESLTestMail', -- Code
            'CESL Test Mail', -- Name
            'CESLTestMail.html', -- TemplateFile
            'select ''CESL Test Mail'' as Subject', -- DataQuery
            'select ''notifications.ceslerp@gmail.com'' as [Email]', -- FromQuery
            'SELECT ''Harshan'' AS Name, ''hn44447@gmail.com'' AS Email
			UNION ALL
			SELECT ''Chinthaka'', ''chinthakagvt@gmail.com''', -- ToQuery
            null, -- CcQuery
            null, -- BccQuery
            '', -- Comma separated parameters list
            1, -- Active
            GETDATE(), -- CreatedDate
            GETDATE()); -- UpdatedDate

        PRINT 'Insert successful into cmn_EmailNotificationConfig.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Record with Code ''CESLTestMail'' already exists in cmn_EmailNotificationConfig.';
    END
END

BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'COEProjectApproval')
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
                ('COEProjectApproval', -- Code
                'COE Project Approval', -- Name
                'ProjectApproval.html', -- TemplateFile
                '''Project Approval Notification'' AS Subject, 
				CONCAT(
					''Project code request "'', w.WorkSpaceName, 
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
				from cmn_project p
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
        PRINT 'Error: Record with Code ''COEProjectApproval'' already exists in cmn_EmailNotificationConfig.';
    END
END
