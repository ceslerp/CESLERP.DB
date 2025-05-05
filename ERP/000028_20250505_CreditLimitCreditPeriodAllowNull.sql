-- Handle CreditLimit
IF NOT EXISTS (
    SELECT 1 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'prc_SupplierVersion' 
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'CreditLimit'
)
BEGIN
    ALTER TABLE [dbo].[prc_SupplierVersion]
    ADD [CreditLimit] DECIMAL(18,2) NOT NULL DEFAULT 0;

    PRINT 'CreditLimit column added to prc_SupplierVersion table as NOT NULL.';
END
ELSE
BEGIN
    DECLARE @isNullableCL NVARCHAR(3), @dataTypeCL NVARCHAR(128)

    SELECT 
        @isNullableCL = IS_NULLABLE,
        @dataTypeCL = DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'prc_SupplierVersion' 
      AND COLUMN_NAME = 'CreditLimit'

    IF @isNullableCL = 'YES' OR @dataTypeCL != 'decimal'
    BEGIN
        -- Update existing NULLs to 0 to allow NOT NULL change
        UPDATE [dbo].[prc_SupplierVersion]
        SET CreditLimit = 0
        WHERE CreditLimit IS NULL;

        -- Alter column to NOT NULL
        ALTER TABLE [dbo].[prc_SupplierVersion]
        ALTER COLUMN [CreditLimit] DECIMAL(18,2) NOT NULL;

        PRINT 'CreditLimit column modified to DECIMAL(18,2) NOT NULL.';
    END
    ELSE
    BEGIN
        PRINT 'CreditLimit column already exists with correct type and nullability.';
    END
END

-- Handle CreditPeriod
IF NOT EXISTS (
    SELECT 1 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'prc_SupplierVersion' 
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'CreditPeriod'
)
BEGIN
    ALTER TABLE [dbo].[prc_SupplierVersion]
    ADD [CreditPeriod] DECIMAL(18,2) NOT NULL DEFAULT 0;

    PRINT 'CreditPeriod column added to prc_SupplierVersion table as NOT NULL.';
END
ELSE
BEGIN
    DECLARE @isNullableCP NVARCHAR(3), @dataTypeCP NVARCHAR(128)

    SELECT 
        @isNullableCP = IS_NULLABLE,
        @dataTypeCP = DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'prc_SupplierVersion' 
      AND COLUMN_NAME = 'CreditPeriod'

    IF @isNullableCP = 'YES' OR @dataTypeCP != 'decimal'
    BEGIN
        -- Update existing NULLs to 0 to allow NOT NULL change
        UPDATE [dbo].[prc_SupplierVersion]
        SET CreditPeriod = 0
        WHERE CreditPeriod IS NULL;

        -- Alter column to NOT NULL
        ALTER TABLE [dbo].[prc_SupplierVersion]
        ALTER COLUMN [CreditPeriod] DECIMAL(18,2) NOT NULL;

        PRINT 'CreditPeriod column modified to DECIMAL(18,2) NOT NULL.';
    END
    ELSE
    BEGIN
        PRINT 'CreditPeriod column already exists with correct type and nullability.';
    END
END
