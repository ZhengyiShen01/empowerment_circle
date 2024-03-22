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

in `ios/Podfile`

```ruby
target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))

  pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '10.22.0'  # Add this line
end
```

Change the version `10.22.0` based on the Firebase/Firestore version in the `ios/Podfile.lock`.

Then remove the `ios/Podfile.lock`.

## Fix the firebase initialization error in the exported FlutterFlow project

Add these two lines in the `lib/backend/firebase/firebase_config.dart`

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import '../../firebase_options.dart'; // add this line

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCFQMBb_QbX-BmM6ZPXC2j6jQhcx6I1svw",
            authDomain: "salt-8c0bb.firebaseapp.com",
            projectId: "salt-8c0bb",
            storageBucket: "salt-8c0bb.appspot.com",
            messagingSenderId: "998918621005",
            appId: "1:998918621005:web:f76bde45b0778cd6b0d904",
            measurementId: "G-XFWEHJR6PX"));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // add this line
    );
  }
}
```

The run following command to configure the Firebase project if you haven't done it yet.

```bash
flutterfire configure
```

An alternative way is to add the `value.xml` file under the path `android/app/src/main/res/values/values.xml` in the structure below.

```xml

<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_api_key" translatable="false">YOUR_GOOGLE_API_KEY</string>
    <string name="gcm_defaultSenderId" translatable="false">YOUR_SENDER_ID</string>
    <string name="google_app_id" translatable="false">YOUR_APP_ID</string>
    <string name="google_crash_reporting_api_key" translatable="false">YOUR_CRASH_REPORTING_API_KEY</string>
    <string name="google_storage_bucket" translatable="false">YOUR_STORAGE_BUCKET</string>
    <string name="project_id" translatable="false">YOUR_PROJECT_ID</string>
</resources>

```
