sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'spacefarer/test/integration/FirstJourney',
		'spacefarer/test/integration/pages/SpaceFarerList',
		'spacefarer/test/integration/pages/SpaceFarerObjectPage'
    ],
    function(JourneyRunner, opaJourney, SpaceFarerList, SpaceFarerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('spacefarer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSpaceFarerList: SpaceFarerList,
					onTheSpaceFarerObjectPage: SpaceFarerObjectPage
                }
            },
            opaJourney.run
        );
    }
);