ALTER TABLE dbo.prc_SupplierVersion
ADD Status int NULL;

UPDATE prc_SupplierVersion
SET Status = 2;




