sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cakeshopapp/cakeshopapp/test/integration/FirstJourney',
		'cakeshopapp/cakeshopapp/test/integration/pages/CakeList',
		'cakeshopapp/cakeshopapp/test/integration/pages/CakeObjectPage',
		'cakeshopapp/cakeshopapp/test/integration/pages/OrderObjectPage'
    ],
    function(JourneyRunner, opaJourney, CakeList, CakeObjectPage, OrderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cakeshopapp/cakeshopapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCakeList: CakeList,
					onTheCakeObjectPage: CakeObjectPage,
					onTheOrderObjectPage: OrderObjectPage
                }
            },
            opaJourney.run
        );
    }
);