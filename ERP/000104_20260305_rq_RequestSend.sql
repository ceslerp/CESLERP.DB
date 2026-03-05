USE [ERP]
GO

INSERT INTO [dbo].[cmn_EmailNotificationConfig]
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
    'SendRequest',
    'Send Request',
    'ProjectNotifications.html',

    -- =========================
    -- DATA QUERY
    -- =========================
    'SELECT 
        ''Request Notification - '' +
        CASE r.Status
            WHEN 1 THEN ''Pending Department Head Approval''
            WHEN 2 THEN ''Approved by Department Head''
            WHEN 3 THEN ''Closed by Department Head''
            WHEN 4 THEN ''In Progress by Request Group''
            WHEN 5 THEN ''Completed by Request Group''
            WHEN 6 THEN ''Returned for Correction''
            WHEN 7 THEN ''Closed by Request Group''
            WHEN 8 THEN ''Closed by Requester''
            WHEN 9 THEN ''Closed by Requester''
            WHEN 10 THEN ''Closed by Requester''
            WHEN 11 THEN ''Resubmitted for Review''
            ELSE ''Update''
        END AS Subject,

        CONCAT(
            ''Dear Sir/Madam,'', CHAR(13)+CHAR(10)+CHAR(13)+CHAR(10),
            ''A request has been submitted with the following details:'', CHAR(13)+CHAR(10)+CHAR(13)+CHAR(10),
            ''Request Number: '', r.RequestNo, CHAR(13)+CHAR(10),
            ''Request Title: '', r.RequestTitle, CHAR(13)+CHAR(10),
            ''Request Type: '', ISNULL(rt.Description, ''N/A''), CHAR(13)+CHAR(10),
            ''Request Group: '', ISNULL(rg.RequestGroupName, ''N/A''), CHAR(13)+CHAR(10),
            ''Requested Date: '', CONVERT(VARCHAR, r.RequestedDate, 103), CHAR(13)+CHAR(10),
            ''Requested By: '', ev.NameWithInitial, '' ('', ev.EPFNo, '')'', 
            CHAR(13)+CHAR(10)+CHAR(13)+CHAR(10),
            ''Current Status Updated Successfully.'', CHAR(13)+CHAR(10),
            ''This is a system generated notification.'', CHAR(13)+CHAR(10),
            ''Thank you.''
        ) AS BodyData

    FROM rq_Request r
    INNER JOIN cmn_EmployeeVersion ev 
        ON ev.EmployeeId = r.RequesterId 
        AND ev.DataStatus = 5
    LEFT JOIN rq_Request_Group rg 
        ON rg.RequestGroupId = r.RequestGroupId
    LEFT JOIN rq_RequestType rt 
        ON rt.RequestTypeId = r.RequestTypeId

    WHERE r.RequestId = @RequestId
      AND r.RequesterId = @userEmployeeId',

    -- =========================
    -- FROM QUERY
    -- =========================
    'SELECT ''notifications.ceslerp@gmail.com'' AS [Email]',

    -- =========================
    -- TO QUERY (FULL ORIGINAL LOGIC)
    -- =========================
    'SELECT DISTINCT rv.NameWithInitial, rv.Email
     FROM EmployeeRoleView rv
     WHERE rv.EmployeeId IN (
         
         SELECT ws.HeadOfWorkSpace
         FROM cmn_EmployeeVersion ev
         INNER JOIN cmn_WorkSpace ws 
             ON ws.WorkSpaceId = ev.SOEUnitId
         WHERE ev.EmployeeId = @userEmployeeId
           AND ev.DataStatus = 5
           AND ev.SOEUnitId IS NOT NULL
           AND ev.SOEUnitId != ''00000000-0000-0000-0000-000000000000''
           AND ws.HeadOfWorkSpace IS NOT NULL
           AND ws.HeadOfWorkSpace != ev.EmployeeId

         UNION

         SELECT ws.HeadOfWorkSpace
         FROM cmn_EmployeeVersion ev
         INNER JOIN cmn_WorkSpace ws 
             ON ws.WorkSpaceId = ev.WorkSpaceId
         WHERE ev.EmployeeId = @userEmployeeId
           AND ev.DataStatus = 5
           AND (ev.SOEUnitId IS NULL 
                OR ev.SOEUnitId = ''00000000-0000-0000-0000-000000000000'')
           AND ws.HeadOfWorkSpace IS NOT NULL
           AND ws.HeadOfWorkSpace != ev.EmployeeId

         UNION

         SELECT ceo.EmployeeId
         FROM cmn_EmployeeVersion ev
         INNER JOIN cmn_WorkSpace ws 
             ON ws.WorkSpaceId = ev.WorkSpaceId
         CROSS JOIN EmployeeRoleView ceo
         WHERE ev.EmployeeId = @userEmployeeId
           AND ev.DataStatus = 5
           AND ws.HeadOfWorkSpace = ev.EmployeeId
           AND ceo.RoleCode = ''CEO''
     )
     AND rv.Email IS NOT NULL',

    NULL,
    NULL,

    '<RequestId,guid><userEmployeeId,guid>',

    1,
    GETDATE(),
    GETDATE()
)
GO
