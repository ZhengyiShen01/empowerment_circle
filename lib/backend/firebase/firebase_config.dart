import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBz9YQkUciDGrAUvNE6hNTNY7GN7KVZ8zQ",
            authDomain: "empowerment-circle.firebaseapp.com",
            projectId: "empowerment-circle",
            storageBucket: "empowerment-circle.appspot.com",
            messagingSenderId: "450737453296",
            appId: "1:450737453296:web:363bddfcc743f1ddc46a35",
            measurementId: "G-F26KDZ9P5B"));
  } else {
    await Firebase.initializeApp();
  }
}
