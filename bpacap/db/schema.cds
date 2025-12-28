namespace BPACAP.db;

entity purchaseorder{
    key po_id : String;
    po_code : String;
    po_types : String;
    po_category : String;
    po_item : String;
    po_description : String;
    po_deliverydate : Date;
    po_subcategory : String;
    po_netamount : Decimal(10, 2);
    po_quantity : Integer;

    approver : String;
    Approver_Status : String;
    db_status : Boolean default false;
    is_active : Boolean default false;
    is_changed : Boolean default false;
}
