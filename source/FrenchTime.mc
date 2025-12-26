using Toybox.System;

import Toybox.Lang;


module FrenchTime {

    function getDecimalHours(clockTime as System.ClockTime) as String {
        var totalDecimalSeconds = _getTotalDecimalSeconds(clockTime);
        var decimalHours = (totalDecimalSeconds / 10000).toNumber();
        return decimalHours.format("%d");
    }

    function getDecimalMinutes(clockTime as System.ClockTime) as String {
        var totalDecimalSeconds = _getTotalDecimalSeconds(clockTime);
        var decimalMinutes = (totalDecimalSeconds.toNumber() % 10000) / 100;
        return decimalMinutes.format("%02d");
    }

    function getDecimalSeconds(clockTime as System.ClockTime) as String {
        var totalDecimalSeconds = _getTotalDecimalSeconds(clockTime);
        var decimalSeconds = (totalDecimalSeconds.toNumber() % 10000) % 100;
        return decimalSeconds.format("%02d");
    }

    function _getTotalDecimalSeconds(clockTime as System.ClockTime) as Double {
        var totalStandardSeconds = (clockTime.hour * 3600) + (clockTime.min * 60) + clockTime.sec;
        var totalDecimalSeconds = (totalStandardSeconds / (24.0d * 60.0d * 60.0d)) * 100000.0d;
        return totalDecimalSeconds;
    }

}