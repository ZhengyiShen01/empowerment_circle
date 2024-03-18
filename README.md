# Debugging Template for FlutterFlow Project

## Setup Firebase

Install and login to Firebase CLI.

```bash
curl -sL https://firebase.tools | bash  # Install Firebase CLI
firebase login # Login to Firebase
firebase projects:list # List Firebase projects
```

Create a new Firebase project and initialize the code base.

```bash
firebase init # Initialize Firebase project and select Firestore, Functions, and Emulators
```

Install and login to GCloud CLI to duplicate the cloud data to local emulator.

```bash
# install gcloud from: https://cloud.google.com/sdk/docs/install
gcloud auth login # Login to GCloud
```

Run this [script](./functions/seed.bash) to sync the cloud data to local emulator.

In development, you can use this npm script to sync and load the data into your local emulator.

```bash
npm run seed # Seed the cloud data to local device
npm run emulator # Start the emulator with the seed data
npm run deploy # Deploy the cloud functions to the cloud
```

## Cloud Functions on Firebase (Node.js)

Jump to [**functions/index.js**](./functions/index.js) and start to code.

## Setup Flutter Project for Firebase

1. [Instruction: Start a new Flutter project on vscode](https://docs.flutter.dev/get-started/test-drive?tab=vscode)
2. [Instruction: Setup Firebase for Flutter](https://firebase.google.com/docs/flutter/setup?platform=ios)

```bash
dart pub global activate flutterfire_cli # Install FlutterFire CLI

flutter pub add firebase_core firebase_auth cloud_firestore # Add Firebase packages

flutterfire configure # Configure Firebase for Flutter
```

## Custom Functions on FlutterFlow Client Side (Dart)

Select the device to be `web` for quicker compilation.

For FlutterFlow developers, understanding the flutter project can be challenging and unnecessary. So I created this [**Flutter Template**](./client_functions/lib/main.dart) for you to develop your FlutterFlow custom actions right away.

Spend a few minutes going through the template and you can save yourself from waiting 5 minutes every time in the compilation process with a clearer debugging log.

## Debugging Flutter on Android

### Flutter Doctor Error

```bash
flutter doctor -v # Check the status of your Flutter project
✗ Unable to find bundled Java version.
```

Solution:

```bash
cd /Applications/Android\ Studio.app/Contents
sudo ln -s jbr jre
```

`android/app/build.gradle`:

```gradle
android {
    defaultConfig {
        // Other configurations...
        multiDexEnabled true  // Enable MultiDex
    }

    // Other configurations...

    dependencies {
    implementation 'com.android.support:multidex:1.0.3'  // Add MultiDex
    }
}
```

### Permission Error

Add these permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.READ_CONTACTS" />  // Add these permissions
    <uses-permission android:name="android.permission.WRITE_CONTACTS" />   // Add these permissions

    <application>
        <!-- Other configurations... -->
    </application>
</manifest>
```

User package `permission_handler` to request permissions.

Add dependencies in `pubspec.yaml`:

```yaml
dependencies:
  permission_handler: ^11.0.0
```

Wrap your code with the permission handler.

```dart
if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
}
```

## Slow Xcode Build

Firebase/Firestore is a heavy package and it takes a long time to compile.

[User Precompiled SDK](https://github.com/invertase/firestore-ios-sdk-frameworks#supported-firebase-ios-sdk-versions) to speed up the compilation process.
