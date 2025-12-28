using my.sample from '../db/schema';

service CatalogService @(requires: 'authenticated-user') {
    @odata.draft.enabled : true
    @restrict:[
        {grant:'*',to:['Adminview']},
        {grant:'READ',to:['Productviewer']}
    ]
    entity Customers as projection on sample.Customer;
    entity Products  as projection on sample.Product;
}
