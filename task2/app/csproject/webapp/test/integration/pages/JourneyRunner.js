sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/ust/csproject/test/integration/pages/CustomersList",
	"com/ust/csproject/test/integration/pages/CustomersObjectPage",
	"com/ust/csproject/test/integration/pages/ProductsObjectPage"
], function (JourneyRunner, CustomersList, CustomersObjectPage, ProductsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/ust/csproject') + '/test/flp.html#app-preview',
        pages: {
			onTheCustomersList: CustomersList,
			onTheCustomersObjectPage: CustomersObjectPage,
			onTheProductsObjectPage: ProductsObjectPage
        },
        async: true
    });

    return runner;
});

