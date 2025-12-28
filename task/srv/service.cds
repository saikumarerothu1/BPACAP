using { 
    po.ust.db as db 
} from '../db/schema';
service PurchaseOrderService @(requires: 'authenticated-user') {
    @odata.draft.enabled
    @restrict:[
        {grant:'*',to:['Admin']},
        {grant:'READ',to:['POviewer']}
    ]
    entity POHeaders as projection on db.POHeader;
    @restrict:[
        {grant:'*',to:['Admin']},
        {grant:'READ',to:['POviewer']}
    ]
    entity POItems  as projection on db.POItem;
}