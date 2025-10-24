IF NOT EXISTS (
    SELECT 1 
    FROM sys.columns 
    WHERE Name = N'LastPasswordChange'
      AND Object_ID = Object_ID(N'dbo.[User]')
)
BEGIN
    ALTER TABLE [dbo].[User]
    ADD [LastPasswordChange] DATETIME NOT NULL 
        CONSTRAINT DF_User_LastPasswordChange DEFAULT (GETDATE());
END
