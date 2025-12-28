const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { Customers, Products } = this.entities;   

    this.before('CREATE', Customers, req => {

        const { firstName, lastName, email, phoneNumber } = req.data;

        if (!firstName) req.error(400, 'First Name is required');
        if (!lastName) req.error(400, 'Last Name is required');


        const phonePattern = /^[0-9]{10}$/;
        if (phoneNumber && !phonePattern.test(phoneNumber)) {
            req.error(400, 'Phone number must be 10 digits');
        }
    });
    this.before('CREATE', Products, req => {

        const { price, stockQuantity } = req.data;

        if (price < 0) {
            req.error(400, 'Price cannot be negative');
        }

        if (stockQuantity < 0) {
            req.error(400, 'Stock Quantity cannot be negative');
        }
    });

});
