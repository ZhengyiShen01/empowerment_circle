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
import 'create_note_model.dart';
export 'create_note_model.dart';

class CreateNoteWidget extends StatefulWidget {
  const CreateNoteWidget({
    Key? key,
    this.taskRef,
  }) : super(key: key);

  final AllTasksRecord? taskRef;

  @override
  _CreateNoteWidgetState createState() => _CreateNoteWidgetState();
}

class _CreateNoteWidgetState extends State<CreateNoteWidget> {
  late CreateNoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateNoteModel());

    _model.shortBioController ??= TextEditingController();
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
          sigmaX: 8.0,
          sigmaY: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).overlay,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 370.0,
                      constraints: BoxConstraints(
                        maxWidth: 570.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 4.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'i9im6f7s' /* Create Note */,
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'y8jieyz4' /* Create a note to keep your tea... */,
                                ),
                                style: FlutterFlowTheme.of(context).labelMedium,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.network(
                                        currentUserPhoto,
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.shortBioController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'sq20csss' /* Enter your note here... */,
                                  ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 32.0, 20.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.start,
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                validator: _model.shortBioControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 44.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREATE_NOTE_COMP_CREATE_NOTE_BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');

                                      var notesRecordReference =
                                          NotesRecord.collection.doc();
                                      await notesRecordReference
                                          .set(createNotesRecordData(
                                        owner: currentUserReference,
                                        taskRef: widget.taskRef!.reference,
                                        note: _model.shortBioController.text,
                                        timePosted: getCurrentTimestamp,
                                      ));
                                      _model.newNote =
                                          NotesRecord.getDocumentFromData(
                                              createNotesRecordData(
                                                owner: currentUserReference,
                                                taskRef:
                                                    widget.taskRef!.reference,
                                                note: _model
                                                    .shortBioController.text,
                                                timePosted: getCurrentTimestamp,
                                              ),
                                              notesRecordReference);
                                      // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                      // createActivity
                                      logFirebaseEvent('Button_createActivity');

                                      var activityRecordReference =
                                          ActivityRecord.collection.doc();
                                      await activityRecordReference.set({
                                        ...createActivityRecordData(
                                          activityName: 'Note Created',
                                          activityTime: getCurrentTimestamp,
                                          activityDescription:
                                              _model.shortBioController.text,
                                          activityType:
                                              widget.taskRef!.taskName,
                                          projectRef:
                                              widget.taskRef!.projectRef,
                                          otherUser: currentUserReference,
                                          readState: false,
                                          activitySubText:
                                              'has left a note on ',
                                          taskRef: widget.taskRef!.reference,
                                        ),
                                        'targetUserRef':
                                            widget.taskRef!.members,
                                        'unreadByUser': widget.taskRef!.members,
                                      });
                                      _model.activityCreated =
                                          ActivityRecord.getDocumentFromData({
                                        ...createActivityRecordData(
                                          activityName: 'Note Created',
                                          activityTime: getCurrentTimestamp,
                                          activityDescription:
                                              _model.shortBioController.text,
                                          activityType:
                                              widget.taskRef!.taskName,
                                          projectRef:
                                              widget.taskRef!.projectRef,
                                          otherUser: currentUserReference,
                                          readState: false,
                                          activitySubText:
                                              'has left a note on ',
                                          taskRef: widget.taskRef!.reference,
                                        ),
                                        'targetUserRef':
                                            widget.taskRef!.members,
                                        'unreadByUser': widget.taskRef!.members,
                                      }, activityRecordReference);
                                      logFirebaseEvent('Button_bottom_sheet');
                                      Navigator.pop(context);

                                      setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'clj48a46' /* Create Note */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 270.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
