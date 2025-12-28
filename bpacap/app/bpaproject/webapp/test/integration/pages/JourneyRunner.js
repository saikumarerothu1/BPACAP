sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bpaproject/test/integration/pages/purchaseorderList",
	"bpaproject/test/integration/pages/purchaseorderObjectPage"
], function (JourneyRunner, purchaseorderList, purchaseorderObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bpaproject') + '/test/flp.html#app-preview',
        pages: {
			onThepurchaseorderList: purchaseorderList,
			onThepurchaseorderObjectPage: purchaseorderObjectPage
        },
        async: true
    });

    return runner;
});

