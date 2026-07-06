ALTER TABLE [dbo].[cir_CircularAttachment]
ADD 
    [IsActive] [bit] NOT NULL DEFAULT ((1)),
    [UpdatedDateTime] [datetime] NULL,
    [UpdatedUserId] [uniqueidentifier] NULL;
GO