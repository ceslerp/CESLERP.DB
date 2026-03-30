CREATE TABLE #TempWorkspaces (WorkSpaceId NVARCHAR(MAX) NOT NULL);

INSERT INTO #TempWorkspaces  
EXEC cmn_SPGetAllWorkspaceUnderParentWorkSpace 'ab844422-3d20-4422-8f2f-d4522323b353';


UPDATE pord
SET pord.Amount =
(
    -- (Base + SSCL) - Discount
    (
        (pord.PurchaseOrderRequisitionQuantity * pord.UnitPrice + ISNULL(pad.SSCL,0))
        -
        (
            (pord.PurchaseOrderRequisitionQuantity * pord.UnitPrice + ISNULL(pad.SSCL,0))
            * pad.DiscountPercentage / 100
        )
    )
    +
    -- VAT
    (
        (
            (pord.PurchaseOrderRequisitionQuantity * pord.UnitPrice + ISNULL(pad.SSCL,0))
            -
            (
                (pord.PurchaseOrderRequisitionQuantity * pord.UnitPrice + ISNULL(pad.SSCL,0))
                * pad.DiscountPercentage / 100
            )
        )
        * pad.VATPercentage / 100
    )
)

FROM sms_PurchaseOrderRequisitionDetail pord
INNER JOIN sms_PurchaseOrderRequisition por 
    ON pord.PurchaseOrderRequisitionId = por.PurchaseOrderRequisitionId
INNER JOIN prc_ProcurementApprovedItemDetail pad 
    ON pord.ProcurementApprovedItemDetailId = pad.ProcurementApprovedItemDetailId

WHERE 
    pord.Amount = pord.PurchaseOrderRequisitionQuantity * pord.UnitPrice
    AND (
        pad.VATPercentage > 0
        OR pad.DiscountPercentage > 0
        OR pad.SSCL > 0
    )
    AND por.AllocateWorkSpaceId IN (SELECT WorkSpaceId FROM #TempWorkspaces)
    AND YEAR(por.CreatedDateTime) = 2026;


DROP TABLE #TempWorkspaces;
