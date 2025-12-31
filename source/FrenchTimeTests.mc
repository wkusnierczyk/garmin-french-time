using Toybox.System;
using Toybox.Test;
using Toybox.WatchUi;

import Toybox.Lang;


const TEST_CASE_NAME_ID = "name";
const TEST_CASE_INPUT_ID = "input";
const TEST_CASE_EXPECTED_ID = "expected";


(:test)
module FrenchTimeTests {

    class MockClockTime {
        var hour;
        var min;
        var sec;
        function initialize(hour, minutes, seconds) {
            self.hour = hour; 
            self.min = minutes; 
            self.sec = seconds;
        }
    }

    function parseTimeString(time as String) {

        var hour = 0;
        var minutes = 0;
        var seconds = 0;

        var elements = StringUtils.split(time, ":");
        if (elements.size() == 3) {
            hour = elements[0].toNumber();
            minutes = elements[1].toNumber();
            seconds = elements[2].toNumber();
        }
        return new MockClockTime(hour, minutes, seconds);
    }

    (:test)
    function runDataDrivenTests(logger) {
        var testCases = WatchUi.loadResource(Rez.JsonData.UnitTests) as Array;
        var passed = true;

        for (var i = 0; i < testCases.size(); ++i) {
            var testCase = testCases[i] as Dictionary;
            var name = testCase[TEST_CASE_NAME_ID];
            var input = testCase[TEST_CASE_INPUT_ID];
            var expected = testCase[TEST_CASE_EXPECTED_ID];

            var mockTime = parseTimeString(input);

            var hour = FrenchTime.getDecimalHour(mockTime);
            var minutes = FrenchTime.getDecimalMinutes(mockTime);
            var seconds = FrenchTime.getDecimalSeconds(mockTime);

            var actual = hour + minutes + seconds;

            if (!actual.equals(expected)) {
                logger.error(Lang.format("FAIL [$1$]: Input $2$ -> Expected $3$, Got $4$", [
                    name, 
                    input, 
                    expected, 
                    actual
                ]));
                passed = false;
            } else {
                logger.debug(Lang.format("PASS [$1$]: $2$ -> $3$", [name, input, actual]));
            }
        }

        return passed;
    }
}