sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/ust/poproject/test/integration/pages/POHeadersList",
	"com/ust/poproject/test/integration/pages/POHeadersObjectPage",
	"com/ust/poproject/test/integration/pages/POItemsObjectPage"
], function (JourneyRunner, POHeadersList, POHeadersObjectPage, POItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/ust/poproject') + '/test/flp.html#app-preview',
        pages: {
			onThePOHeadersList: POHeadersList,
			onThePOHeadersObjectPage: POHeadersObjectPage,
			onThePOItemsObjectPage: POItemsObjectPage
        },
        async: true
    });

    return runner;
});

