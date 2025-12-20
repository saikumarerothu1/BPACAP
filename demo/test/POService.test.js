const cds = require('@sap/cds')

const { GET, POST, expect, axios } = cds.test (__dirname+'/..')
axios.defaults.auth = { username: 'alice', password: '' }

describe('POService OData APIs', () => {

  it('serves POService.PurchaseOrders', async () => {
    const { data } = await GET `/odata/v4/po/PurchaseOrders ${{ params: { $select: 'ID,poNumber' } }}`
    expect(data.value).to.containSubset([
      {"ID":"15254671-9236-409b-b817-fcefdb21557b","poNumber":"poNumber-15254671"},
    ])
  })

  it('executes submitPO', async () => {
    const { data } = await POST `/odata/v4/po/submitPO ${
      {"poID":"33118577-701f-4a0a-9c82-7696061e459c"}
    }`
    // TODO finish this test
    // expect(data.value).to...
  })
  it('executes calculateAmount', async () => {
    const { data } = await POST `/odata/v4/po/calculateAmount ${
      {"quantity":70,"price":16364574.28}
    }`
    // TODO finish this test
    // expect(data.value).to...
  })
})
