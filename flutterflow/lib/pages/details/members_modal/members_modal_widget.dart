import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_states/empty_members/empty_members_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'members_modal_model.dart';
export 'members_modal_model.dart';

class MembersModalWidget extends StatefulWidget {
  const MembersModalWidget({
    Key? key,
    this.projectRef,
  }) : super(key: key);

  final ProjectsRecord? projectRef;

  @override
  _MembersModalWidgetState createState() => _MembersModalWidgetState();
}

class _MembersModalWidgetState extends State<MembersModalWidget> {
  late MembersModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembersModalModel());

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 6.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).overlay,
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 800.0,
            constraints: BoxConstraints(
              maxWidth: 930.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'MEMBERS_MODAL_arrow_back_rounded_ICN_ON_');
                            logFirebaseEvent('IconButton_bottom_sheet');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 24.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'qgce8yzt' /* Contributors */,
                          ),
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 44.0),
                          child: Builder(
                            builder: (context) {
                              final members = widget.projectRef!.usersAssigned
                                  .map((e) => e)
                                  .toList();
                              if (members.isEmpty) {
                                return Center(
                                  child: Container(
                                    height: 300.0,
                                    child: EmptyMembersWidget(
                                      title: 'No Search Results',
                                      bodyText:
                                          'Find users by searching above.',
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: members.length,
                                itemBuilder: (context, membersIndex) {
                                  final membersItem = members[membersIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 8.0),
                                    child: FutureBuilder<UsersRecord>(
                                      future: UsersRecord.getDocumentOnce(
                                          membersItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final membersUsersRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MEMBERS_MODAL_COMP_members_ON_TAP');
                                            logFirebaseEvent(
                                                'members_navigate_to');

                                            context.pushNamed(
                                              'teamMemberDetails',
                                              queryParameters: {
                                                'userRef': serializeParam(
                                                  membersUsersRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'userRef': membersUsersRecord,
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x32000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            26.0),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          membersUsersRecord
                                                              .photoUrl,
                                                      width: 36.0,
                                                      height: 36.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            membersUsersRecord
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  membersUsersRecord
                                                                      .email,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MEMBERS_MODAL_COMP_CONNECT_BTN_ON_TAP');
                                                      // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                                      // createActivity
                                                      logFirebaseEvent(
                                                          'Button_createActivity');

                                                      var activityRecordReference =
                                                          ActivityRecord
                                                              .collection
                                                              .doc();
                                                      await activityRecordReference
                                                          .set({
                                                        ...createActivityRecordData(
                                                          activityName:
                                                              'Connection Invitation',
                                                          activityTime:
                                                              getCurrentTimestamp,
                                                          activityType: widget
                                                              .projectRef!
                                                              .projectName,
                                                          projectRef: widget
                                                              .projectRef!
                                                              .reference,
                                                          otherUser:
                                                              currentUserReference,
                                                          activitySubText:
                                                              '${currentUserDisplayName} has invited you to connect',
                                                          isInvitation: true,
                                                        ),
                                                        'targetUserRef': [
                                                          membersUsersRecord
                                                              .reference
                                                        ],
                                                        'unreadByUser': widget
                                                            .projectRef!
                                                            .usersAssigned,
                                                      });
                                                      _model.newActivity =
                                                          ActivityRecord
                                                              .getDocumentFromData({
                                                        ...createActivityRecordData(
                                                          activityName:
                                                              'Connection Invitation',
                                                          activityTime:
                                                              getCurrentTimestamp,
                                                          activityType: widget
                                                              .projectRef!
                                                              .projectName,
                                                          projectRef: widget
                                                              .projectRef!
                                                              .reference,
                                                          otherUser:
                                                              currentUserReference,
                                                          activitySubText:
                                                              '${currentUserDisplayName} has invited you to connect',
                                                          isInvitation: true,
                                                        ),
                                                        'targetUserRef': [
                                                          membersUsersRecord
                                                              .reference
                                                        ],
                                                        'unreadByUser': widget
                                                            .projectRef!
                                                            .usersAssigned,
                                                      }, activityRecordReference);
                                                      logFirebaseEvent(
                                                          'Button_bottom_sheet');
                                                      Navigator.pop(context);
                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Your invitation have been sent!',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                      );

                                                      setState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'c69xi1a4' /* Connect */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 80.0,
                                                      height: 36.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
