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
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primary,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: MediaQuery.of(context).size.width <= 764.0,
              child: FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('HOME_FloatingActionButton_znp43l53_ON_TA');
                  logFirebaseEvent('FloatingActionButton_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => FocusScope.of(context)
                            .requestFocus(_model.unfocusNode),
                        child: Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: CreateProjectModalWidget(),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                child: Icon(
                  Icons.cake,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.drawerNavModel,
                updateCallback: () => setState(() {}),
                child: DrawerNavWidget(),
              ),
            ),
            body: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  wrapWithModel(
                    model: _model.webNavModel,
                    updateCallback: () => setState(() {}),
                    child: WebNavWidget(
                      navBGOne:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      navColorOne: FlutterFlowTheme.of(context).secondaryText,
                      navBgTwo: FlutterFlowTheme.of(context).primaryBackground,
                      navColorTwo: FlutterFlowTheme.of(context).primary,
                      navBgThree:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      navColorThree: FlutterFlowTheme.of(context).secondaryText,
                      navColorFour: FlutterFlowTheme.of(context).secondaryText,
                      navBGFour:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 24.0, 16.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_Container_9adrlbh4_ON_TAP');
                                    logFirebaseEvent('userCard_navigate_to');

                                    context.pushNamed(
                                      'ProfilePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.userCardModel,
                                    updateCallback: () => setState(() {}),
                                    child: UserCardWidget(),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qcd4z131' /* Wishes */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '0e5jbrkh' /* Peopl need you */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_MAKE_A_WISH_BTN_ON_TAP');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: double.infinity,
                                              child: CreateProjectModalWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().update(() {
                                      FFAppState().searchUsers = false;
                                    });
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '5mru78lw' /* Make a Wish */,
                                  ),
                                  icon: Icon(
                                    Icons.cake,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 20.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: wrapWithModel(
                                model: _model.notificationTriggerModel,
                                updateCallback: () => setState(() {}),
                                child: NotificationTriggerWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle:
                                      FlutterFlowTheme.of(context).titleMedium,
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  tabs: [
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '3m5m2eji' /* Round Table */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'kqzftbni' /* My Wishes */,
                                      ),
                                    ),
                                    Tab(
                                      text: FFLocalizations.of(context).getText(
                                        '842ymuru' /* Friends' Wishes */,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 4.0, 24.0),
                                            child: StreamBuilder<
                                                List<ProjectsRecord>>(
                                              stream: queryProjectsRecord(
                                                queryBuilder: (projectsRecord) =>
                                                    projectsRecord
                                                        .where('owner',
                                                            isNotEqualTo:
                                                                currentUserReference)
                                                        .orderBy('owner',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProjectsRecord>
                                                    cardWrapProjectsRecordList =
                                                    snapshot.data!;
                                                if (cardWrapProjectsRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 600.0,
                                                      child:
                                                          EmptyProjectsWidget(
                                                        title: 'No Projects',
                                                        bodyText:
                                                            'You don\'t have any projects you are assigned too.',
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      cardWrapProjectsRecordList
                                                          .length,
                                                      (cardWrapIndex) {
                                                    final cardWrapProjectsRecord =
                                                        cardWrapProjectsRecordList[
                                                            cardWrapIndex];
                                                    return WishCardWidget(
                                                      key: Key(
                                                          'Key1kn_${cardWrapIndex}_of_${cardWrapProjectsRecordList.length}'),
                                                      projectRef:
                                                          cardWrapProjectsRecord,
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 4.0, 24.0),
                                            child: StreamBuilder<
                                                List<ProjectsRecord>>(
                                              stream: queryProjectsRecord(
                                                queryBuilder: (projectsRecord) =>
                                                    projectsRecord.where(
                                                        'owner',
                                                        isEqualTo:
                                                            currentUserReference),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProjectsRecord>
                                                    cardWrapProjectsRecordList =
                                                    snapshot.data!;
                                                if (cardWrapProjectsRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 600.0,
                                                      child:
                                                          EmptyProjectsWidget(
                                                        title: 'No Projects',
                                                        bodyText:
                                                            'You don\'t have any projects you are assigned too.',
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      cardWrapProjectsRecordList
                                                          .length,
                                                      (cardWrapIndex) {
                                                    final cardWrapProjectsRecord =
                                                        cardWrapProjectsRecordList[
                                                            cardWrapIndex];
                                                    return WishCardWidget(
                                                      key: Key(
                                                          'Key5v9_${cardWrapIndex}_of_${cardWrapProjectsRecordList.length}'),
                                                      projectRef:
                                                          cardWrapProjectsRecord,
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 4.0, 24.0),
                                            child: StreamBuilder<
                                                List<ProjectsRecord>>(
                                              stream: queryProjectsRecord(
                                                queryBuilder: (projectsRecord) =>
                                                    projectsRecord
                                                        .where('owner',
                                                            isNotEqualTo:
                                                                currentUserReference)
                                                        .orderBy('owner',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ProjectsRecord>
                                                    cardWrapProjectsRecordList =
                                                    snapshot.data!;
                                                if (cardWrapProjectsRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child: Container(
                                                      height: 600.0,
                                                      child:
                                                          EmptyProjectsWidget(
                                                        title: 'No Projects',
                                                        bodyText:
                                                            'You don\'t have any projects you are assigned too.',
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      cardWrapProjectsRecordList
                                                          .length,
                                                      (cardWrapIndex) {
                                                    final cardWrapProjectsRecord =
                                                        cardWrapProjectsRecordList[
                                                            cardWrapIndex];
                                                    return WishCardWidget(
                                                      key: Key(
                                                          'Key4qd_${cardWrapIndex}_of_${cardWrapProjectsRecordList.length}'),
                                                      projectRef:
                                                          cardWrapProjectsRecord,
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
