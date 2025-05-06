# Yadanabon University Flutter App

A Flutter application that displays the Yadanabon University website (https://www.ydnbu-mailbox.work.gd/) in a native app.

## Features

- Cross-platform Flutter implementation
- Device preview for responsive design testing
- Automatic CI/CD with GitHub Actions
- Web and Android builds

## Requirements

- Flutter 3.19.0 or higher
- Android Studio
- Dart SDK 3.7.2 or higher

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/uni_world.git
```

2. Open the project in Android Studio:
```bash
cd uni_world
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Development

The app is built using Flutter and includes device preview for testing different screen sizes. The main components are:

- `lib/main.dart`: Main app entry point with device preview configuration
- `lib/screens/`: Contains the app screens
- `lib/widgets/`: Contains reusable widgets

## CI/CD

The project uses GitHub Actions for continuous integration and deployment. The workflow:

1. Sets up Flutter environment
2. Installs dependencies
3. Verifies code formatting
4. Runs analysis and tests
5. Builds APK and Web versions
6. Uploads APK as an artifact

## Device Preview

The app includes device preview functionality that allows you to:
- Test different device sizes
- Change orientation
- Test different locales
- Toggle dark mode
- And more

To use device preview, run the app in debug mode and use the device preview toolbar.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
