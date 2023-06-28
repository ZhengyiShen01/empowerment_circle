import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "userRole" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "userBio" field.
  String? _userBio;
  String get userBio => _userBio ?? '';
  bool hasUserBio() => _userBio != null;

  // "tasks" field.
  List<DocumentReference>? _tasks;
  List<DocumentReference> get tasks => _tasks ?? const [];
  bool hasTasks() => _tasks != null;

  // "OrgRef" field.
  DocumentReference? _orgRef;
  DocumentReference? get orgRef => _orgRef;
  bool hasOrgRef() => _orgRef != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "stripeId" field.
  String? _stripeId;
  String get stripeId => _stripeId ?? '';
  bool hasStripeId() => _stripeId != null;

  // "stripeLink" field.
  String? _stripeLink;
  String get stripeLink => _stripeLink ?? '';
  bool hasStripeLink() => _stripeLink != null;

  // "connections" field.
  DocumentReference? _connections;
  DocumentReference? get connections => _connections;
  bool hasConnections() => _connections != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _status = snapshotData['status'] as String?;
    _userRole = snapshotData['userRole'] as String?;
    _userBio = snapshotData['userBio'] as String?;
    _tasks = getDataList(snapshotData['tasks']);
    _orgRef = snapshotData['OrgRef'] as DocumentReference?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _stripeId = snapshotData['stripeId'] as String?;
    _stripeLink = snapshotData['stripeLink'] as String?;
    _connections = snapshotData['connections'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'phone_number': snapshot.data['phone_number'],
          'status': snapshot.data['status'],
          'userRole': snapshot.data['userRole'],
          'userBio': snapshot.data['userBio'],
          'tasks': safeGet(
            () => snapshot.data['tasks'].map((s) => toRef(s)).toList(),
          ),
          'OrgRef': safeGet(
            () => toRef(snapshot.data['OrgRef']),
          ),
          'isAdmin': snapshot.data['isAdmin'],
          'stripeId': snapshot.data['stripeId'],
          'stripeLink': snapshot.data['stripeLink'],
          'connections': safeGet(
            () => toRef(snapshot.data['connections']),
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? status,
  String? userRole,
  String? userBio,
  DocumentReference? orgRef,
  bool? isAdmin,
  String? stripeId,
  String? stripeLink,
  DocumentReference? connections,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'status': status,
      'userRole': userRole,
      'userBio': userBio,
      'OrgRef': orgRef,
      'isAdmin': isAdmin,
      'stripeId': stripeId,
      'stripeLink': stripeLink,
      'connections': connections,
    }.withoutNulls,
  );

  return firestoreData;
}
