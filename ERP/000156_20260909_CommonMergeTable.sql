USE [ERP]
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'[dbo].[cmn_CommonMerge]')
      AND type = N'U'
)
BEGIN

    CREATE TABLE [dbo].[cmn_CommonMerge]
    (
        [MergeId] [uniqueidentifier] NOT NULL,
        [EmployeeId] [uniqueidentifier] NOT NULL,
        [WorkSpaceId] [uniqueidentifier] NOT NULL,
        [ModuleId] [uniqueidentifier] NOT NULL,

        CONSTRAINT [PK_cmn_CommonMerge]
        PRIMARY KEY CLUSTERED
        (
            [MergeId] ASC
        )
        WITH
        (
            PAD_INDEX = OFF,
            STATISTICS_NORECOMPUTE = OFF,
            IGNORE_DUP_KEY = OFF,
            ALLOW_ROW_LOCKS = ON,
            ALLOW_PAGE_LOCKS = ON
        ) ON [PRIMARY]
    ) ON [PRIMARY];

    PRINT 'Table [dbo].[cmn_CommonMerge] created successfully.';

END
ELSE
BEGIN
    PRINT 'Table [dbo].[cmn_CommonMerge] already exists.';
END
GO
