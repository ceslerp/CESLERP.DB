CREATE TABLE [dbo].[api_ApiUser] (
    [ApiUserId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    [DisplayName] NVARCHAR(255) NOT NULL,
    [ClientId] NVARCHAR(255) NOT NULL,
    [ClientSecret] NVARCHAR(512) NOT NULL,
    [IsActive] BIT NOT NULL
);

CREATE TABLE [dbo].[api_ApiScopes] (
    [ApiScopeId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    [ScopeName] NVARCHAR(255) NOT NULL,
    [ScopeDescription] NVARCHAR(1000) NULL
);

CREATE TABLE [dbo].[api_ApiUserScopes] (
    [ApiUserId] UNIQUEIDENTIFIER NOT NULL,
    [ApiScopeId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_api_ApiUserScopes] 
        PRIMARY KEY CLUSTERED ([ApiUserId], [ApiScopeId]),

    CONSTRAINT [FK_api_ApiUserScopes_ApiUser] 
        FOREIGN KEY ([ApiUserId]) 
        REFERENCES [dbo].[api_ApiUser]([ApiUserId]),

    CONSTRAINT [FK_api_ApiUserScopes_ApiScopes] 
        FOREIGN KEY ([ApiScopeId]) 
        REFERENCES [dbo].[api_ApiScopes]([ApiScopeId])
);

INSERT INTO [dbo].[api_ApiScopes]
(
    [ApiScopeId],
    [ScopeName],
    [ScopeDescription]
)
VALUES
(
    '4259EA2D-8A2F-4B8C-AF93-265A2052D898',
    'cecb_user',
    'CECB normal api user'
);