IF NOT EXISTS (
    SELECT 1 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'prc_SupplierCategory'
      AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME = 'ItemSubCategoryId'
)
BEGIN
    ALTER TABLE [dbo].[prc_SupplierCategory]
    ADD [ItemSubCategoryId] UNIQUEIDENTIFIER NULL;

    PRINT 'ItemSubCategoryId column added to prc_SupplierCategory table.';
END
ELSE
BEGIN
    DECLARE @isNullable NVARCHAR(3), @dataType NVARCHAR(128)

    SELECT 
        @isNullable = IS_NULLABLE,
        @dataType = DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'prc_SupplierCategory' 
      AND COLUMN_NAME = 'ItemSubCategoryId'

    IF @isNullable = 'NO' OR @dataType != 'uniqueidentifier'
    BEGIN
        ALTER TABLE [dbo].[prc_SupplierCategory]
        ALTER COLUMN [ItemSubCategoryId] UNIQUEIDENTIFIER NULL;

        PRINT 'ItemSubCategoryId column modified to UNIQUEIDENTIFIER NULL.';
    END
    ELSE
    BEGIN
        PRINT 'ItemSubCategoryId column already exists with correct type and nullability.';
    END
END
