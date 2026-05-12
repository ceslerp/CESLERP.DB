SELECT DISTINCT Email
FROM
(
    -- STEP 1: ALWAYS NOTIFY REQUESTER
    SELECT reqEmp.PrivateEmail AS Email
    FROM rq_RequestData rd
    INNER JOIN rq_Request r ON r.RequestId = rd.RequestId
    INNER JOIN cmn_EmployeeVersion reqEmp
        ON reqEmp.EmployeeId = r.RequesterId
        AND reqEmp.DataStatus = 5
    WHERE rd.RequestDataId = @RequestDataId
      AND reqEmp.PrivateEmail IS NOT NULL

    UNION ALL

    -- STEP 2A: WORKFLOW ACTIVE → notify the CURRENT WORKFLOW STEP GROUP
    SELECT rg.GroupEmail AS Email
    FROM rq_RequestData rd
    INNER JOIN rq_Request r ON r.RequestId = rd.RequestId
    INNER JOIN rq_Request_Workflow rw ON rw.RequestId = r.RequestId
    INNER JOIN rq_Request_Workflow_Step rws
        ON rws.RequestId = r.RequestId
        AND rws.SequenceOrder = rw.CurrentStep
    INNER JOIN rq_Request_Group rg ON rg.RequestGroupId = rws.AssignedGroupId
    WHERE rd.RequestDataId =  @RequestDataId
      AND rw.Completed = 0           -- workflow still active
      AND rg.GroupEmail IS NOT NULL

    UNION ALL

    -- STEP 2B: NO WORKFLOW or WORKFLOW COMPLETED → notify TARGET REQUEST GROUP
    SELECT rg.GroupEmail AS Email
    FROM rq_RequestData rd
    INNER JOIN rq_Request r ON r.RequestId = rd.RequestId
    INNER JOIN rq_Request_Group rg ON rg.RequestGroupId = r.RequestGroupId
    WHERE rd.RequestDataId =  @RequestDataId
      AND rg.GroupEmail IS NOT NULL
      AND r.RequestGroupId IS NOT NULL
      AND NOT EXISTS (
          -- skip if an active workflow already handled the group above
          SELECT 1
          FROM rq_Request_Workflow rw
          WHERE rw.RequestId = r.RequestId
            AND rw.Completed = 0
      )

) AS FinalRecipients
WHERE Email IS NOT NULL;
