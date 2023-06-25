import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllTasksRecord extends FirestoreRecord {
  AllTasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taskName" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "projectRef" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  bool hasProjectRef() => _projectRef != null;

  // "completedAt" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  void _initializeFields() {
    _taskName = snapshotData['taskName'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _members = getDataList(snapshotData['members']);
    _description = snapshotData['description'] as String?;
    _completed = snapshotData['completed'] as bool?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _projectRef = snapshotData['projectRef'] as DocumentReference?;
    _completedAt = snapshotData['completedAt'] as DateTime?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allTasks');

  static Stream<AllTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllTasksRecord.fromSnapshot(s));

  static Future<AllTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllTasksRecord.fromSnapshot(s));

  static AllTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllTasksRecordData({
  String? taskName,
  DateTime? dueDate,
  String? description,
  bool? completed,
  DocumentReference? owner,
  String? status,
  DocumentReference? projectRef,
  DateTime? completedAt,
  DateTime? timeCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taskName': taskName,
      'dueDate': dueDate,
      'description': description,
      'completed': completed,
      'owner': owner,
      'status': status,
      'projectRef': projectRef,
      'completedAt': completedAt,
      'timeCreated': timeCreated,
    }.withoutNulls,
  );

  return firestoreData;
}
