const cds = require('@sap/cds')

module.exports = async function () {
  const northwind = await cds.connect.to('NORTHWIND_SRV')

  this.on('READ', 'Shippers', req =>
    northwind.run(req.query)
  ),
  this.on('READ', 'Customers', req =>
    northwind.run(req.query)
  )
}
