using Toybox.Application.Properties;
using Toybox.WatchUi;


class FrenchTimeSettingsMenu extends WatchUi.Menu2 {

    function initialize() {

        Menu2.initialize({:title=>CUSTOMIZE_MENU_TITLE});
        
        var standardTimeEnabled = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_DEFAULT);
        addItem(new WatchUi.ToggleMenuItem(
            STANDARD_TIME_LABEL, 
            null, 
            STANDARD_TIME_PROPERTY, 
            standardTimeEnabled, 
            null
        ));

        var frenchFlagColorsEnabled = PropertyUtils.getPropertyElseDefault(FRENCH_FLAG_COLORS_PROPERTY, FRENCH_FLAG_COLORS_DEFAULT);
        addItem(new WatchUi.ToggleMenuItem(
            FRENCH_FLAG_COLORS_LABEL, 
            null, 
            FRENCH_FLAG_COLORS_PROPERTY, 
            frenchFlagColorsEnabled, 
            null
        ));

    }

}

class FrenchTimeSettingsDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {

        var id = item.getId();
        
        if (id.equals(STANDARD_TIME_PROPERTY) && item instanceof WatchUi.ToggleMenuItem) {
            Properties.setValue(STANDARD_TIME_PROPERTY, item.isEnabled());
        }

        if (id.equals(FRENCH_FLAG_COLORS_PROPERTY) && item instanceof WatchUi.ToggleMenuItem) {
            Properties.setValue(FRENCH_FLAG_COLORS_PROPERTY, item.isEnabled());
        }

    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}