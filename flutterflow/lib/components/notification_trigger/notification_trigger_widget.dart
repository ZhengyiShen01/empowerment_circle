import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/details/notifications_modal/notifications_modal_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_trigger_model.dart';
export 'notification_trigger_model.dart';

class NotificationTriggerWidget extends StatefulWidget {
  const NotificationTriggerWidget({Key? key}) : super(key: key);

  @override
  _NotificationTriggerWidgetState createState() =>
      _NotificationTriggerWidgetState();
}

class _NotificationTriggerWidgetState extends State<NotificationTriggerWidget> {
  late NotificationTriggerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationTriggerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryActivityRecordCount(
        queryBuilder: (activityRecord) => activityRecord
            .where('unreadByUser', arrayContains: currentUserReference)
            .where('otherUser', isNotEqualTo: currentUserReference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        int badgeCount = snapshot.data!;
        return badges.Badge(
          badgeContent: Text(
            badgeCount.toString(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: Colors.white,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          showBadge: true,
          shape: badges.BadgeShape.circle,
          badgeColor: FlutterFlowTheme.of(context).tertiary,
          elevation: 4.0,
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          position: badges.BadgePosition.topEnd(),
          animationType: badges.BadgeAnimationType.scale,
          toAnimate: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('NOTIFICATION_TRIGGER_Stack_7p4pgcv5_ON_T');
              logFirebaseEvent('Stack_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: double.infinity,
                      child: NotificationsModalWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            child: Stack(
              children: [
                if (badgeCount == 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Icon(
                      Icons.notifications_none,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                if (badgeCount >= 1)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Icon(
                      Icons.notifications,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
