using demo.db from '../db/schema';
service poservice{
    @odata.draft.enabled:true
    entity PurchaseOrder as projection on db.PurchaseOrder
    actions {
        @common.SideEffects #StatusUpdate:{
            TargetProperties : ['status']
        } action Submit() returns PurchaseOrder;
    }
    entity PurchaseOrderItems as projection on db.PurchaseOrderItems;
}