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
    'TransitionApproval',
    N'Transition Approval',
    N'ProjectNotifications.html',
    N'SELECT ''Employee Transition'' AS Subject,
       CONCAT(
           ''Employee transition for '', emp.NameWithInitial,
           '' ('', emp.EPFNo, '') - Transition Type: '', tt.Name,
           '' on '', CONVERT(VARCHAR, et.EffectiveDate, 103),
           CASE WHEN et.Comment IS NOT NULL THEN ''. Comment: '' + et.Comment ELSE '''' END,
           '' has been processed by '', appr.NameWithInitial,
           '' ('', appr.EPFNo, '').''
       ) AS BodyData,
       et.EmployeeTransitionId,
       et.EmployeeId,
       emp.NameWithInitial AS EmployeeName,
       emp.EPFNo AS EmployeeEPFNo,
       tt.Name AS TransitionType,
       et.EffectiveDate,
       et.Comment,
       appr.NameWithInitial AS ProcessedByName,
       appr.EPFNo AS ProcessedByEPFNo
FROM hrm_EmployeeTransition et
LEFT JOIN cmn_EmployeeVersion emp ON emp.EmployeeId = et.EmployeeId 
    AND emp.DataStatus = 5
LEFT JOIN cmn_EmployeeVersion appr ON appr.EmployeeId = @userEmployeeId 
    AND appr.DataStatus = 5
LEFT JOIN hrm_EmployeeTransitionType tt ON tt.EmployeeTransitionTypeId = et.TransitionTypeId
WHERE et.EmployeeTransitionId = @EmployeeTransitionId;',
    N'SELECT ''notifications.ceslerp@gmail.com'' AS [Email];',
    N'DECLARE @EmployeeId UNIQUEIDENTIFIER;
DECLARE @TypeOfContract INT;

SELECT TOP 1 @EmployeeId = t.EmployeeId
FROM hrm_EmployeeTransition t
WHERE t.TransitionId = @TransitionId;

SELECT TOP 1 @TypeOfContract = ev.TypeOfContract
FROM cmn_EmployeeVersion ev
WHERE ev.EmployeeId = @EmployeeId
  AND ev.DataStatus = 5;

IF (@TypeOfContract = 4)
BEGIN
    SELECT DISTINCT rv.NameWithInitial, rv.Email
    FROM EmployeeRoleView rv
    WHERE rv.RoleCode = ''COE''
      AND rv.Email IS NOT NULL
      AND rv.EmployeeId IN (
          SELECT ws.HeadOfWorkSpace
          FROM cmn_EmployeeVersion ev
          INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.WorkSpaceId
          WHERE ev.EmployeeId = @userEmployeeId
            AND ev.DataStatus = 5
            AND ws.HeadOfWorkSpace IS NOT NULL
            AND ws.HeadOfWorkSpace != ev.EmployeeId
      );
END
ELSE
BEGIN
    SELECT 
        ev.NameWithInitial, 
        ev.PrivateEmail AS Email,
        ev.EPFNo,
        r.RoleName,
        r.RoleCode
    FROM ERP.dbo.cmn_EmployeeVersion ev
    INNER JOIN FRM.dbo.[User] u ON u.UserName = ev.EPFNo
    INNER JOIN FRM.dbo.TSys_UserRole ur ON ur.UserId = u.UserId AND ur.IsActive = 1
    INNER JOIN FRM.dbo.TSys_Role r ON r.RoleId = ur.RoleId
    WHERE r.RoleCode = ''HRM Manager''
      AND ev.DataStatus = 5
      AND u.IsActive = 1;
END;',
    NULL,
    NULL,
    N'<EmployeeTransitionId,guid><userEmployeeId,guid>',
    1,
    GETDATE(),
    GETDATE()
);
GO
