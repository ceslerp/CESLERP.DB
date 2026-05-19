
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
            ELSE 'New Request Submitted'
        END AS Subject,

    CONCAT(
        'Dear Sir/Madam,',
        '<br/><br/>',

        'A new request has been submitted with the following details:',
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
            ELSE 'Submitted'
        END,
        '<br/><br/>',

        '<b>Action Required:</b>',
        '<br/>',
        CASE r.Status
            WHEN 1  THEN 'A new request has been submitted and is awaiting your approval. Kindly review and take the necessary action.'
            WHEN 2  THEN 'This request is currently under review. Please monitor for further updates.'
            WHEN 3  THEN 'This request has been fully approved. The Request Group can now begin processing.'
            WHEN 4  THEN 'The Request Group is currently processing this request. Please monitor for further updates.'
            WHEN 5  THEN 'This request has been successfully completed.'
            WHEN 6  THEN 'This request has been returned for correction. The requester has been notified to review and resubmit.'
            WHEN 7  THEN 'This request has been closed by the final group.'
            WHEN 8  THEN 'The requester has closed this request.'
            WHEN 9  THEN 'This request has been rejected.'
            WHEN 10 THEN 'This request has been resubmitted and is awaiting review.'
            WHEN 11 THEN 'This request has been reopened and is pending re-approval.'
            ELSE 'Please review this request and take the necessary action.'
        END
    ) AS BodyData,

    r.RequestId,
    r.RequestNo,
    r.RequestTitle,
    r.RequestedDate,
    r.Status,
    r.Priority,
    r.RequesterId,
    ev.NameWithInitial AS RequesterName,
    ev.EPFNo,
    rg.RequestGroupName,
    rt.Description     AS RequestTypeName

FROM rq_Request r
INNER JOIN cmn_EmployeeVersion ev
    ON ev.EmployeeId = r.RequesterId
    AND ev.DataStatus = 5
LEFT JOIN rq_Request_Group rg
    ON rg.RequestGroupId = r.RequestGroupId
LEFT JOIN rq_RequestType rt
    ON rt.RequestTypeId = r.RequestTypeId
WHERE r.RequestId = @RequestId;
