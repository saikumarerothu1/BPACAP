using ZAPI_SALES_ORDER_SRV from './external/ZAPI_SALES_ORDER_SRV.cds';

service ZAPI_SALES_ORDER_SRVSampleService {
    entity A_SalesOrder                as
        projection on ZAPI_SALES_ORDER_SRV.A_SalesOrder {
            key SalesOrder,
                SalesOrderType,
                SalesOrganization,
                DistributionChannel,
                OrganizationDivision,
                SoldToParty,
                PurchaseOrderByCustomer,
                to_Item
        };

    @readonly
    entity A_SalesOrderBillingPlan     as
        projection on ZAPI_SALES_ORDER_SRV.A_SalesOrderBillingPlan {
            key SalesOrder,
            key BillingPlan,
                BillingPlanStartDate,
                BillingPlanStartDateRule,
                ReferenceBillingPlan,
                BillingPlanCategory,
                BillingPlanType,
                BillingPlanEndDate,
                BillingPlanEndDateRule,
                BillingPlanSearchTerm
        };

    
}
