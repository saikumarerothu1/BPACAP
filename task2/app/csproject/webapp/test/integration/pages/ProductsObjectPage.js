sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.ust.csproject',
            componentId: 'ProductsObjectPage',
            contextPath: '/Customers/products'
        },
        CustomPageDefinitions
    );
});