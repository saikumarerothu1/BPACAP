const cds = require('@sap/cds')

const { GET, POST, expect, axios } = cds.test (__dirname+'/..')
axios.defaults.auth = { username: 'alice', password: '' }

describe('ZAPI_SALES_ORDER_SRV OData APIs', () => {

  it('serves ZAPI_SALES_ORDER_SRV.A_SalesOrder', async () => {
    const { data } = await GET `/odata/v4/zapi-sales-order-srv/A_SalesOrder ${{ params: { $select: 'SalesOrder,SalesOrderType' } }}`
    expect(data.value).to.containSubset([
      {"SalesOrder":"r-20987185","SalesOrderType":"7185"},
    ])
  })

  it('executes rejectApprovalRequest', async () => {
    const { data } = await POST `/odata/v4/zapi-sales-order-srv/rejectApprovalRequest ${
      {"SalesOrder":"SalesOrder-7765773"}
    }`
    // TODO finish this test
    // expect(data.value).to...
  })
  it('executes releaseApprovalRequest', async () => {
    const { data } = await POST `/odata/v4/zapi-sales-order-srv/releaseApprovalRequest ${
      {"SalesOrder":"SalesOrder-20759526"}
    }`
    // TODO finish this test
    // expect(data.value).to...
  })
})
