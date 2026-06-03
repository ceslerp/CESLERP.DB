
UPDATE pcr
SET
    pcr.AuthorizedCEO   = 'e9a1092e-1eb1-414e-8539-ae13c476d94d',
    pcr.AuthorizedCOE   = ws.HeadOfWorkSpace,
    pcr.UpdatedDateTime = GETDATE()
FROM pm_ProjectCodeRequest pcr
INNER JOIN cmn_Project p ON p.ProjectId = pcr.ProjectId
LEFT JOIN cmn_WorkSpace ws ON ws.WorkSpaceId = p.coeWorkSpaceId
WHERE pcr.CreatedDateTime >= '2025-04-24 10:19:54.070'
  AND pcr.RequestStatus = 6                 
  AND ws.HeadOfWorkSpace IS NOT NULL;
