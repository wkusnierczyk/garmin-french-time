using Toybox.Application;
using Toybox.Graphics;


// Settings
const CUSTOMIZE_MENU_TITLE = Application.loadResource(Rez.Strings.SettingsMenuTitle);

const STANDARD_TIME_LABEL = Application.loadResource(Rez.Strings.ShowStandardTimeMenuTitle);
const STANDARD_TIME_PROPERTY = "ShowStandardTime";
const STANDARD_TIME_DEFAULT = false;

const FRENCH_FLAG_COLORS_LABEL = Application.loadResource(Rez.Strings.UseFrenchFlagColorsMenuTitle);
const FRENCH_FLAG_COLORS_PROPERTY = "UseFrenchFlagColors";
const FRENCH_FLAG_COLORS_DEFAULT = false;


// Colors
const FRENCH_BLUE_COLOR = 0x0000D5;
const FRENCH_WHITE_COLOR = 0xFFFFFF;
const FRENCH_RED_COLOR = 0xE1000F;

const HOURS_COLOR = Graphics.COLOR_WHITE;
const MINUTES_COLOR = Graphics.COLOR_LT_GRAY;
const SECONDS_COLOR = Graphics.COLOR_DK_GRAY;
const STANDARD_TIME_COLOR = Graphics.COLOR_DK_GRAY;
