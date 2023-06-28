import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for WebNav component.
  late WebNavModel webNavModel;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  CheckoutSessionsRecord? docRef;
  // Stores action output result for [Custom Action - getDoc] action in Container widget.
  CheckoutSessionsRecord? checkoutSessionRef;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
