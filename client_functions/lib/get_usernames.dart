import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> getUsernames() async {
  final db = FirebaseFirestore.instance;
  final snapshot = await db.collection('users').get();
  final usernames =
      snapshot.docs.map((doc) => doc['display_name'] as String).toList();
  return usernames;
}
