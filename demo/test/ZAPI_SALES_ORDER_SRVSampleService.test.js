const cds = require('@sap/cds')

const { GET, POST, expect, axios } = cds.test (__dirname+'/..')
axios.defaults.auth = { username: 'alice', password: '' }

describe('ZAPI_SALES_ORDER_SRVSampleService OData APIs', () => {

  it('serves ZAPI_SALES_ORDER_SRVSampleService.A_SalesOrder', async () => {
    const { data } = await GET `/odata/v4/zapi-sales-order-srvsample/A_SalesOrder ${{ params: { $select: 'SalesOrder,SalesOrderType' } }}`
    expect(data.value).to.containSubset([
      {"SalesOrder":"der-556545","SalesOrderType":"6545"},
    ])
  })

})
