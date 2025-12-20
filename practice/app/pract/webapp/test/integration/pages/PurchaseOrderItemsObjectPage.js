sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'pract',
            componentId: 'PurchaseOrderItemsObjectPage',
            contextPath: '/PurchaseOrder/to_poitems'
        },
        CustomPageDefinitions
    );
});