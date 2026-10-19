USE ERP;
GO

BEGIN TRANSACTION

UPDATE cir_ControlDocument 
SET IssueDate = DATEADD(day, 1, IssueDate);

COMMIT TRANSACTION;