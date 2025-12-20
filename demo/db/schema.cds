namespace demo.db;
using ZAPI_SALES_ORDER_SRV from '../srv/external/ZAPI_SALES_ORDER_SRV';

using { managed } from '@sap/cds/common';

entity PurchaseOrder : managed {
  key ID        : UUID;
  poNumber      : String(20);
  supplier      : String(50);
  quantity      : Integer;
  price         : Decimal(15,2);
  amount        : Decimal(15,2);
  @assert.enum
  status        : String(15) enum {
    Draft;
    Submitted;
    Approved;
  } default #Draft;
}

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
