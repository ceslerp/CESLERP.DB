INSERT INTO dbo.cir_CircularAttachment
(
    CircularInformationId,
    AttachmentId,
    IsActive,
    UpdatedDateTime,
    UpdatedUserId
)
SELECT
    CI.CircularInformationId,
    CA.AttachmentId,
    1,
    NULL,
    NULL
FROM dbo.cir_CircularInformation CI
INNER JOIN dbo.cmn_Attachment CA
    ON CI.CircularAttachment = CA.FileName
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.cir_CircularAttachment CCA
    WHERE CCA.CircularInformationId = CI.CircularInformationId
      AND CCA.AttachmentId = CA.AttachmentId
);
