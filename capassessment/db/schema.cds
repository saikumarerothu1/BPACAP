namespace ust.saikumar.db;
using ZAPI_SALES_ORDER_SRV from '../srv/ZAPI_SALES_ORDER_SRV';

using { managed } from '@sap/cds/common';

entity SalesOrderApproval:managed{
    key ID : UUID;
    salesOrderId : Association to one ZAPI_SALES_ORDER_SRV.A_SalesOrder ;
    salesOrg : String;
    soldToParty : String;
    netValue : Decimal(9, 2);
    currency : String(3);
    @assert.enum
    approvalStatus : String(20) enum{
        Pending;
        Approved;
        Rejected
    };
    approverComment:String;
    createdBy:String;
    createdAt:Date;
}