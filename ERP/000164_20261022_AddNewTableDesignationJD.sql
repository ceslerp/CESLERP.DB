USE [ERP]
GO

IF NOT EXISTS (
    SELECT 1 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'[dbo].[hrm_DesignationJD]') 
      AND type = N'U'
)
BEGIN
CREATE TABLE [dbo].[hrm_DesignationJD](
	[DesignationJDId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[AttachmentId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationJDId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
ELSE
BEGIN
    PRINT 'Table [hrm_DesignationJD] already exists.';
END

