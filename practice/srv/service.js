const cds = require('@sap/cds');
module.exports=cds.service.impl(function(){
    const{PurchaseOrder,PurchaseOrderItems}=this.entities;
    this.before('CREATE',PurchaseOrder,async(req) =>{
        if(!req.data.poNumber){
            req.error(403,'poNumber Compulsory');
        }
        if(!req.data.supplier){
            req.data.supplier='ABC Supplier'
        }
    })
    this.before('UPDATE',PurchaseOrder,(req) => {
        console.log(req.data.status);
        if(req.data.status==='Approved'){
            req.reject(403,'You are not allowed to upadte')
        }
    })
    this.before('CREATE',PurchaseOrderItems,async(req)=>{
        if(!req.data.product){
            req.error(403,'Product Compulsory');
        }
    })
    this.before('CREATE',PurchaseOrderItems,async(result, req) => {
        if(!result.amount){
            result.amount=result.quantity*result.price;
        }
        return result
    })

    this.on('Submit', PurchaseOrder, async (req) => {

    const { ID } = req.params[0];

    const po = await SELECT.one.from(PurchaseOrder).where({ ID });
    if (!po) req.error(404, 'Purchase Order not found');

    if (po.status !== 'Draft') {
        req.notify(`PO already ${po.status}`);
        return po;
    }

    await UPDATE(PurchaseOrder)
        .set({ status: 'Submitted' })
        .where({ ID });

    return SELECT.one.from(PurchaseOrder).where({ ID });
});
})