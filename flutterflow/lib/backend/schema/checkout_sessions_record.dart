import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutSessionsRecord extends FirestoreRecord {
  CheckoutSessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "success_url" field.
  String? _successUrl;
  String get successUrl => _successUrl ?? '';
  bool hasSuccessUrl() => _successUrl != null;

  // "concel_url" field.
  String? _concelUrl;
  String get concelUrl => _concelUrl ?? '';
  bool hasConcelUrl() => _concelUrl != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "client" field.
  String? _client;
  String get client => _client ?? '';
  bool hasClient() => _client != null;

  // "sessionId" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  bool hasSessionId() => _sessionId != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _price = snapshotData['price'] as String?;
    _successUrl = snapshotData['success_url'] as String?;
    _concelUrl = snapshotData['concel_url'] as String?;
    _created = snapshotData['created'] as DateTime?;
    _mode = snapshotData['mode'] as String?;
    _client = snapshotData['client'] as String?;
    _sessionId = snapshotData['sessionId'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('checkout_sessions')
          : FirebaseFirestore.instance.collectionGroup('checkout_sessions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('checkout_sessions').doc();

  static Stream<CheckoutSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckoutSessionsRecord.fromSnapshot(s));

  static Future<CheckoutSessionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CheckoutSessionsRecord.fromSnapshot(s));

  static CheckoutSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckoutSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckoutSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckoutSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckoutSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckoutSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckoutSessionsRecordData({
  String? price,
  String? successUrl,
  String? concelUrl,
  DateTime? created,
  String? mode,
  String? client,
  String? sessionId,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'success_url': successUrl,
      'concel_url': concelUrl,
      'created': created,
      'mode': mode,
      'client': client,
      'sessionId': sessionId,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}
