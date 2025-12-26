# Garmin French Time

A minimalist, elegant, typography-focused Garmin Connect IQ watch face that displays the current time as French Revolutionary time.

![French time](resources/graphics/french.png)
![French time](resources/graphics/french-standard.png)
![French time](resources/graphics/french-color.png)

## Contents

* [French Revolutionary time](#french-revolutionary-time)
* [Project structure](#project-structure)
* [Build, test, deploy](#build-test-deploy)

## French Revolutionary time

[French Revolutionary Time](https://en.wikipedia.org/wiki/Decimal_time) (also known as _Decimal time_) represents the time of day using units which are decimally related.
The day is divided into **10 decimal hours**, each decimal hour into **100 decimal minutes** and each decimal minute into 100 decimal seconds.

The Garmin French Time watch face displays the time as `decimal hours` `decimal minutes` `decimal seconds` (separated by space, distinguished by font weight and color).
Optionally, the user may turn on standard time, displayed in smaller font below the decimal time, using on-watch customization settings.

The watch face uses custom fonts.
The font presented here is [Ubuntu](https://fonts.google.com/specimen/Ubuntu), available from [Google Fonts](https://fonts.google.com/) as a True Type font (`ttf`).
It has been converted to a bitmap font (`bmp`, `fnt`) using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
The hours, minutes, and seconds are displayed with Ubuntu Bold, Medium, and Regular, respectively, size 70 pixels.

The watch face provides an option to display the hour, minutes, and seconds using the French flag colors.
Note that for better readability, the color blue used here is somewhat bighter than the official color (Pantone A 503; RGB used `0000D5` vs official `000091`), while the colors white (Pantone A 665) and red (Pantone  A 805) are as the official colors (RGB `FFFFFF` and `E1000F`, respectively). 

## Project structure

```bash
FrenchTime
├── LICENSE                        # MIT license
├── Makefile                       # Convenience makefile
├── manifest.xml
├── monkey.jungle
├── README.md
├── resources
│   ├── drawables
│   │   ├── drawables.xml
│   │   └── launcher_icon.svg
│   ├── fonts
│   │   ├── fonts.xml              # Font map 
│   │   ├── [ttf, fnt, png fonts]  # Source (ttf) and converted (fnt, png) fonts
│   │   └── UFL.txt                # Ubuntu font license
│   ├── layouts
│   │   └── layout.xml
│   └── strings
│       └── strings.xml
└── source
    ├── FrenchTime.mc
    ├── FrenchTimeApp.mc
    └── FrenchTimeView.mc
```

## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests
make test

# run the simulation
make run
```

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
