namespace ust.saikumar.sales;

using {
    managed,
    Currency,
    cuid
} from '@sap/cds/common';


aspect audit : managed {
    VerifiedBy : String(10);
    VerifiedAt : Timestamp;
    ApprovedBy : String(20);
    ApprovedAt : Timestamp;
}


type isActive         : String(20) enum {
    Active;
    Inactive
};

type Status           : String(15) enum {
    Draft;
    Submitted;
    Approved;
    Rejected;
    Closed;
    Cancelled
};

type SalesOrderStatus : String(20) enum {
    Open;
    PartiallyShipped;
    FullyShipped;
    Cancelled
};


// @cds.autoexpose
entity MaterialTable : managed {
    key MaterialID          : UUID @mandatory;
        MaterialCode        : String(10);
        MaterialDescription : String(50);
        StandardPrice       : Decimal(10, 2);

        @assert.enum
        Flag                : isActive default #Inactive;

        to_salesitems       : Composition of many SalesItem
                                  on to_salesitems.Material = $self;
}


// @cds.autoexpose
entity VendorMaster : managed {
    key VendorID     : UUID @mandatory;
        VendorCode   : Integer;
        VendorName   : String(50);
        ContactEmail : String(50);

        @assert.enum
        Flag         : isActive default #Inactive;
        to_inquiries : Composition of many SalesInquiry
                           on to_inquiries.Vendor = $self;
}

// @cds.autoexpose
entity SalesInquiry : managed {
    key InquiryID      : UUID;
        InquiryNumber  : String(20);
        Vendor         : Association to VendorMaster;
        InquiryDate    : Date;

        @assert.enum
        Status         : Status default #Draft;
        to_salesheader : Composition of many SalesHeader
                             on to_salesheader.InquiryRef = $self;
}

// @cds.autoexpose
entity SalesHeader : managed {
    key SalesOrderID    : UUID;
        SalesOrderNo    : String(20);
        InquiryRef      : Association to SalesInquiry;
        OrderDate       : Date;
        TotalOrderValue : Decimal(15, 2);

        @assert.enum
        Status          : SalesOrderStatus default #Open;
        to_salesitems   : Composition of many SalesItem
                              on to_salesitems.SalesOrder = $self;
        to_audit        : Composition of many SalesAuditLog
                              on to_audit.SalesOrder = $self;
}

entity SalesItem {
    key SalesItemID     : UUID;
        SalesOrder      : Association to SalesHeader;
        Material : Association to MaterialTable;
        OrderedQuantity : Integer;
        UnitPrice       : Decimal(10, 2);
        NetValue        : Decimal(10, 2);
}

// @cds.autoexpose
entity SalesAuditLog : managed, cuid {
    SalesOrder     : Association to SalesHeader;
    error_status   : String(20) default '404';
    error_message  : String(500);
    audit_action   : String(30);
    user_id        : String(20);
    changed_fields : String(500);
}
