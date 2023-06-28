import '/archive/modal_user_profile/modal_user_profile_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_team/add_team_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/details/project_details_modal/project_details_modal_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_details_modal_model.dart';
export 'task_details_modal_model.dart';

class TaskDetailsModalWidget extends StatefulWidget {
  const TaskDetailsModalWidget({
    Key? key,
    this.taskRef,
  }) : super(key: key);

  final AllTasksRecord? taskRef;

  @override
  _TaskDetailsModalWidgetState createState() => _TaskDetailsModalWidgetState();
}

class _TaskDetailsModalWidgetState extends State<TaskDetailsModalWidget>
    with TickerProviderStateMixin {
  late TaskDetailsModalModel _model;

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 170.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.7, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 170.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.7, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'dividerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 40.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.571, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskDetailsModalModel());

    _model.updateActivityController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _model.content,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: FutureBuilder<ProjectsRecord>(
                                          future:
                                              ProjectsRecord.getDocumentOnce(
                                                  widget.taskRef!.projectRef!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            final rowProjectsRecord =
                                                snapshot.data!;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'TASK_DETAILS_MODAL_Row_rtut46js_ON_TAP');
                                                logFirebaseEvent(
                                                    'Row_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            ProjectDetailsModalWidget(
                                                          projectRef:
                                                              rowProjectsRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_left_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          rowProjectsRecord
                                                              .projectName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                8.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      buttonSize: 44.0,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'TASK_DETAILS_MODAL_close_rounded_ICN_ON_');
                                                        logFirebaseEvent(
                                                            'IconButton_bottom_sheet');
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  widget.taskRef!.taskName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium,
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation1']!),
                                                Container(
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (widget.taskRef!
                                                              .status ==
                                                          'Not Started') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondary30;
                                                      } else if (widget.taskRef!
                                                              .status ==
                                                          'In Progress') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary30;
                                                      } else if (widget.taskRef!
                                                              .status ==
                                                          'Complete') {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .tertiary30;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .error30;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0),
                                                    border: Border.all(
                                                      color: () {
                                                        if (widget.taskRef!
                                                                .status ==
                                                            'Not Started') {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary;
                                                        } else if (widget
                                                                .taskRef!
                                                                .status ==
                                                            'In Progress') {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primary;
                                                        } else if (widget
                                                                .taskRef!
                                                                .status ==
                                                            'Complete') {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate;
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary;
                                                        }
                                                      }(),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      widget.taskRef!.status,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall,
                                                    ),
                                                  ),
                                                ),
                                                if (widget.taskRef!.owner ==
                                                    currentUserReference)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 44.0,
                                                      icon: Icon(
                                                        Icons.edit_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'TASK_DETAILS_MODAL_edit_rounded_ICN_ON_T');
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_to');

                                                        context.pushNamed(
                                                          'EditTaskPage',
                                                          queryParameters: {
                                                            'taskRef':
                                                                serializeParam(
                                                              widget.taskRef,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'taskRef':
                                                                widget.taskRef,
                                                          },
                                                        );

                                                        logFirebaseEvent(
                                                            'IconButton_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Task updated successfully',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'IconButton_navigate_back');
                                                        context.safePop();
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (!widget.taskRef!.completed)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                if (widget.taskRef!.members
                                                    .contains(
                                                        currentUserReference))
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    children: [
                                                      if ((widget.taskRef!
                                                                  .owner ==
                                                              currentUserReference) &&
                                                          (widget.taskRef!
                                                                  .completed ==
                                                              false))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TASK_DETAILS_MODAL_markComplete_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'markComplete_backend_call');

                                                              await widget
                                                                  .taskRef!
                                                                  .reference
                                                                  .update(
                                                                      createAllTasksRecordData(
                                                                status:
                                                                    'Complete',
                                                                completed: true,
                                                                completedAt:
                                                                    getCurrentTimestamp,
                                                              ));
                                                              logFirebaseEvent(
                                                                  'markComplete_backend_call');

                                                              await widget
                                                                  .taskRef!
                                                                  .projectRef!
                                                                  .update({
                                                                ...createProjectsRecordData(
                                                                  lastEdited:
                                                                      getCurrentTimestamp,
                                                                ),
                                                                'completedTasks':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              });
                                                              // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                                              // createActivity
                                                              logFirebaseEvent(
                                                                  'markComplete_createActivity');

                                                              var activityRecordReference =
                                                                  ActivityRecord
                                                                      .collection
                                                                      .doc();
                                                              await activityRecordReference
                                                                  .set({
                                                                ...createActivityRecordData(
                                                                  activityName:
                                                                      'Task Complete',
                                                                  activityTime:
                                                                      getCurrentTimestamp,
                                                                  activityDescription:
                                                                      'A team member has started a task, get started on it now!',
                                                                  activityType:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    widget
                                                                        .taskRef!
                                                                        .taskName,
                                                                    'TaskName',
                                                                  ),
                                                                  projectRef: widget
                                                                      .taskRef!
                                                                      .projectRef,
                                                                  otherUser:
                                                                      currentUserReference,
                                                                  readState:
                                                                      false,
                                                                  activitySubText:
                                                                      'has completed',
                                                                  taskRef: widget
                                                                      .taskRef!
                                                                      .reference,
                                                                ),
                                                                'targetUserRef':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                                'unreadByUser':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                              });
                                                              _model.completedActivity =
                                                                  ActivityRecord
                                                                      .getDocumentFromData({
                                                                ...createActivityRecordData(
                                                                  activityName:
                                                                      'Task Complete',
                                                                  activityTime:
                                                                      getCurrentTimestamp,
                                                                  activityDescription:
                                                                      'A team member has started a task, get started on it now!',
                                                                  activityType:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    widget
                                                                        .taskRef!
                                                                        .taskName,
                                                                    'TaskName',
                                                                  ),
                                                                  projectRef: widget
                                                                      .taskRef!
                                                                      .projectRef,
                                                                  otherUser:
                                                                      currentUserReference,
                                                                  readState:
                                                                      false,
                                                                  activitySubText:
                                                                      'has completed',
                                                                  taskRef: widget
                                                                      .taskRef!
                                                                      .reference,
                                                                ),
                                                                'targetUserRef':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                                'unreadByUser':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                              }, activityRecordReference);
                                                              // This action will update the "Activity" list with when this task moved from not started to in progress.
                                                              logFirebaseEvent(
                                                                  'markComplete_backend_call');

                                                              var notesRecordReference =
                                                                  NotesRecord
                                                                      .collection
                                                                      .doc();
                                                              await notesRecordReference
                                                                  .set(
                                                                      createNotesRecordData(
                                                                owner:
                                                                    currentUserReference,
                                                                taskRef: widget
                                                                    .taskRef!
                                                                    .reference,
                                                                note:
                                                                    'Task has been moved to \"Complete\"',
                                                                timePosted:
                                                                    getCurrentTimestamp,
                                                              ));
                                                              _model.taskActivityComplete =
                                                                  NotesRecord.getDocumentFromData(
                                                                      createNotesRecordData(
                                                                        owner:
                                                                            currentUserReference,
                                                                        taskRef: widget
                                                                            .taskRef!
                                                                            .reference,
                                                                        note:
                                                                            'Task has been moved to \"Complete\"',
                                                                        timePosted:
                                                                            getCurrentTimestamp,
                                                                      ),
                                                                      notesRecordReference);
                                                              logFirebaseEvent(
                                                                  'markComplete_navigate_to');

                                                              context.pushNamed(
                                                                'ChallengePage',
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .leftToRight,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            240),
                                                                  ),
                                                                },
                                                              );

                                                              logFirebaseEvent(
                                                                  'markComplete_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'You Completed a Task!',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'zerfwzgz' /* Mark as Complete */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 44.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'buttonOnPageLoadAnimation1']!),
                                                        ),
                                                      if (widget.taskRef!
                                                              .status ==
                                                          'Not Started')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TASK_DETAILS_MODAL_COMP_accept_ON_TAP');
                                                              // changeStatus
                                                              logFirebaseEvent(
                                                                  'accept_changeStatus');

                                                              await widget
                                                                  .taskRef!
                                                                  .reference
                                                                  .update(
                                                                      createAllTasksRecordData(
                                                                status:
                                                                    'In Progress',
                                                              ));
                                                              // updateProjectRef
                                                              logFirebaseEvent(
                                                                  'accept_updateProjectRef');

                                                              await widget
                                                                  .taskRef!
                                                                  .projectRef!
                                                                  .update(
                                                                      createProjectsRecordData(
                                                                lastEdited:
                                                                    getCurrentTimestamp,
                                                              ));
                                                              // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                                              // createActivity
                                                              logFirebaseEvent(
                                                                  'accept_createActivity');

                                                              var activityRecordReference =
                                                                  ActivityRecord
                                                                      .collection
                                                                      .doc();
                                                              await activityRecordReference
                                                                  .set({
                                                                ...createActivityRecordData(
                                                                  activityName:
                                                                      'Task Started',
                                                                  activityTime:
                                                                      getCurrentTimestamp,
                                                                  activityDescription:
                                                                      'A team member has started a task, get started on it now!',
                                                                  activityType:
                                                                      'started a task',
                                                                  projectRef: widget
                                                                      .taskRef!
                                                                      .projectRef,
                                                                  otherUser:
                                                                      currentUserReference,
                                                                  readState:
                                                                      false,
                                                                  activitySubText:
                                                                      'has',
                                                                  taskRef: widget
                                                                      .taskRef!
                                                                      .reference,
                                                                ),
                                                                'targetUserRef':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                                'unreadByUser':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                              });
                                                              _model.activityCreated =
                                                                  ActivityRecord
                                                                      .getDocumentFromData({
                                                                ...createActivityRecordData(
                                                                  activityName:
                                                                      'Task Started',
                                                                  activityTime:
                                                                      getCurrentTimestamp,
                                                                  activityDescription:
                                                                      'A team member has started a task, get started on it now!',
                                                                  activityType:
                                                                      'started a task',
                                                                  projectRef: widget
                                                                      .taskRef!
                                                                      .projectRef,
                                                                  otherUser:
                                                                      currentUserReference,
                                                                  readState:
                                                                      false,
                                                                  activitySubText:
                                                                      'has',
                                                                  taskRef: widget
                                                                      .taskRef!
                                                                      .reference,
                                                                ),
                                                                'targetUserRef':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                                'unreadByUser':
                                                                    widget
                                                                        .taskRef!
                                                                        .members,
                                                              }, activityRecordReference);
                                                              // This action will update the "Activity" list with when this task moved from not started to in progress.
                                                              // createActivityNote
                                                              logFirebaseEvent(
                                                                  'accept_createActivityNote');

                                                              var notesRecordReference =
                                                                  NotesRecord
                                                                      .collection
                                                                      .doc();
                                                              await notesRecordReference
                                                                  .set(
                                                                      createNotesRecordData(
                                                                owner:
                                                                    currentUserReference,
                                                                taskRef: widget
                                                                    .taskRef!
                                                                    .reference,
                                                                note:
                                                                    'Task has been moved to \"In Progress\"',
                                                                timePosted:
                                                                    getCurrentTimestamp,
                                                              ));
                                                              _model.taskActivity =
                                                                  NotesRecord.getDocumentFromData(
                                                                      createNotesRecordData(
                                                                        owner:
                                                                            currentUserReference,
                                                                        taskRef: widget
                                                                            .taskRef!
                                                                            .reference,
                                                                        note:
                                                                            'Task has been moved to \"In Progress\"',
                                                                        timePosted:
                                                                            getCurrentTimestamp,
                                                                      ),
                                                                      notesRecordReference);
                                                              logFirebaseEvent(
                                                                  'accept_navigate_to');

                                                              context.pushNamed(
                                                                'ChallengePage',
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .leftToRight,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            240),
                                                                  ),
                                                                },
                                                              );

                                                              logFirebaseEvent(
                                                                  'accept_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'You have started a task!',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBtnText,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'fki0wi86' /* Begin Task */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 44.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'buttonOnPageLoadAnimation2']!),
                                                        ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                        ],
                                      ),
                                      AutoSizeText(
                                        widget.taskRef!.description
                                            .maybeHandleOverflow(
                                          maxChars: 200,
                                          replacement: '…',
                                        ),
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation2']!),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'MMMEd',
                                            widget.taskRef!.timeCreated!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                fontSize: 18.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation3']!),
                                      ),
                                      Divider(
                                        height: 12.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                      ).animateOnPageLoad(animationsMap[
                                          'dividerOnPageLoadAnimation']!),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5bz5zdwp' /* Team Members */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                            ).animateOnPageLoad(animationsMap[
                                                'textOnPageLoadAnimation4']!),
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: 30.0,
                                              borderWidth: 2.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.person_add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'TASK_DETAILS_MODAL_person_add_ICN_ON_TAP');
                                                logFirebaseEvent(
                                                    'IconButton_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x00E9E9EE),
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: double.infinity,
                                                        child: AddTeamWidget(
                                                          taskRef:
                                                              widget.taskRef,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    child: Builder(
                                      builder: (context) {
                                        final members =
                                            widget.taskRef!.members.toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: members.length,
                                          itemBuilder: (context, membersIndex) {
                                            final membersItem =
                                                members[membersIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 0.0, 12.0),
                                              child: FutureBuilder<UsersRecord>(
                                                future:
                                                    UsersRecord.getDocumentOnce(
                                                        membersItem),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final proPlanUsersRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'TASK_DETAILS_MODAL_COMP_ProPlan_ON_TAP');
                                                      logFirebaseEvent(
                                                          'ProPlan_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                ModalUserProfileWidget(
                                                              userRef:
                                                                  proPlanUsersRecord,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 260.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x32171717),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                              child:
                                                                  Image.network(
                                                                proPlanUsersRecord
                                                                    .photoUrl,
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      proPlanUsersRecord
                                                                          .displayName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        proPlanUsersRecord
                                                                            .email,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
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
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation1']!);
                                                },
                                              ),
                                            );
                                          },
                                          controller:
                                              _model.listViewController1,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'hc3gs7ga' /* Activity */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation5']!),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 96.0),
                                  child: StreamBuilder<List<NotesRecord>>(
                                    stream: queryNotesRecord(
                                      queryBuilder: (notesRecord) => notesRecord
                                          .where('taskRef',
                                              isEqualTo:
                                                  widget.taskRef!.reference)
                                          .orderBy('timePosted'),
                                    ),
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
                                      List<NotesRecord>
                                          listViewNotesRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewNotesRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewNotesRecord =
                                              listViewNotesRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 0.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    offset: Offset(0.0, 1.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child:
                                                    FutureBuilder<UsersRecord>(
                                                  future: UsersRecord
                                                      .getDocumentOnce(
                                                          listViewNotesRecord
                                                              .owner!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final rowUsersRecord =
                                                        snapshot.data!;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40.0),
                                                          child: Image.network(
                                                            rowUsersRecord
                                                                .photoUrl,
                                                            width: 40.0,
                                                            height: 40.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  rowUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewNotesRecord
                                                                        .note,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      'relative',
                                                                      listViewNotesRecord
                                                                          .timePosted!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (rowUsersRecord
                                                                .reference ==
                                                            listViewNotesRecord
                                                                .owner)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 44.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'TASK_DETAILS_MODAL_delete_outlined_ICN_O');
                                                              logFirebaseEvent(
                                                                  'IconButton_backend_call');
                                                              await listViewNotesRecord
                                                                  .reference
                                                                  .delete();
                                                            },
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation2']!),
                                          );
                                        },
                                        controller: _model.listViewController2,
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 4.0,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).overlay,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.updateActivityController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'ru97sguf' /* Leave update here... */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLines: 3,
                                          minLines: 1,
                                          validator: _model
                                              .updateActivityControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'TASK_DETAILS_MODAL_SUBMIT_BTN_ON_TAP');
                                        logFirebaseEvent('Button_scroll_to');
                                        await _model.content?.animateTo(
                                          0,
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.ease,
                                        );
                                        logFirebaseEvent('Button_backend_call');

                                        var notesRecordReference =
                                            NotesRecord.collection.doc();
                                        await notesRecordReference
                                            .set(createNotesRecordData(
                                          owner: currentUserReference,
                                          taskRef: widget.taskRef!.reference,
                                          note: _model
                                              .updateActivityController.text,
                                          timePosted: getCurrentTimestamp,
                                        ));
                                        _model.newNoteDesktop =
                                            NotesRecord.getDocumentFromData(
                                                createNotesRecordData(
                                                  owner: currentUserReference,
                                                  taskRef:
                                                      widget.taskRef!.reference,
                                                  note: _model
                                                      .updateActivityController
                                                      .text,
                                                  timePosted:
                                                      getCurrentTimestamp,
                                                ),
                                                notesRecordReference);
                                        logFirebaseEvent(
                                            'Button_clear_text_fields');
                                        setState(() {
                                          _model.updateActivityController
                                              ?.clear();
                                        });

                                        setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '5xomb4rp' /* Submit */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(600.0),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        hoverTextColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
        ),
      ),
    );
  }
}
