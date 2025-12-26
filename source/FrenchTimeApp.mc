using Toybox.Application;
using Toybox.WatchUi;

class FrenchTimeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new FrenchTimeView() ];
    }

    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function getSettingsView() {
        return [ new FrenchTimeSettingsMenu(), new FrenchTimeSettingsDelegate() ];
    }

}