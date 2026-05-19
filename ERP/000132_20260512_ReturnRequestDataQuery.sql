
SELECT 
    'Request Notification - ' +
        CASE r.Status
            WHEN 1  THEN 'Pending Approval'
            WHEN 2  THEN 'Under Review'
            WHEN 3  THEN 'Fully Approved'
            WHEN 4  THEN 'In Progress'
            WHEN 5  THEN 'Completed'
            WHEN 6  THEN 'Returned for Correction'
            WHEN 7  THEN 'Closed by Final Group'
            WHEN 8  THEN 'Closed by Requester'
            WHEN 9  THEN 'Rejected'
            WHEN 10 THEN 'Resubmitted'
            WHEN 11 THEN 'Reopened'
            ELSE 'Status Update'
        END AS Subject,

    CONCAT(
        'Dear Sir/Madam,',
        '<br/><br/>',

        'A request update has been received with the following details:',
        '<br/><br/>',

        '<b>Request Number</b> : ', r.RequestNo,                            '<br/>',
        '<b>Request Title</b>  : ', r.RequestTitle,                         '<br/>',
        '<b>Request Type</b>   : ', ISNULL(rt.Description, 'N/A'),          '<br/>',
        '<b>Request Group</b>  : ', ISNULL(rg.RequestGroupName, 'N/A'),     '<br/>',
        '<b>Requested Date</b> : ', CONVERT(VARCHAR, r.RequestedDate, 103), '<br/>',
        '<b>Requested By</b>   : ', ev.NameWithInitial, ' (', ev.EPFNo, ')',
        '<br/><br/>',

        '<b>Current Status</b> : ',
        CASE r.Status
            WHEN 1  THEN 'Pending Approval'
            WHEN 2  THEN 'Under Review'
            WHEN 3  THEN 'Fully Approved'
            WHEN 4  THEN 'In Progress'
            WHEN 5  THEN 'Completed'
            WHEN 6  THEN 'Returned for Correction'
            WHEN 7  THEN 'Closed by Final Group'
            WHEN 8  THEN 'Closed by Requester'
            WHEN 9  THEN 'Rejected'
            WHEN 10 THEN 'Resubmitted'
            WHEN 11 THEN 'Reopened'
            ELSE 'Status Update'
        END,
        '<br/><br/>',

        '<b>Action Required / Status Update:</b>',
        '<br/>',
        CASE r.Status
            WHEN 1  THEN 'Your request has been submitted and is pending approval.'
            WHEN 2  THEN 'Your request is currently under review by the assigned group.'
            WHEN 3  THEN 'Your request has been fully approved and forwarded to the Request Group.'
            WHEN 4  THEN 'Your request is currently in progress by the Request Group.'
            WHEN 5  THEN 'Your request has been successfully completed by the Request Group.'
            WHEN 6  THEN 'Your request has been returned for correction. Please review the comments and resubmit.'
            WHEN 7  THEN 'Your request has been closed by the final group.'
            WHEN 8  THEN 'You have closed this request.'
            WHEN 9  THEN 'Your request has been rejected. Please contact the Request Group for further information.'
            WHEN 10 THEN 'Your request has been resubmitted and is awaiting review by the Request Group.'
            WHEN 11 THEN 'Your request has been reopened and is pending re-approval.'
            ELSE 'Your request status has been updated.'
        END
    ) AS BodyData,

    r.RequestId,
    r.RequestNo,
    r.RequestTitle,
    r.RequestedDate,
    r.Status,
    r.Priority,
    r.RequesterId,
    ev.NameWithInitial  AS RequesterName,
    ev.EPFNo,
    rg.RequestGroupName,
    rt.Description      AS RequestTypeName

FROM rq_RequestData rd
INNER JOIN rq_Request r
    ON r.RequestId = rd.RequestId
INNER JOIN cmn_EmployeeVersion ev
    ON ev.EmployeeId = r.RequesterId
    AND ev.DataStatus = 5
LEFT JOIN rq_Request_Group rg
    ON rg.RequestGroupId = r.RequestGroupId
LEFT JOIN rq_RequestType rt
    ON rt.RequestTypeId = r.RequestTypeId
WHERE rd.RequestDataId = @RequestDataId
  AND r.Status IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
