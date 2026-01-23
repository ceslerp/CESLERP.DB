USE ERP;
GO

BEGIN
    CREATE TABLE [dbo].[prc_BaseProcurementCommittee](
        [ProcurementCommiteeId] UNIQUEIDENTIFIER NOT NULL,
        [DataStatus] INT NOT NULL DEFAULT ((0)),
        [IsActive] BIT NOT NULL DEFAULT ((0)),
        [OrganizationId] UNIQUEIDENTIFIER NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
        [BusinessUnitId] UNIQUEIDENTIFIER NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
        [WorkSpaceId] UNIQUEIDENTIFIER NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
        [CreatedDateTime] DATETIME NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
        [CreatedUserId] UNIQUEIDENTIFIER NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
        [UpdatedDateTime] DATETIME NULL,
        [UpdatedUserId] UNIQUEIDENTIFIER NULL,
        [CommitteeName] VARCHAR(100) NULL,
        CONSTRAINT [PK_prc_BaseProcurementCommitee]
            PRIMARY KEY CLUSTERED ([ProcurementCommiteeId])
    );
END;
GO
