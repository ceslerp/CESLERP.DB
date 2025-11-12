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
    'ContractRenewalRejected',
    N'Contract Renewal Rejected',
    N'ProjectNotifications.html',

    -- Data Query
    N'SELECT 
        ''Contract Renewal Rejected'' AS Subject,
        CONCAT(
            ''The contract renewal for '', emp.NameWithInitial,
            '' ('', emp.EPFNo, '') has been rejected.'',
            CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10),
            '' Employee: '', emp.NameWithInitial, '' ('', emp.EPFNo, '')'',
            CHAR(13) + CHAR(10),
            '' Designation: '', ISNULL(desig.DesignationName, ''N/A''),
            CHAR(13) + CHAR(10),
            '' Recruitment Period: '', 
                CONVERT(VARCHAR, cr.recruitmentStartDate, 106), 
                '' to '', CONVERT(VARCHAR, cr.recruitmentEndDate, 106),
            CHAR(13) + CHAR(10),
            '' Agreement Date: '', CONVERT(VARCHAR, cr.AgrementDate, 106),
            CHAR(13) + CHAR(10),
            '' Rejected By: '', appr.NameWithInitial, '' ('', appr.EPFNo, '')'',
            CHAR(13) + CHAR(10),
            '' Rejection Date: '', CONVERT(VARCHAR, GETDATE(), 106),
            CHAR(13) + CHAR(10) + CHAR(13) + CHAR(10),
            ''This contract renewal has been rejected in the system.''
        ) AS BodyData,

        cr.ContractRenewId,
        cr.EmployeeId,
        emp.NameWithInitial AS EmployeeName,
        emp.EPFNo AS EmployeeEPFNo,
        emp.Email AS EmployeeEmail,
        ISNULL(desig.DesignationName, ''N/A'') AS Designation,
        cr.recruitmentStartDate,
        cr.recruitmentEndDate,
        cr.AgrementDate,
        appr.NameWithInitial AS RejectedByName,
        appr.EPFNo AS RejectedByEPFNo,
        appr.Email AS RejectedByEmail,
        GETDATE() AS RejectionDate

    FROM hrm_ContractRenew cr
    INNER JOIN cmn_EmployeeVersion emp 
        ON emp.EmployeeId = cr.EmployeeId 
        AND emp.DataStatus = 5
    INNER JOIN cmn_EmployeeVersion appr 
        ON appr.EmployeeId = @userEmployeeId 
        AND appr.DataStatus = 5
    LEFT JOIN hrm_Designation desig 
        ON desig.DesignationId = cr.Designation
    WHERE cr.ContractRenewId = @ContractRenewId;',

    -- From Query
    N'SELECT ''notifications.ceslerp@gmail.com'' AS [Email];',

    -- To Query (Creator and Affected Employee)
    N'SELECT 
        ''Creator'' AS Type,
        ev.NameWithInitial,
        ev.PrivateEmail AS Email,
        ev.EPFNo
    FROM cmn_EmployeeVersion ev
    WHERE ev.EmployeeId = @userEmployeeId
      AND ev.DataStatus = 5

    UNION ALL

    SELECT 
        ''Affected Employee'' AS Type,
        ev.NameWithInitial,
        ev.PrivateEmail AS Email,
        ev.EPFNo
    FROM cmn_EmployeeVersion ev
    WHERE ev.EmployeeId = (
        SELECT cr.EmployeeId
        FROM hrm_ContractRenew cr
        WHERE cr.ContractRenewId = @ContractRenewId
    )
      AND ev.DataStatus = 5;',

    NULL,  -- CcQuery
    NULL,  -- BccQuery
    N'<ContractRenewId,guid><userEmployeeId,guid>',  -- Tuple Parameters
    1,  -- Active
    GETDATE(),  -- CreatedDate
    GETDATE()   -- UpdatedDate
);
GO
