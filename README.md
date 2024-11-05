# Munch

The Nearby Food Finder app aims to enhance developer engagement during the upcoming hackathon by providing a quick, convenient way to locate nearby pizza and juice options. The app will use an API like Yelp to fetch real-time information about restaurants or cafes within proximity to the MSA office that serve these items. By streamlining the search for essential snacks and beverages, the app will help ensure participants remain energized and focused throughout the event.

## Description

* Objectives
    - Ease of Use: A simple interface allowing users to quickly locate nearby pizza and juice options.
    - Using Raw Data, since yelp was having some issues and i could have made the backend as well, but considering time frame, i thought to solely go deep dive in the UI.
    - Real-Time Results: Provide up-to-date information about nearby places offering both pizza and juice.

* Features 
    - App Icon, which was generated from a text to Image AI, both as the icon and as the splash-screen.
    - The same app icon, which i have used in the Loading Effect with rotations.
    - Snackbars which adds up to the UI with friendly notificiations.
    - State-Management using MVVM-architecture.
    - Using View Model to handle all the food fetching and searching and checkout operations.
    - Keeping Seperate View Folder for only the App frontend screens.
    - Keeping helper files.
    - Test directory which contains both :- View_Model tests and UI_Tests.

## Getting Started

### Dependencies

* Refer to the pubspec.yaml file in the root directory for understanding the different uses of the application.

### Installing

* Before making a build, run these 3 commands in sequence, one after the other :- 
    - flutter clean , to clean any previous debug-or-release builds.
    - flutter pub get , to get the dependencies needed to run the app.
    - flutter build apk --release, to get the release unsigned apk.

    On completion of the last process, you can access the build from the build directory at the root level,
    build/app/outputs/releases/app-release.apk

    Install the apk and check out the application.

* For Debug-builds, you can clone this source-code and run it in your local machine, having installed, flutter_latest_version and a device-emulator to run the application,
    - once everything is ready, You can either run through a terminal command or go to debug and press F5 or press play-button, Wait for sometime and it will reflect the changes in the application in the emulator, Make sure you keep your emulator selected from the list of the adb-devices which pops up below.

## Authors

Contributors names and contact info. 
Debdaru Dasgupta, 
debdarudasgupta0799@gmail.com, 
+91 8787-588-495, 
India, 
https://github.com/Debdaru07

## Acknowledgments

Inspiration, code snippets, etc.
* [motiff](https://motiff.com/), for AI generated UX
* [ChatGPT](https://chatgpt.com/), for deeper insights in the code-level
* [pub-dev](https://pub.dev/), the official repo of Flutter
* [bgrem-ai](https://bgrem.ai/), for the images of the food xD