IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'prc_supplierversion' 
               AND COLUMN_NAME = 'ApproveUserId')
BEGIN
    ALTER TABLE prc_supplierversion ADD ApproveUserId UNIQUEIDENTIFIER NULL;
END;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'prc_supplierversion' 
               AND COLUMN_NAME = 'ApproveDateTime')
BEGIN
    ALTER TABLE prc_supplierversion ADD ApproveDateTime DATETIME NULL;
END;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'prc_supplierversion' 
               AND COLUMN_NAME = 'RejectComment')
BEGIN
    ALTER TABLE prc_supplierversion ADD RejectComment NVARCHAR(MAX);
END;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = 'prc_supplierversion' 
               AND COLUMN_NAME = 'RejectDateTime')
BEGIN
    ALTER TABLE prc_supplierversion ADD RejectDateTime DATETIME NULL;
END;
