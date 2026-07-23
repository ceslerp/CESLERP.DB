INSERT INTO dbo.cmn_Attachment
(
    AttachmentId,
    FileName,
    ContentType,
    Extension,
    FileSize,
    StoragePath,
    CreatedDateTime,
    CreatedUserId
)
SELECT
    NEWID(),
    CI.CircularAttachment,
    'application/pdf',
    'pdf',
    179847,
    'Circulars/' + CI.CircularAttachment,
    CI.CreatedDateTime,
    CI.CreatedUserId
FROM dbo.cir_CircularInformation CI
INNER JOIN
(
    SELECT CircularAttachment
    FROM dbo.cir_CircularInformation
    WHERE CircularAttachment IS NOT NULL
      AND LTRIM(RTRIM(CircularAttachment)) <> ''
    GROUP BY CircularAttachment
    HAVING COUNT(*) = 1
) UniqueAttachments
    ON UniqueAttachments.CircularAttachment = CI.CircularAttachment
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.cmn_Attachment CA
    WHERE CA.FileName = CI.CircularAttachment
      AND CA.StoragePath = 'Circulars/' + CI.CircularAttachment
);
