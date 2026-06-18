USE [FRM]
GO

IF NOT EXISTS (
SELECT 1
FROM [dbo].[TSys_Task]
WHERE TaskId = '8d4ee724-b85c-4f31-aef8-0043ef8b8dd7'
)
BEGIN
INSERT INTO [dbo].[TSys_Task]
(
[TaskId],
[TaskCode],
[TaskShortName],
[TaskName],
[Description],
[DomainId],
[LicenceId],
[TaskNumber],
[ImageURL],
[NavigateURL],
[Controller],
[Action],
[IsActive],
[Module],
[X],
[Y],
[Width],
[Height],
[TileGroup],
[TileTitle],
[TileContent],
[TileClass],
[TileStyle],
[IsShowAsTile]
)
VALUES
(
'8d4ee724-b85c-4f31-aef8-0043ef8b8dd7',
'Item',
'Item',
'Item',
'Item Management',
NULL,
NULL,
2033,
NULL,
'/item/index',
'item',
NULL,
1,
'SMS',
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
1
)
END
GO
