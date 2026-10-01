UPDATE sv
SET sv.Status = 1
FROM  prc_SupplierVersion AS sv
JOIN prc_SupplierVersion1 sv1 ON sv1.SupplierVersionId = sv.SupplierVersionId

UPDATE sv
SET sv.Status = 1
FROM  prc_SupplierVersion AS sv
WHERE CONVERT(DATE,sv.CreatedDateTime,101) >= '2026/08/20'