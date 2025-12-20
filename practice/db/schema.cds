namespace demo.db;

using {managed} from '@sap/cds/common';

entity PurchaseOrder : managed {
    key ID          : UUID;
        poNumber    : String(20);
        supplier    : String(50);

        @assert.enum
        status      : String(15) enum {
            Draft;
            Submitted;
            Approved
        } default #Draft;
        totalAmount : Decimal(15, 2);
        createdAt   : Timestamp;
        to_poitems  : Composition of many PurchaseOrderItems
                          on to_poitems.PO = $self;
}

entity PurchaseOrderItems : managed {
    key ID       : UUID;
        PO       : Association to PurchaseOrder;
        product  : String(50);
        quantity : Integer;
        price    : Decimal(13, 2);
        amount   : Decimal(15, 2);
}
