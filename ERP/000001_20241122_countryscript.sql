IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[cmn_Country]') AND type = N'U')
BEGIN
    CREATE TABLE [cmn_Country] (
        [CountryId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
        [Name] NVARCHAR(255) NOT NULL UNIQUE
    );

    CREATE INDEX IX_Countries_Name ON [cmn_Country] ([Name]);
END
ELSE
BEGIN
    PRINT 'Table [cmn_Countries] already exists.';
END

IF NOT EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'Sri Lanka')
INSERT INTO [cmn_Country] ([CountryId], [Name]) 
VALUES ('11111111-1111-1111-1111-111111111111', 'Sri Lanka');

IF NOT EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'United Arab Emirates')
INSERT INTO [cmn_Country] ([CountryId], [Name]) 
VALUES ('22222222-2222-2222-2222-222222222222', 'United Arab Emirates');

IF NOT EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'Malaysia')
INSERT INTO [cmn_Country] ([CountryId], [Name]) 
VALUES ('33333333-3333-3333-3333-333333333333', 'Malaysia');

IF NOT EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'Sweden')
INSERT INTO [cmn_Country] ([CountryId], [Name]) 
VALUES ('44444444-4444-4444-4444-444444444444', 'Sweden');


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[cmn_Currency]') AND type = N'U')
BEGIN
    CREATE TABLE [cmn_Currency] (
        [CurrencyId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
        [CurrencyName] NVARCHAR(255) NOT NULL UNIQUE,
        [CurrencyCode] NVARCHAR(10) NOT NULL UNIQUE
    );

    CREATE INDEX IX_Currency_CurrencyCode ON [cmn_Currency] ([CurrencyCode]);
END
ELSE
BEGIN
    PRINT 'Table [cmn_Currency] already exists.';
END

-- Insert currency for Sri Lanka
IF EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'Sri Lanka')
    AND NOT EXISTS (SELECT 1 FROM [cmn_Currency] WHERE [CurrencyCode] = 'LKR')
INSERT INTO [cmn_Currency] ([CurrencyId], [CurrencyName], [CurrencyCode])
VALUES ('55555555-5555-5555-5555-555555555555', 'Sri Lankan Rupee', 'LKR');

-- Insert currency for United Arab Emirates
IF EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'United Arab Emirates')
    AND NOT EXISTS (SELECT 1 FROM [cmn_Currency] WHERE [CurrencyCode] = 'AED')
INSERT INTO [cmn_Currency] ([CurrencyId], [CurrencyName], [CurrencyCode])
VALUES ('66666666-6666-6666-6666-666666666666', 'UAE Dirham', 'AED');

-- Insert currency for Malaysia
IF EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'Malaysia')
    AND NOT EXISTS (SELECT 1 FROM [cmn_Currency] WHERE [CurrencyCode] = 'MYR')
INSERT INTO [cmn_Currency] ([CurrencyId], [CurrencyName], [CurrencyCode])
VALUES ('77777777-7777-7777-7777-777777777777', 'Malaysian Ringgit', 'MYR');

-- Insert currency for Sweden
IF EXISTS (SELECT 1 FROM [cmn_Country] WHERE [Name] = 'Sweden')
    AND NOT EXISTS (SELECT 1 FROM [cmn_Currency] WHERE [CurrencyCode] = 'SEK')
INSERT INTO [cmn_Currency] ([CurrencyId], [CurrencyName], [CurrencyCode])
VALUES ('88888888-8888-8888-8888-888888888888', 'Swedish Krona', 'SEK');

