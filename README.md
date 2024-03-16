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
