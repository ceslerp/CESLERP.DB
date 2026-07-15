USE [ERP]
GO

;WITH RankedEmployeeVersions AS (
    SELECT
        EmployeeId, EPFNo, NameWithInitial,
        ROW_NUMBER() OVER (PARTITION BY EmployeeId ORDER BY IsActive DESC, Version DESC) AS rn
    FROM [dbo].[cmn_EmployeeVersion]
),
CurrentEmployeeVersion AS (
    SELECT EmployeeId, NameWithInitial FROM RankedEmployeeVersions WHERE rn = 1
),
EmployeeByEpf AS (
    SELECT
        UPPER(REPLACE(LTRIM(RTRIM(EPFNo)), ' ', '')) AS EpfNormalized,
        NameWithInitial,
        ROW_NUMBER() OVER (PARTITION BY UPPER(REPLACE(LTRIM(RTRIM(EPFNo)), ' ', '')) ORDER BY rn) AS epf_rn
    FROM RankedEmployeeVersions
    WHERE rn = 1 AND EPFNo IS NOT NULL AND LTRIM(RTRIM(EPFNo)) <> ''
),
FrmUserNames AS (
    SELECT UserId, UserName FROM [FRM].[dbo].[User]
    UNION ALL
    SELECT u.UserId, u.UserName FROM [FRM].[dbo].[Users] u
    WHERE NOT EXISTS (SELECT 1 FROM [FRM].[dbo].[User] u2 WHERE u2.UserId = u.UserId)
),
UserToName AS (
    SELECT f.UserId, e.NameWithInitial
    FROM FrmUserNames f
    INNER JOIN EmployeeByEpf e
        ON e.EpfNormalized = UPPER(REPLACE(LTRIM(RTRIM(f.UserName)), ' ', ''))
        AND e.epf_rn = 1
)
UPDATE d
SET
    d.CreatedUserName = ISNULL(cu.NameWithInitial, ISNULL(ceDirect.NameWithInitial, d.CreatedUserName)),
    d.UpdatedUserName = ISNULL(uu.NameWithInitial, ISNULL(ueDirect.NameWithInitial, d.UpdatedUserName))
FROM [dbo].[cir_ControlDocument] d
LEFT JOIN UserToName cu ON cu.UserId = d.CreatedUserId
LEFT JOIN UserToName uu ON uu.UserId = d.UpdatedUserId
LEFT JOIN CurrentEmployeeVersion ceDirect ON ceDirect.EmployeeId = d.CreatedUserId
LEFT JOIN CurrentEmployeeVersion ueDirect ON ueDirect.EmployeeId = d.UpdatedUserId
WHERE d.CreatedUserName IS NULL OR (d.UpdatedUserId IS NOT NULL AND d.UpdatedUserName IS NULL)
GO