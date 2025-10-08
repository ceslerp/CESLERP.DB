USE [ERP];
GO


INSERT INTO [dbo].[cmn_EmailNotificationConfig] (
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
VALUES (
    'TransitionRejected',
    N'Transition Rejected',
    N'ProjectNotifications.html',
    N'SELECT 
    ''Employee Transition Rejected'' AS Subject,
    CONCAT(
        ''Your employee transition request has been rejected.'',
        CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10),
        '' Employee: '', emp.NameWithInitial, '' ('', emp.EPFNo, '')'',
        CHAR(13) + CHAR(10),
        '' Transition Type: '', tt.Name,
        CHAR(13) + CHAR(10),
        '' Requested Effective Date: '', CONVERT(VARCHAR, et.EffectiveDate, 106),
        CHAR(13) + CHAR(10),
        '' Rejected By: '', appr.NameWithInitial, '' ('', appr.EPFNo, '')'',
        CHAR(13) + CHAR(10),
        '' Rejection Date: '', CONVERT(VARCHAR, GETDATE(), 106),
        CASE WHEN et.Comment IS NOT NULL AND et.Comment != '''' THEN 
            CHAR(13) + CHAR(10) + ''• Original Comments: '' + et.Comment 
        ELSE '''' END,
        CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10),
        ''Please contact HR for more information or to resubmit your request.''
    ) AS BodyData,
    et.EmployeeTransitionId,
    et.EmployeeId,
    emp.NameWithInitial AS EmployeeName,
    emp.EPFNo AS EmployeeEPFNo,
    emp.Email AS EmployeeEmail,
    tt.Name AS TransitionType,
    et.EffectiveDate,
    et.Comment,
    appr.NameWithInitial AS RejectedByName,
    appr.EPFNo AS RejectedByEPFNo,
    appr.Email AS RejectedByEmail,
    GETDATE() AS RejectionDate
FROM hrm_EmployeeTransition et
INNER JOIN cmn_EmployeeVersion emp ON emp.EmployeeId = et.EmployeeId 
    AND emp.DataStatus = 5
INNER JOIN cmn_EmployeeVersion appr ON appr.EmployeeId = @userEmployeeId 
    AND appr.DataStatus = 5
INNER JOIN hrm_EmployeeTransitionType tt ON tt.EmployeeTransitionTypeId = et.TransitionTypeId
WHERE et.EmployeeTransitionId = @EmployeeTransitionId;',
    N'SELECT ''notifications.ceslerp@gmail.com'' AS [Email];',
    N'SELECT ''Creator'' AS Type,
       ev.NameWithInitial,
       ev.PrivateEmail AS Email,
       ev.EPFNo
FROM cmn_EmployeeVersion ev
WHERE ev.EmployeeId = @userEmployeeId
  AND ev.DataStatus = 5

UNION ALL

SELECT ''Affected Employee'' AS Type,
       ev.NameWithInitial,
       ev.PrivateEmail AS Email,
       ev.EPFNo
FROM cmn_EmployeeVersion ev
WHERE ev.EmployeeId = (
    SELECT et.EmployeeId
    FROM hrm_EmployeeTransition et
    WHERE et.EmployeeTransitionId = @EmployeeTransitionId
)
  AND ev.DataStatus = 5;',
    NULL,
    NULL,
    N'<EmployeeTransitionId,guid><userEmployeeId,guid>',
    1,
    GETDATE(),
    GETDATE()
);
GO
