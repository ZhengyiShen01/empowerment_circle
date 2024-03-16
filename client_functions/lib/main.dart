import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './firebase_options.dart';

// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
// ADD YOUR CUSTOM IMPORTS HERE
import 'get_usernames.dart';
import 'add_shared_story.dart';

const testFunction = getUsernames; // Add your custom function here.
// ADD YOUR CUSTOM FUNCTION CODE ABOVE.
// DO NOT REMOVE OR MODIFY THE CODE BELOW!

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Firebase Test',
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String>? itemsToDisplay;

  @override
  void initState() {
    super.initState();
    _signInAnonymously();
    _getCurrentUser();
  }

  Future<void> _signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      print('Error signing in anonymously: $e');
    }
  }

  Future<void> _getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      print('Signed in as: ${user.uid}');
    } else {
      print('User is currently signed out');
    }
  }

  Future<void> _fetchData() async {
    itemsToDisplay = await testFunction();
    setState(() {}); // Update state to trigger rebuild with new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Function'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed:
                _fetchData, // Update state to trigger rebuild with new data
            child: const Text('Test'),
          ),
          Expanded(
            child: itemsToDisplay == null // Check if data is fetched
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: itemsToDisplay!.length,
                    itemBuilder: (context, index) {
                      final name = itemsToDisplay![index];
                      return ListTile(
                        title: Text(name),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
