sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"pract/test/integration/pages/PurchaseOrderList",
	"pract/test/integration/pages/PurchaseOrderObjectPage",
	"pract/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, PurchaseOrderList, PurchaseOrderObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('pract') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrderList: PurchaseOrderList,
			onThePurchaseOrderObjectPage: PurchaseOrderObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

