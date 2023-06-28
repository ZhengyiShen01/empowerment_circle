import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_nav/drawer_nav_widget.dart';
import '/components/empty_states/completed_tasks/completed_tasks_widget.dart';
import '/components/empty_states/empty_tasks/empty_tasks_widget.dart';
import '/components/notification_trigger/notification_trigger_widget.dart';
import '/components/task_component/task_component_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create/create_project_modal/create_project_modal_widget.dart';
import '/pages/details/task_details_modal/task_details_modal_widget.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChallengePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;
  // Model for WebNav component.
  late WebNavModel webNavModel;
  // Model for userCard component.
  late UserCardModel userCardModel;
  // Model for notification_Trigger component.
  late NotificationTriggerModel notificationTriggerModel;
  Completer<List<AllTasksRecord>>? firestoreRequestCompleter3;
  Completer<List<AllTasksRecord>>? firestoreRequestCompleter4;
  Completer<List<AllTasksRecord>>? firestoreRequestCompleter2;
  Completer<List<AllTasksRecord>>? firestoreRequestCompleter1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerNavModel = createModel(context, () => DrawerNavModel());
    webNavModel = createModel(context, () => WebNavModel());
    userCardModel = createModel(context, () => UserCardModel());
    notificationTriggerModel =
        createModel(context, () => NotificationTriggerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerNavModel.dispose();
    webNavModel.dispose();
    userCardModel.dispose();
    notificationTriggerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
