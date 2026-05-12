
SELECT DISTINCT Email
FROM
(
    -- STEP 1: ALWAYS NOTIFY EMPLOYEE HEAD (full org logic)
    SELECT rv.Email AS Email
    FROM EmployeeRoleView rv
    WHERE rv.EmployeeId IN
    (
        -- SOE Unit Head
        SELECT ws.HeadOfWorkSpace
        FROM cmn_EmployeeVersion ev
        INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.SOEUnitId
        WHERE ev.EmployeeId = @userEmployeeId
          AND ev.DataStatus = 5
          AND ev.SOEUnitId IS NOT NULL
          AND ev.SOEUnitId != '00000000-0000-0000-0000-000000000000'
          AND ws.HeadOfWorkSpace IS NOT NULL
          AND ws.HeadOfWorkSpace != ev.EmployeeId
          AND NOT EXISTS (
              SELECT 1 FROM cmn_WorkSpace coe_ws
              WHERE coe_ws.WorkSpaceId = ev.WorkSpaceId
                AND coe_ws.HeadOfWorkSpace = ev.EmployeeId
          )

        UNION

        -- Direct Workspace Head
        SELECT ws.HeadOfWorkSpace
        FROM cmn_EmployeeVersion ev
        INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.WorkSpaceId
        WHERE ev.EmployeeId = @userEmployeeId
          AND ev.DataStatus = 5
          AND (ev.SOEUnitId IS NULL OR ev.SOEUnitId = '00000000-0000-0000-0000-000000000000')
          AND ws.HeadOfWorkSpace IS NOT NULL
          AND ws.HeadOfWorkSpace != ev.EmployeeId

        UNION

        -- Main Workspace Head (SOE exists but has no head)
        SELECT ws_main.HeadOfWorkSpace
        FROM cmn_EmployeeVersion ev
        INNER JOIN cmn_WorkSpace ws_soe ON ws_soe.WorkSpaceId = ev.SOEUnitId
        INNER JOIN cmn_WorkSpace ws_main ON ws_main.WorkSpaceId = ev.WorkSpaceId
        WHERE ev.EmployeeId = @userEmployeeId
          AND ev.DataStatus = 5
          AND ev.SOEUnitId IS NOT NULL
          AND ev.SOEUnitId != '00000000-0000-0000-0000-000000000000'
          AND ws_soe.HeadOfWorkSpace IS NULL
          AND ws_main.HeadOfWorkSpace IS NOT NULL
          AND ws_main.HeadOfWorkSpace != ev.EmployeeId

        UNION

        -- Secondary Workspace Head (SOE head is the employee themselves)
        SELECT ws_main.HeadOfWorkSpace
        FROM cmn_EmployeeVersion ev
        INNER JOIN cmn_WorkSpace ws_soe ON ws_soe.WorkSpaceId = ev.SOEUnitId
        INNER JOIN cmn_WorkSpace ws_main ON ws_main.WorkSpaceId = ev.WorkSpaceId
        WHERE ev.EmployeeId = @userEmployeeId
          AND ev.DataStatus = 5
          AND ev.SOEUnitId IS NOT NULL
          AND ev.SOEUnitId != '00000000-0000-0000-0000-000000000000'
          AND ws_soe.HeadOfWorkSpace = ev.EmployeeId
          AND ws_main.HeadOfWorkSpace IS NOT NULL
          AND ws_main.HeadOfWorkSpace != ev.EmployeeId

        UNION

        -- CEO (when employee is the workspace head themselves)
        SELECT ceo.EmployeeId
        FROM cmn_EmployeeVersion ev
        INNER JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = ev.WorkSpaceId
        CROSS JOIN EmployeeRoleView ceo
        WHERE ev.EmployeeId = @userEmployeeId
          AND ev.DataStatus = 5
          AND ws.HeadOfWorkSpace = ev.EmployeeId
          AND ceo.RoleCode = 'CEO'
    )
    AND rv.Email IS NOT NULL

    UNION ALL

    -- STEP 2: ALWAYS NOTIFY REQUESTER
    SELECT reqEmp.PrivateEmail AS Email
    FROM rq_Request r
    INNER JOIN cmn_EmployeeVersion reqEmp
        ON reqEmp.EmployeeId = r.RequesterId
        AND reqEmp.DataStatus = 5
    WHERE r.RequestId = @RequestId
      AND reqEmp.PrivateEmail IS NOT NULL

    UNION ALL

    -- STEP 3A: WORKFLOW EXISTS → notify current workflow step group
    SELECT rg.GroupEmail AS Email
    FROM rq_Request r
    INNER JOIN rq_RequestType rt ON rt.RequestTypeId = r.RequestTypeId
    INNER JOIN rq_Request_Workflow rw ON rw.RequestId = r.RequestId
    INNER JOIN rq_Request_Workflow_Step rws
        ON rws.RequestId = r.RequestId
        AND rws.SequenceOrder = rw.CurrentStep
    INNER JOIN rq_Request_Group rg ON rg.RequestGroupId = rws.AssignedGroupId
    WHERE r.RequestId =  @RequestId
      AND rt.HasWorkflow = 1
      AND rw.Completed = 0
      AND rg.GroupEmail IS NOT NULL

    UNION ALL

    -- STEP 3B: NO WORKFLOW → notify target request group directly
    SELECT rg.GroupEmail AS Email
    FROM rq_Request r
    INNER JOIN rq_RequestType rt ON rt.RequestTypeId = r.RequestTypeId
    INNER JOIN rq_Request_Group rg ON rg.RequestGroupId = r.RequestGroupId
    WHERE r.RequestId =  @RequestId
      AND rt.HasWorkflow = 0
      AND rg.GroupEmail IS NOT NULL
      AND r.RequestGroupId IS NOT NULL

) AS FinalRecipients
WHERE Email IS NOT NULL;
