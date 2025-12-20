const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {

  const { PurchaseOrders , SalesOrder} = this.entities;

  this.before('CREATE', PurchaseOrders, req => {
    if (!req.data.poNumber) {
      req.data.poNumber = `PO-${Date.now()}`;
    }

    if (req.data.quantity && req.data.price) {
      req.data.amount = req.data.quantity * req.data.price;
    }
  });


  this.before('UPDATE', PurchaseOrders, req => {
    if (req.data.status === 'Approved') {
      req.reject(400, 'Approved PO cannot be modified');
    }
  });

  this.before('DELETE', PurchaseOrders, req => {
    req.reject(400, 'Purchase Order deletion not allowed');
  });

  // this.on('READ',SalesOrder,async req => {
  // const s4 = await cds.connect.to('ZAPI_SALES_ORDER_SRV')
  // return s4.run(req.query);
  // })

  
  this.on('READ', PurchaseOrders, async req => {
    const data = await cds.tx(req).run(req.query);

    if (Array.isArray(data)) {
      data.forEach(po => po.readNote = 'Fetched via custom READ handler');
    }
    return data;
  });


  this.after('READ', PurchaseOrders, data => {
    if (Array.isArray(data)) {
      data.forEach(po => {
        po.isHighValue = po.amount > 100000;
      });
    }
  });


  this.after('CREATE', PurchaseOrders, data => {
    console.log(`Purchase Order ${data.poNumber} created successfully`);
  });



  this.on('submitPO', async req => {
    const { poID } = req.data;

    await UPDATE(PurchaseOrders)
      .set({ status: 'Submitted' })
      .where({ ID: poID });

    return `PO ${poID} submitted successfully`;
  });


  this.on('calculateAmount', req => {
    const { quantity, price } = req.data;
    return quantity * price;
  });

});
