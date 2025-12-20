const cds = require('@sap/cds');

module.exports = async (srv) => 
{        
    // Using CDS API      
    const ZAPI_SALES_ORDER_SRV = await cds.connect.to("ZAPI_SALES_ORDER_SRV"); 
      srv.on('READ', 'A_SalesOrder', req => ZAPI_SALES_ORDER_SRV.run(req.query)); 
      srv.on('READ', 'A_SalesOrderBillingPlan', req => ZAPI_SALES_ORDER_SRV.run(req.query)); 
      // payload = {
      //       SalesOrder: '0005555589',
      //       SalesOrderType: 'OR',
      //       SalesOrganization: '1710',
      //       DistributionChannel: '10',
      //       OrganizationDivision: '00',
 
      //       SoldToParty: '17100003',
 
      //       PurchaseOrderByCustomer: 'XYZ',
 
      //       to_Partner: [
      //           {
      //               PartnerFunction: 'AG',
      //               Customer: '17100003'
      //           }
      //       ],
 
      //       to_Item: [
      //           {
      //               Material: 'TG11',
      //               RequestedQuantity: '1'
      //           }
      //       ]
      //   }
      // srv.on('CREATE', 'A_SalesOrder', async (req) => {
      //   const res = await ZAPI_SALES_ORDER_SRV.send({
      //     method : 'POST',
      //     path: '/A_SalesOrder',
      //     data: payload,
      //     csrf: true,
      //     headers : {
      //       'X-Requested-With' : 'XMLHttpRequest'
      //     }
      //    })
      // })
    srv.on('CREATE', 'A_SalesOrder', async (req) => {
    return ZAPI_SALES_ORDER_SRV.send({
      method: 'POST',
      path: 'A_SalesOrder',
      data: req.data,
      csrf: true,
      headers: {
        'X-Requested-With': 'XMLHttpRequest'
      }
    });
  });
 
}