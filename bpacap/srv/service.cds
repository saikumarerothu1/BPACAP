using BPACAP.db from '../db/schema';
@requires: 'authenticated-user'
service productservice {
@odata.draft.enabled:true
@restrict:[
        {grant:'*',to:['bpa_admin']},
        {grant:'READ',to:['bpa_viewer']}
    ]
entity purchaseorder as projection on db.purchaseorder;
}