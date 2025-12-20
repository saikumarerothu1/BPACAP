sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/ust/soproject/test/integration/pages/MaterialTableList",
	"com/ust/soproject/test/integration/pages/MaterialTableObjectPage",
	"com/ust/soproject/test/integration/pages/SalesItemObjectPage"
], function (JourneyRunner, MaterialTableList, MaterialTableObjectPage, SalesItemObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/ust/soproject') + '/test/flp.html#app-preview',
        pages: {
			onTheMaterialTableList: MaterialTableList,
			onTheMaterialTableObjectPage: MaterialTableObjectPage,
			onTheSalesItemObjectPage: SalesItemObjectPage
        },
        async: true
    });

    return runner;
});

