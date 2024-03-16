import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoriesRecord {
  final String title;
  final List<DocumentReference> involvedBy;
  final DocumentReference reference;

  StoriesRecord({
    required this.title,
    required this.involvedBy,
    required this.reference,
  });
}

Future<StoriesRecord?> getStoryRecord(String docRef) async {
  final db = FirebaseFirestore.instance;

  // Add import data here.
  final currentUser = db.doc('users/o6N8MDCdo5dbXr1pogKuev9hfRN2');
  final storyDoc = await db.doc('stories/cE7BkMCrPcOqGGxnHVyh').get();
  final storyData = storyDoc.data();

  // Convert the list of Dynamic to a list of DocumentReference
  final convertedList = (storyData?['involved_by'] as List<dynamic>)
      .map((user) => db.doc(user.path))
      .toList();

  final story = StoriesRecord(
    title: storyData?['title'] ?? '',
    reference: storyDoc.reference,
    involvedBy: convertedList,
  );

  return story;
}

Future<List<String>?> addSharedStory(
    // DocumentReference currentUser,
    // StoriesRecord story,
    ) async {
  final db = FirebaseFirestore.instance;

  // Add import data here.
  final currentUser = db.doc('users/o6N8MDCdo5dbXr1pogKuev9hfRN2');
  final story = await getStoryRecord('stories/cE7BkMCrPcOqGGxnHVyh');
  // End of import data

  // Get the current user's contacts that are in the provided list
  final currentUserRef = db.doc(currentUser.path);
  final contactsQuery = currentUserRef.collection('contacts').where(
        'user_ref',
        whereIn: story?.involvedBy,
      );

  // Batch write story information into each shared stories
  final batchWrite = db.batch();
  final contactsSnapshot = await contactsQuery.get();
  for (final contactDoc in contactsSnapshot.docs) {
    print(contactDoc.data()?['display_name']);
    final sharedStoryRef = contactDoc.data()['story_ref'];
    try {
      final messageRef = sharedStoryRef.collection('messages').doc();

      // Set the message data with the provided story
      batchWrite.set(messageRef, {
        'content': story?.title,
        'story_ref': story?.reference,
      });
    } catch (e) {
      print(e);
      continue;
    }
  }
  await batchWrite.commit();

  // Return the display names of the contacts
  final displayNames = contactsSnapshot.docs
      .map((doc) => doc['display_name'] as String)
      .toList();
  return displayNames;
}

Future<List<String>> getUsernames() async {
  final db = FirebaseFirestore.instance;
  final snapshot = await db.collection('users').get();
  final usernames =
      snapshot.docs.map((doc) => doc['display_name'] as String).toList();
  return usernames;
}

final testFunction = addSharedStory; // Assign the function for testing

// ADD YOUR CUSTOM FUNCTION CODE ABOVE.
// DO NOT REMOVE OR MODIFY THE CODE BELOW!

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Test',
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
        title: Text('Custom Function'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed:
                _fetchData, // Update state to trigger rebuild with new data
            child: Text('Test'),
          ),
          Expanded(
            child: itemsToDisplay == null // Check if data is fetched
                ? Center(
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
