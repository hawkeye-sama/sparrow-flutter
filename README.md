# Sneakers Shop App with Flutter (iOS and Android)

This is a Sneaker app built with Flutter for both iOS and Android platforms.

## How to Start

1. Check that you have Flutter version 3.7 or above installed on your system.
2. Clone this repository.
3. Run `flutter run` to start the app on your connected device or emulator.

## Tested On

- iOS Simulator 14 Pro Max
- Android Simulator Pixel 5

## Installing Flutter

If you don't have Flutter installed, follow these steps:

1. Visit the official Flutter installation guide at [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install) and select the operating system you're using.
2. Follow the instructions on the page to download and install Flutter.
3. Set up your preferred IDE. We recommend using Android Studio or Visual Studio Code.
4. Run `flutter doctor` to check if there are any dependencies you need to install.

## Running the iOS Simulator

1. Open Xcode on your Mac.
2. In Xcode, go to Preferences > Locations > Command Line Tools, and select the latest version of Xcode.
3. Open Terminal and run `open -a Simulator` to launch the iOS Simulator.
4. In the iOS Simulator, go to Hardware > Device and select a device.
5. Run `flutter run` in the terminal to run the app on the selected device.

## Running the Android Emulator

1. Open Android Studio and select Configure > AVD Manager.
2. Click Create Virtual Device, and follow the instructions to create a new emulator.
3. Click Start on the emulator you want to use.
4. Run `flutter run` in the terminal to run the app on the selected emulator.

## Building the iOS App

1. Open Xcode on your Mac.
2. Open the `Runner.xcworkspace` file in the `ios` folder of your project.
3. In Xcode, go to Product > Scheme > Edit Scheme.
4. Select the `Runner` scheme and select the `Release` build configuration.
5. Go to Product > Archive to build the app.
6. Once the build is complete, go to Window > Organizer to distribute the app.

## Building the Android App

1. Run `flutter build apk` in the terminal to build the app bundle.
2. The app bundle will be located in the `build/app/outputs/flutter-apk` folder of your project.
3. Alternatively, you can run `flutter build appbundle` to build the app bundle.
