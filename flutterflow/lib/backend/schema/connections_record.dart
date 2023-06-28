import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnectionsRecord extends FirestoreRecord {
  ConnectionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _created = snapshotData['created'] as DateTime?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('connections');

  static Stream<ConnectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConnectionsRecord.fromSnapshot(s));

  static Future<ConnectionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConnectionsRecord.fromSnapshot(s));

  static ConnectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConnectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConnectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConnectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConnectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConnectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConnectionsRecordData({
  DateTime? created,
  DocumentReference? sender,
  DocumentReference? receiver,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created': created,
      'sender': sender,
      'receiver': receiver,
      'message': message,
    }.withoutNulls,
  );

  return firestoreData;
}
