USE [ERP]
GO

ALTER TABLE [dbo].[prc_BaseProcurementCommittee]
ADD 
    [ApprovedDateTime] DATETIME NULL,
    [ApprovedUserId] UNIQUEIDENTIFIER NULL,
    [Comment] VARCHAR(MAX) NULL;
GO
