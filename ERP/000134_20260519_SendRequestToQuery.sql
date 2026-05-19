SELECT DISTINCT Email
FROM
(
    -- STEP 1: ALWAYS NOTIFY REQUESTER
    SELECT reqEmp.PrivateEmail AS Email
    FROM rq_Request r
    INNER JOIN cmn_EmployeeVersion reqEmp
        ON reqEmp.EmployeeId = r.RequesterId
        AND reqEmp.DataStatus = 5
    WHERE r.RequestId = @RequestId
      AND reqEmp.PrivateEmail IS NOT NULL

    UNION ALL

    -- STEP 2A: WORKFLOW EXISTS → notify current workflow step group
    SELECT rg.GroupEmail AS Email
    FROM rq_Request r
    INNER JOIN rq_RequestType rt ON rt.RequestTypeId = r.RequestTypeId
    INNER JOIN rq_Request_Workflow rw ON rw.RequestId = r.RequestId
    INNER JOIN rq_Request_Workflow_Step rws
        ON rws.RequestId = r.RequestId
        AND rws.SequenceOrder = rw.CurrentStep
    INNER JOIN rq_Request_Group rg ON rg.RequestGroupId = rws.AssignedGroupId
    WHERE r.RequestId = @RequestId
      AND rt.HasWorkflow = 1
      AND rw.Completed = 0
      AND rg.GroupEmail IS NOT NULL

    UNION ALL

    -- STEP 2B: NO WORKFLOW → notify target request group directly
    SELECT rg.GroupEmail AS Email
    FROM rq_Request r
    INNER JOIN rq_RequestType rt ON rt.RequestTypeId = r.RequestTypeId
    INNER JOIN rq_Request_Group rg ON rg.RequestGroupId = r.RequestGroupId
    WHERE r.RequestId = @RequestId
      AND rt.HasWorkflow = 0
      AND rg.GroupEmail IS NOT NULL
      AND r.RequestGroupId IS NOT NULL

) AS FinalRecipients
WHERE Email IS NOT NULL;
