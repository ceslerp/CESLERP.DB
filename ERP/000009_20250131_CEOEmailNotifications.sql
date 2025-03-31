IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'cmn_EmailNotificationConfig')
BEGIN
    CREATE TABLE cmn_EmailNotificationConfig (
        Code VARCHAR(255) NOT NULL, -- Unique Code (Not Null to ensure it is provided)
        Name NVARCHAR(512) NOT NULL, -- Notification Name (Not Null)
        TemplateFile NVARCHAR(MAX) NULL, -- HTML Template File (Nullable, as it may not always be available)
        DataQuery NVARCHAR(MAX) NULL, -- Data query (Nullable)
        FromQuery NVARCHAR(MAX) NULL, -- From query (Nullable)
        ToQuery NVARCHAR(MAX) NULL, -- To query (Nullable)
        CcQuery NVARCHAR(MAX) NULL, -- Cc query (Nullable)
        BccQuery NVARCHAR(MAX) NULL, -- Bcc query (Nullable)
        TupleParameters NVARCHAR(MAX) NULL, -- Comma-separated list of parameters (Nullable)
        Active BIT NOT NULL DEFAULT 1, -- 1 = Active, 0 = Inactive (Defaults to Active)
        CreatedDate DATETIME NOT NULL DEFAULT GETDATE(), -- Automatically set the creation date
        UpdatedDate DATETIME NOT NULL DEFAULT GETDATE(), -- Automatically set the updated date
        CONSTRAINT PK_EmailNotificationConfig_Code PRIMARY KEY (Code), -- Unique constraint on Code
    );
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'cmn_EmailNotification')
BEGIN
    CREATE TABLE cmn_EmailNotification (
        Id UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(), -- Unique GUID for each notification
        NotificationConfigId VARCHAR(255) NOT NULL, -- Foreign Key to EmailNotificationConfig table
        FromEmail NVARCHAR(MAX) NOT NULL, 
        ToEmails NVARCHAR(MAX) NOT NULL, -- Comma-separated list of email addresses (Nullable)
        CcEmails NVARCHAR(MAX) NULL, -- Comma-separated list of email addresses (Nullable)
        BccEmails NVARCHAR(MAX) NULL, -- Comma-separated list of email addresses (Nullable)
        Subject NVARCHAR(1000) NOT NULL, -- HTML email message (Nullable)
        Message NVARCHAR(MAX) NOT NULL, -- HTML email message (Nullable)
        LastSentTime DATETIME NULL, -- Date and time when the notification was last sent (Nullable)
        Status NVARCHAR(50) NOT NULL, -- Status of the email notification 
        Active BIT NOT NULL DEFAULT 1, -- 1 = Active, 0 = Inactive (Defaults to Active)
        Parameters NVARCHAR(MAX) NULL, -- Json parameter-value pairs (Nullable)
        
        -- Foreign key constraint
        CONSTRAINT FK_EmailNotification_NotificationConfig FOREIGN KEY (NotificationConfigId) REFERENCES cmn_EmailNotificationConfig(Code),
        
        -- Primary Key
        CONSTRAINT PK_EmailNotification_Id PRIMARY KEY (Id),
    );

    -- Optional: Index on NotificationConfigId to optimize querying
    CREATE INDEX IX_EmailNotification_NotificationConfigId ON cmn_EmailNotification (NotificationConfigId);
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'EmployeeRoleView')
BEGIN
    EXEC('
    CREATE VIEW EmployeeRoleView AS
    SELECT 
        r.RoleId, 
        r.RoleCode, 
        ur.UserId, 
        u.UserName, 
        ev.NameWithInitial, 
        ev.email AS Email, 
        ev.PrivateEmail, 
        ev.EmployeeId
    FROM FRM.dbo.TSys_UserRole ur
    LEFT JOIN FRM.dbo.TSys_Role r ON r.RoleId = ur.RoleId
    LEFT JOIN FRM.dbo.Users u ON u.UserId = ur.UserId
    INNER JOIN cmn_EmployeeVersion ev ON ev.EPFNo = u.UserName AND ev.DataStatus = 5
    WHERE ur.IsActive = 1
    ');
END

BEGIN
    -- Check if the Code already exists to prevent duplicate entries
    IF NOT EXISTS (SELECT 1 FROM cmn_EmailNotificationConfig WHERE Code = 'CEOProjectApproval')
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
                ('CEOProjectApproval', -- Code
                'CEO Project Approval', -- Name
                'CEOProjectApproval.html', -- TemplateFile
                'select ''Project Approval Notification'' as Subject, w.WorkSpaceName as WorkSpaceName, ev.Title as Title, ev.NameWithInitial as EmployeeName, ev.EPFNo as EPFNo
                from cmn_WorkSpace w 
                left join cmn_EmployeeVersion ev on ev.EmployeeId = @userEmployeeId
                where w.WorkSpaceId = @workspaceId', -- DataQuery
                'select ''notifications.ceslerp@gmail.com'' as [Email]', -- FromQuery
                'select NameWithInitial as Name, Email from EmployeeRoleView
                where RoleCode=''CEO''', -- ToQuery
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
        PRINT 'Error: Record with Code ''CEOProjectApproval'' already exists in cmn_EmailNotificationConfig.';
    END
END

IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'cmn_EmailNotification' 
    AND COLUMN_NAME = 'Error'
)
BEGIN
    ALTER TABLE [cmn_EmailNotification] 
    ADD Error NVARCHAR(MAX) NULL;
END
