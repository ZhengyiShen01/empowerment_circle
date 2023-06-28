import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "activityName" field.
  String? _activityName;
  String get activityName => _activityName ?? '';
  bool hasActivityName() => _activityName != null;

  // "activityTime" field.
  DateTime? _activityTime;
  DateTime? get activityTime => _activityTime;
  bool hasActivityTime() => _activityTime != null;

  // "activityDescription" field.
  String? _activityDescription;
  String get activityDescription => _activityDescription ?? '';
  bool hasActivityDescription() => _activityDescription != null;

  // "activityType" field.
  String? _activityType;
  String get activityType => _activityType ?? '';
  bool hasActivityType() => _activityType != null;

  // "projectRef" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  bool hasProjectRef() => _projectRef != null;

  // "otherUser" field.
  DocumentReference? _otherUser;
  DocumentReference? get otherUser => _otherUser;
  bool hasOtherUser() => _otherUser != null;

  // "readState" field.
  bool? _readState;
  bool get readState => _readState ?? false;
  bool hasReadState() => _readState != null;

  // "activitySubText" field.
  String? _activitySubText;
  String get activitySubText => _activitySubText ?? '';
  bool hasActivitySubText() => _activitySubText != null;

  // "taskRef" field.
  DocumentReference? _taskRef;
  DocumentReference? get taskRef => _taskRef;
  bool hasTaskRef() => _taskRef != null;

  // "targetUserRef" field.
  List<DocumentReference>? _targetUserRef;
  List<DocumentReference> get targetUserRef => _targetUserRef ?? const [];
  bool hasTargetUserRef() => _targetUserRef != null;

  // "unreadByUser" field.
  List<DocumentReference>? _unreadByUser;
  List<DocumentReference> get unreadByUser => _unreadByUser ?? const [];
  bool hasUnreadByUser() => _unreadByUser != null;

  // "isInvitation" field.
  bool? _isInvitation;
  bool get isInvitation => _isInvitation ?? false;
  bool hasIsInvitation() => _isInvitation != null;

  void _initializeFields() {
    _activityName = snapshotData['activityName'] as String?;
    _activityTime = snapshotData['activityTime'] as DateTime?;
    _activityDescription = snapshotData['activityDescription'] as String?;
    _activityType = snapshotData['activityType'] as String?;
    _projectRef = snapshotData['projectRef'] as DocumentReference?;
    _otherUser = snapshotData['otherUser'] as DocumentReference?;
    _readState = snapshotData['readState'] as bool?;
    _activitySubText = snapshotData['activitySubText'] as String?;
    _taskRef = snapshotData['taskRef'] as DocumentReference?;
    _targetUserRef = getDataList(snapshotData['targetUserRef']);
    _unreadByUser = getDataList(snapshotData['unreadByUser']);
    _isInvitation = snapshotData['isInvitation'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity');

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  String? activityName,
  DateTime? activityTime,
  String? activityDescription,
  String? activityType,
  DocumentReference? projectRef,
  DocumentReference? otherUser,
  bool? readState,
  String? activitySubText,
  DocumentReference? taskRef,
  bool? isInvitation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activityName': activityName,
      'activityTime': activityTime,
      'activityDescription': activityDescription,
      'activityType': activityType,
      'projectRef': projectRef,
      'otherUser': otherUser,
      'readState': readState,
      'activitySubText': activitySubText,
      'taskRef': taskRef,
      'isInvitation': isInvitation,
    }.withoutNulls,
  );

  return firestoreData;
}
