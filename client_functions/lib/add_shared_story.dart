import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    print(contactDoc.data()['display_name']);
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
