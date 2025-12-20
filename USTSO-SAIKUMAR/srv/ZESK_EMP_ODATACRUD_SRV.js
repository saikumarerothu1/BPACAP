const cds = require('@sap/cds');

module.exports = async (srv) => {
  const s4 = await cds.connect.to('ZESK_EMP_ODATACRUD_SRV');

  srv.on('READ', 'ZEMP_LISTSet', (req) => s4.run(req.query));

  srv.on('CREATE', 'ZEMP_LISTSet', (req) =>
    s4.tx(req).send({
      method: 'POST',
      path: '/ZEMP_LISTSet',
      headers: {
        'X-Requested-With': 'XMLHttpRequest'
      },
      data: req.data
    })
  );
};