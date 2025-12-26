using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Application.Properties;


class FrenchTimeView extends WatchUi.WatchFace {

    private var hoursFont = WatchUi.loadResource(Rez.Fonts.HoursFont);
    private var minutesFont = WatchUi.loadResource(Rez.Fonts.MinutesFont);
    private var secondsFont = WatchUi.loadResource(Rez.Fonts.SecondsFont);
    private var standardTimeFont = WatchUi.loadResource(Rez.Fonts.StandardTimeFont);

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var clockTime = System.getClockTime();
        var hour = FrenchTime.getDecimalHours(clockTime);
        var minutes = FrenchTime.getDecimalMinutes(clockTime);
        var seconds = FrenchTime.getDecimalSeconds(clockTime);

        // For debugging only: widest possible values
        // hour = "8";
        // minutes = "88";
        // seconds = "88";

        var width = dc.getWidth();
        var height = dc.getHeight();
        var hourWidth = dc.getTextWidthInPixels(hour, hoursFont);
        var minutesWidth = dc.getTextWidthInPixels(minutes, minutesFont);
        var secondsWidth = dc.getTextWidthInPixels(seconds, secondsFont);
        var totalWidth = hourWidth + minutesWidth + secondsWidth;

        var currentX = (width - totalWidth) / 2;
        var centerY = height / 2;

        var frenchFlagColorsEnabled = PropertyUtils.getPropertyElseDefault(FRENCH_FLAG_COLORS_PROPERTY, FRENCH_FLAG_COLORS_DEFAULT);
        var hourFontColor = frenchFlagColorsEnabled ? FRENCH_BLUE_COLOR : HOURS_COLOR;
        var minutesFontColor = frenchFlagColorsEnabled ? FRENCH_WHITE_COLOR : MINUTES_COLOR;
        var secondsFontColor = frenchFlagColorsEnabled ? FRENCH_RED_COLOR : SECONDS_COLOR;


        dc.setColor(hourFontColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, hoursFont, hour, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        currentX += hourWidth;

        dc.setColor(minutesFontColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, minutesFont, minutes, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        currentX += minutesWidth;

        dc.setColor(secondsFontColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(currentX, centerY, secondsFont, seconds, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        
        _drawStandardTime(dc, hour, minutes, seconds);

    }

    private function _drawStandardTime(dc, hour, minutes, seconds) {

        var width = dc.getWidth();
        var height = dc.getHeight();

        var showStandardTime = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_DEFAULT);
        if (showStandardTime) {
            var standardTime = Lang.format("$1$:$2$:$3$", [
                hour.format("%d"),
                minutes.format("%02d"),
                seconds.format("%02d")
            ]);
            dc.setColor(STANDARD_TIME_COLOR, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                width / 2, 
                (height / 2) + 40, 
                standardTimeFont,
                standardTime, 
                Graphics.TEXT_JUSTIFY_CENTER
            );
        }

    }

}
