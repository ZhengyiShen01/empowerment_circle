import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTaskModalModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for taskName widget.
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllTasksRecord? taskCreatedLast;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? taskActivityLast;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllTasksRecord? taskCreated;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? taskActivity;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    taskNameController?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
