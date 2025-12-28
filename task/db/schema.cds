namespace po.ust.db;

entity POHeader {
    key PO_ID                  : UUID ;
    vendorCode                 : String(4);         
    poNumber                   : String(6);        
    poDate                     : Date;               
    currency                   : String(3);          
    createdBy                  : String(30);        
    vendorName                 : String(60);
    deliveryDate               : Date;
    paymentTerms               : String(5);
    shippingAddress            : String(200);
    billingAddress             : String(200);
    totalAmount                : Decimal(15,2);
    taxAmount                  : Decimal(15,2);
    freightCharges             : Decimal(15,2);
    poStatus                   : String(20);
    remarks                    : String(200);
    approvedBy                 : String(30);
    approvedDate               : Date;
    lastModifiedBy             : String(30);
    lastModifiedDate           : Date;
    referenceNumber            : String(40);
    items : Composition of many POItem
        on items.header = $self;
}

entity POItem {
    key item_ID                : UUID;
    materialCode               : String(20);        
    quantity                   : Decimal(13,3);     
    materialDescription        : String(80);
    price                      : Decimal(15,2);
    uom                        : String(10);
    amount                     : Decimal(15,2);
    taxPercent                 : Decimal(5,2);
    lineStatus                 : String(20);
    deliveryDate               : Date;
    remarks                    : String(100);
    header : Association to POHeader;
}