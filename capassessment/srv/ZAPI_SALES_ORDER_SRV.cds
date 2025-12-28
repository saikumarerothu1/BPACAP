using ZAPI_SALES_ORDER_SRV from './external/ZAPI_SALES_ORDER_SRV.cds';
using ust.saikumar.db from '../db/schema';
@path:'so-service'
@requires: 'authenticated-user'
service ZAPI_SALES_ORDER_SRVSampleService {
    @restrict:[
        {grant:'*',to:['SO_Manager']},
        {grant:'READ',to:['SO_Employee']}
    ]
    entity A_SalesOrder as
        projection on ZAPI_SALES_ORDER_SRV.A_SalesOrder {
            key SalesOrder,
                SalesOrderType,
                SalesOrganization,
                SalesGroup,
                SalesOffice,
                CreationDate,
                CreatedByUser,
                SalesOrderDate,
                TotalNetAmount,
                TransactionCurrency              
        };
        action approveSalesorder(SalesOrder:Integer) returns A_SalesOrder;
        action rejectSalesorder(SalesOrder:Integer) returns A_SalesOrder;
    @odata.draft.enabled
    entity SalesOrderApproval as projection on db.SalesOrderApproval;
    
}
