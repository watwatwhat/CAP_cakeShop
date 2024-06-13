sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'cakeshopapp.cakeshopapp',
            componentId: 'OrderObjectPage',
            contextPath: '/Cake/orders'
        },
        CustomPageDefinitions
    );
});