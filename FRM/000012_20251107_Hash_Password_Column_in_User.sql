IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE Name = N'HashPassword'
      AND Object_ID = Object_ID(N'[dbo].[User]')
)
BEGIN
    ALTER TABLE [dbo].[User]
    ADD [HashPassword] NVARCHAR(100) NULL;
END
