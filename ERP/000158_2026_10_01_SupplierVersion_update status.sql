USE [ERP]
GO
  
CREATE TABLE [dbo].[prc_SupplierVersion1](
	[SupplierVersionId] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[SupplierId] [uniqueidentifier] NOT NULL,
	[SupplierName] [nvarchar](max) NOT NULL,
	[BranchName] [nvarchar](max) NULL,
	[AddressLine1] [nvarchar](max) NOT NULL,
	[ContactNoMobile] [nvarchar](max) NULL,
	[ContactPerson] [nvarchar](max) NULL,
	[ContactPersonDesignation] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[FaxNo] [nvarchar](max) NULL,
	[VATRegistrationNo] [nvarchar](max) NULL,
	[BusinessRegistrationNo] [nvarchar](max) NULL,
	[ChequeIssuedName] [nvarchar](max) NULL,
	[Status] [int] NULL
)
GO

UPDATE sv
SET sv.Status = 1
FROM  prc_SupplierVersion AS sv
JOIN prc_SupplierVersion1 sv1 ON sv1.SupplierVersionId = sv.SupplierVersionId

UPDATE sv
SET sv.Status = 1
FROM  prc_SupplierVersion AS sv
WHERE CONVERT(DATE,sv.CreatedDateTime,101) >= '2026/08/20'
