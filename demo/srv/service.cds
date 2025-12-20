using demo.db as db from '../db/schema';

service POService {
    //@(requires: 'authenticated-user')
    //@odata.draft.enabled:true
    //  @restrict:[
    //     {grant:'*',to:['Admin']},
    //     {grant:'READ',to:['POviewer']}
    // ]
    entity PurchaseOrders as projection on db.PurchaseOrder;
    action submitPO(poID : UUID);
    function calculateAmount(quantity : Integer, price : Decimal(15,2)) returns Decimal(15,2);
}
