USE [ERP]
GO
;WITH RankedEmployeeVersions AS (
    SELECT
        EmployeeId,
        EPFNo,
        NameWithInitial,
        ROW_NUMBER() OVER (
            PARTITION BY EmployeeId
            ORDER BY IsActive DESC, Version DESC
        ) AS rn
    FROM [dbo].[cmn_EmployeeVersion]
),
CurrentEmployeeVersion AS (
    SELECT EmployeeId, NameWithInitial
    FROM RankedEmployeeVersions
    WHERE rn = 1
),
EmployeeByEpf AS (
    SELECT
        UPPER(REPLACE(LTRIM(RTRIM(EPFNo)), ' ', '')) AS EpfNormalized,
        NameWithInitial,
        ROW_NUMBER() OVER (
            PARTITION BY UPPER(REPLACE(LTRIM(RTRIM(EPFNo)), ' ', ''))
            ORDER BY rn
        ) AS epf_rn
    FROM RankedEmployeeVersions
    WHERE rn = 1 AND EPFNo IS NOT NULL AND LTRIM(RTRIM(EPFNo)) <> ''
),
FrmUserNames AS (
    SELECT UserId, UserName FROM [FRM].[dbo].[User]
    UNION ALL
    SELECT u.UserId, u.UserName
    FROM [FRM].[dbo].[Users] u
    WHERE NOT EXISTS (SELECT 1 FROM [FRM].[dbo].[User] u2 WHERE u2.UserId = u.UserId)
),
UserToName AS (
    SELECT
        f.UserId,
        e.NameWithInitial
    FROM FrmUserNames f
    INNER JOIN EmployeeByEpf e
        ON e.EpfNormalized = UPPER(REPLACE(LTRIM(RTRIM(f.UserName)), ' ', ''))
        AND e.epf_rn = 1
)
UPDATE c
SET
    c.CreatedUserName = ISNULL(cu.NameWithInitial, ISNULL(ceDirect.NameWithInitial, c.CreatedUserName)),
    c.UpdatedUserName = ISNULL(uu.NameWithInitial, ISNULL(ueDirect.NameWithInitial, c.UpdatedUserName))
FROM [dbo].[cir_CircularInformation] c
LEFT JOIN UserToName cu ON cu.UserId = c.CreatedUserId
LEFT JOIN UserToName uu ON uu.UserId = c.UpdatedUserId
LEFT JOIN CurrentEmployeeVersion ceDirect ON ceDirect.EmployeeId = c.CreatedUserId
LEFT JOIN CurrentEmployeeVersion ueDirect ON ueDirect.EmployeeId = c.UpdatedUserId
WHERE c.CreatedUserName IS NULL OR (c.UpdatedUserId IS NOT NULL AND c.UpdatedUserName IS NULL)
GO
