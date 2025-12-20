sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.ust.soproject',
            componentId: 'MaterialTableObjectPage',
            contextPath: '/MaterialTable'
        },
        CustomPageDefinitions
    );
});