import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvitationModalModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<UsersRecord> assignUsers = [];
  void addToAssignUsers(UsersRecord item) => assignUsers.add(item);
  void removeFromAssignUsers(UsersRecord item) => assignUsers.remove(item);
  void removeAtIndexFromAssignUsers(int index) => assignUsers.removeAt(index);
  void updateAssignUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      assignUsers[index] = updateFn(assignUsers[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
