import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create/create_task_modal/create_task_modal_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProjectModalModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<UsersRecord> assignUsers = [];
  void addToAssignUsers(UsersRecord item) => assignUsers.add(item);
  void removeFromAssignUsers(UsersRecord item) => assignUsers.remove(item);
  void removeAtIndexFromAssignUsers(int index) => assignUsers.removeAt(index);
  void updateAssignUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      assignUsers[index] = updateFn(assignUsers[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  TextEditingController? projectNameController;
  String? Function(BuildContext, String?)? projectNameControllerValidator;
  String? _projectNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zzv8enkj' /* Please enter a project name. */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e68qg04m' /* Please enter a short descripti... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProjectsRecord? createdProject;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    projectNameControllerValidator = _projectNameControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
  }

  void dispose() {
    projectNameController?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
