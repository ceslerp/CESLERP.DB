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
    'ContractRenewalApproval',
    N'Contract Renewal Approval',
    N'ProjectNotifications.html',

    -- Data Query
    N'SELECT 
        ''Contract Renewal'' AS Subject,
        CONCAT(
            ''Contract renewal for '', emp.NameWithInitial,
            '' ('', emp.EPFNo, '')'',
            '' - Designation: '', ISNULL(desig.DesignationName, ''N/A''),
            '', Recruitment Period: '',
            CONVERT(VARCHAR, cr.recruitmentStartDate, 103),
            '' to '', CONVERT(VARCHAR, cr.recruitmentEndDate, 103),
            ''. Agreement Date: '', CONVERT(VARCHAR, cr.AgrementDate, 103),
            '' has been processed by '', appr.NameWithInitial,
            '' ('', appr.EPFNo, '').''
        ) AS BodyData,

        cr.ContractRenewId,
        cr.EmployeeId,
        emp.NameWithInitial AS EmployeeName,
        emp.EPFNo AS EmployeeEPFNo,
        ISNULL(desig.DesignationName, ''N/A'') AS Designation,
        cr.recruitmentStartDate,
        cr.recruitmentEndDate,
        cr.AgrementDate,
        appr.NameWithInitial AS ProcessedByName,
        appr.EPFNo AS ProcessedByEPFNo

    FROM hrm_ContractRenew cr
    LEFT JOIN cmn_EmployeeVersion emp 
        ON emp.EmployeeId = cr.EmployeeId 
        AND emp.DataStatus = 5
    LEFT JOIN cmn_EmployeeVersion appr 
        ON appr.EmployeeId = @userEmployeeId 
        AND appr.DataStatus = 5
    LEFT JOIN hrm_Designation desig 
        ON desig.DesignationId = cr.Designation
    WHERE cr.ContractRenewId = @ContractRenewId;',

    -- From Query
    N'SELECT ''notifications.ceslerp@gmail.com'' AS [Email];',

    -- To Query
    N'SELECT DISTINCT 
        rv.NameWithInitial, 
        rv.Email
    FROM EmployeeRoleView rv
    WHERE rv.RoleCode = ''Approve Contract Renewal''
      AND rv.Email IS NOT NULL
      AND rv.EmployeeId IN (
          SELECT ws.HeadOfWorkSpace
          FROM cmn_EmployeeVersion ev
          INNER JOIN cmn_WorkSpace ws 
              ON ws.WorkSpaceId = ev.WorkSpaceId
          WHERE ev.EmployeeId = @userEmployeeId
            AND ev.DataStatus = 5
            AND ws.HeadOfWorkSpace IS NOT NULL
            AND ws.HeadOfWorkSpace != ev.EmployeeId
      );',

    NULL,  -- CcQuery
    NULL,  -- BccQuery
    N'<ContractRenewId,guid><userEmployeeId,guid>',  -- Tuple Parameters
    1,  -- Active
    GETDATE(),  -- CreatedDate
    GETDATE()   -- UpdatedDate
);
GO

