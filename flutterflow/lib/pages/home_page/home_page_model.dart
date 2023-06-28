import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_nav/drawer_nav_widget.dart';
import '/components/empty_states/empty_projects/empty_projects_widget.dart';
import '/components/notification_trigger/notification_trigger_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/components/wish_card/wish_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/create/create_project_modal/create_project_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for WebNav component.
  late WebNavModel webNavModel;
  // Model for userCard component.
  late UserCardModel userCardModel;
  // Model for notification_Trigger component.
  late NotificationTriggerModel notificationTriggerModel;
  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
    userCardModel = createModel(context, () => UserCardModel());
    notificationTriggerModel =
        createModel(context, () => NotificationTriggerModel());
    drawerNavModel = createModel(context, () => DrawerNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    userCardModel.dispose();
    notificationTriggerModel.dispose();
    drawerNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
