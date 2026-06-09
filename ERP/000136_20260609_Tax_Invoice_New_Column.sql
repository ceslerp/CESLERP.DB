USE [ERP];
GO

IF COL_LENGTH('dbo.fin_TaxInvoice', 'InvoiceType') IS NULL
BEGIN
    ALTER TABLE dbo.fin_TaxInvoice
    ADD InvoiceType INT NOT NULL
        CONSTRAINT DF_fin_TaxInvoice_InvoiceType DEFAULT ((1));
END
GO
