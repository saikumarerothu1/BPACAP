using {ust.saikumar.sales as sales} from '../db/schema';

// Master Data Service
service MasterDataService {
    @odata.draft.enabled : true
    @Capabilities : { Insertable:true,Updatable:true,Deletable:true}
    entity MaterialTable as projection on sales.MaterialTable;
}

// Vendor Service
service VendorService {
    entity VendorMaster as projection on sales.VendorMaster;
}

// Sales Service
service SalesService {
    entity SalesInquiry as projection on sales.SalesInquiry;
    entity SalesHeader as projection on sales.SalesHeader;
    entity SalesItem as projection on sales.SalesItem;
}

// Audit Service
service AuditService {
    entity SalesAuditLog as projection on sales.SalesAuditLog;
}