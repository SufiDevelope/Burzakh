import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/dashboard/presentation/controller/cubit.dart';
import 'package:burzakh/features/dashboard/presentation/widgets/bottom_widget.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/home/ui/documnet_progress_case_details.dart';
import 'package:burzakh/features/new_ui/rehma/ui/rehma_screen.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../widgets/close_app_sheet.dart';
import '../emarati/ui/emarati_screen.dart';
import '../home/ui/creat_case_screen.dart';
import '../home/ui/home_screen1.dart';
import '../settings/ui/setting_screen.dart';

class AppDashboard extends StatefulWidget {
  const AppDashboard({super.key});

  @override
  State<AppDashboard> createState() => _AppDashboardState();
}

class _AppDashboardState extends State<AppDashboard> {
  NotificationService notificationServices = NotificationService();
  bool _dontShowAgain = false;
  String? selectedCaseId; // Add this for case selection

  updateDataInOneMinutes() async {
    String response = await _homeCubit.recentActivity();
    Future.delayed(Duration(minutes: response == "200" ? 1 : 2), () async {
      updateDataInOneMinutes();
    });
  }

  Widget _buildEmaratiBottomWidget() {
    bool isSelected = dashboardCubit.screenIndex == 0;
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => _showEmaratiPopup(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: !isSelected
                  ? Colors.transparent
                  : AppColor.primary().withOpacity(.1),
            ),
            child: SvgPicture.asset(
              AppAssets.emiratiSvcIcon,
              color: !isSelected ? AppColor.grey() : AppColor.primary(),
              height: context.mh * 0.017,
              width: context.mw * 0.017,
            ),
          ),
          AppText(
            text: 'Emarati',
            fontSize: context.mh * 0.013,
            overflow: TextOverflow.ellipsis,
            color: !isSelected ? AppColor.grey() : AppColor.primary(),
            fontFamily: !isSelected ? 'nr' : 'ns',
            fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w600,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) {
        _homeCubit.getUserCases();
      },
    );
    updateDataInOneMinutes();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    super.initState();
  }

  Future<void> _showEmaratiPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool shouldShow = prefs.getBool('show_emirati_popup') ?? true;
    if (shouldShow) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  constraints: BoxConstraints(
                    maxWidth: 450,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white(),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Golden Header Section
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFaf863e),
                                Color(0xFFb98b2c),
                                Color(0xFFc69310),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              // Icon
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.layers,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              0.02.ph(context),

                              // Title
                              Text(
                                'Emirati Citizen Services'.tr(),
                                style: TextStyle(
                                  fontSize: context.mh * 0.024,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'ns',
                                ),
                              ),
                              0.01.ph(context),

                              // Subtitle
                              Text(
                                'Special support services for UAE nationals during their time of need'
                                    .tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: context.mh * 0.013,
                                  color: Colors.white.withOpacity(0.9),
                                  fontFamily: 'nr',
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // White Content Section
                        Container(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Main Title
                              Text(
                                'Eligibility Confirmation Required'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: context.mh * 0.016,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary(),
                                  fontFamily: 'ns',
                                ),
                              ),
                              0.02.ph(context),

                              // Description
                              Text(
                                "As part of the UAE's commitment to its citizens, additional compassionate services are available exclusively for Emirati families. These services are provided to honor our national heritage and support our community during times of loss."
                                    .tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: context.mh * 0.014,
                                  color: AppColor.grey(),
                                  fontFamily: 'nr',
                                  height: 1.5,
                                ),
                              ),
                              0.025.ph(context),

                              // Services Section
                              Row(
                                children: [
                                  Text(
                                    'Available Services Include:'.tr(),
                                    style: TextStyle(
                                      fontSize: context.mh * 0.018,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFB8956A),
                                      fontFamily: 'ns',
                                    ),
                                  ),
                                ],
                              ),
                              0.015.ph(context),

                              // Services List
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF8F6F3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildServiceItem(
                                        'Mourning tent setup and facilities'),
                                    0.01.ph(context),
                                    _buildServiceItem(
                                        'Directional road signage assistance'),
                                    0.01.ph(context),
                                    _buildServiceItem(
                                        'Specialized administrative support'),
                                  ],
                                ),
                              ),
                              0.025.ph(context),

                              // Checkbox
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColor.bgPrimary(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: _dontShowAgain,
                                      onChanged: (value) {
                                        setState(() {
                                          _dontShowAgain = value ?? false;
                                          prefs.setBool('show_emirati_popup',
                                              !_dontShowAgain);
                                        });
                                      },
                                      activeColor: Color(0xFFB8956A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'I understand the eligibility requirements. Do not show this confirmation again.'
                                            .tr(),
                                        style: TextStyle(
                                          fontSize: context.mh * 0.014,
                                          color: AppColor.grey(),
                                          fontFamily: 'nr',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              0.025.ph(context),

                              // Buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: context.mh * 0.055,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xFFdac9a8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          'Cancel'.tr(),
                                          style: TextStyle(
                                            fontSize: context.mh * 0.016,
                                            color: Color(0xff656056),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'ns',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  0.015.pw(context),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (_dontShowAgain) {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setBool(
                                              'show_emirati_popup', false);
                                        }
                                        Navigator.of(context).pop();
                                        dashboardCubit.changeScreenIndex(0);
                                      },
                                      child: Container(
                                        height: context.mh * 0.055,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFb0863d),
                                              Color(0xFFc59211),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'I Confirm Eligibility'.tr(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: context.mh * 0.014,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'ns',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              0.02.ph(context),

                              // Quranic Verse
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  "And those who believed and whose families follow them in faith - We will join with them their families — At-Tur 52:21"
                                      .tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: context.mh * 0.014,
                                    color: AppColor.grey().withOpacity(0.8),
                                    fontFamily: 'nr',
                                    fontStyle: FontStyle.italic,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    } else {
      dashboardCubit.changeScreenIndex(0);
    }
  }

  Widget _buildServiceItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: EdgeInsets.only(top: 6, right: 12),
          decoration: BoxDecoration(
            color: Color(0xFFB8956A),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text.tr(),
            style: TextStyle(
              fontSize: context.mh * 0.015,
              color: AppColor.grey(),
              fontFamily: 'nr',
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  bool isWaitingForCaseSelection = false;

// Document screen logic
  Widget _getDocumentScreen() {
    if (isWaitingForCaseSelection) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_homeCubit.caseList.isNotEmpty) {
      if (selectedCaseId != null) {
        return DocumnetProgressCaseDetails(
          caseId: selectedCaseId!,
        );
      } else {
        return CreatCaseScreen();
      }
    } else {
      log("No cases available or no case selected, going to create case screen");
      return CreatCaseScreen();
    }
  }

// Handle Docs tab tap
  void _handleDocumentTap() {
    log("Document tab tapped");
    log("Available cases: ${_homeCubit.caseList.length}");

    if (_homeCubit.caseList.isNotEmpty) {
      log("Cases available, will show selection dialog");
      setState(() {
        isWaitingForCaseSelection = true;
        dashboardCubit.changeScreenIndex(1);
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showCaseSelectionDialog();
      });
    } else {
      log("No cases available, going directly to create case screen");
      setState(() {
        selectedCaseId = null;
        isWaitingForCaseSelection = false;
        dashboardCubit.changeScreenIndex(1);
      });
    }
  }

// Dialog
  void _showCaseSelectionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColor.white(),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColor.primary().withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.folder_open,
                      color: AppColor.primary(), size: 30),
                ),
                0.02.ph(context),

                // Title
                Text(
                  'Select Case'.tr(),
                  style: TextStyle(
                    fontSize: context.mh * 0.020,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary(),
                    fontFamily: 'ns',
                  ),
                ),
                0.016.ph(context),

                // Message
                Text(
                  'Choose an existing case or create a new one'.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: context.mh * 0.014,
                    color: AppColor.grey(),
                    fontFamily: 'nr',
                  ),
                ),
                0.02.ph(context),

                // Case List
                Container(
                  width: double.maxFinite,
                  constraints: BoxConstraints(maxHeight: context.mh * 0.3),
                  child: SingleChildScrollView(
                    child: Column(
                      children: _homeCubit.caseList.map((caseItem) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                log("Case selected: ${caseItem.id}");
                                Navigator.of(context).pop();
                                setState(() {
                                  selectedCaseId = caseItem.id.toString();
                                  isWaitingForCaseSelection = false;
                                });
                                dashboardCubit.changeScreenIndex(1);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: AppColor.bgPrimary(),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            caseItem.name_of_deceased,
                                            style: TextStyle(
                                              fontSize: context.mh * 0.016,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'ns',
                                            ),
                                          ),
                                          0.005.ph(context),
                                          Text(
                                            caseItem.caseStatus,
                                            style: TextStyle(
                                              fontSize: context.mh * 0.014,
                                              color: AppColor.grey(),
                                              fontFamily: 'nr',
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 16, color: AppColor.grey()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                0.02.ph(context),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: context.mh * 0.05,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              isWaitingForCaseSelection = false;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                AppColor.greyLight1().withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            'Cancel'.tr(),
                            style: TextStyle(
                              color: AppColor.grey(),
                              fontSize: context.mh * 0.012,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'ns',
                            ),
                          ),
                        ),
                      ),
                    ),
                    0.01.pw(context),
                    Expanded(
                      child: SizedBox(
                        height: context.mh * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              selectedCaseId = null;
                              isWaitingForCaseSelection = false;
                            });
                            dashboardCubit.changeScreenIndex(1);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatCaseScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary(),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            'Create New Case'.tr(),
                            style: TextStyle(
                              color: AppColor.white(),
                              fontSize: context.mh * 0.012,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'ns',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          barrierColor: AppColor.blurWhiteColor(),
          builder: (context) => CloseAppSheet(),
        );
        return false;
      },
      child: BlocBuilder(
        bloc: dashboardCubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColor.bgPrimary(),
            body: dashboardCubit.screenIndex == 0
                ? EmaratiScreen()
                : dashboardCubit.screenIndex == 1
                    ? _getDocumentScreen()
                    : dashboardCubit.screenIndex == 2
                        ? HomeScreen1()
                        : dashboardCubit.screenIndex == 3
                            ? RehmaScreen()
                            : SettingScreen(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColor.white(),
                border: Border(
                    top: BorderSide(width: .5, color: AppColor.greyLight1())),
              ),
              padding: EdgeInsets.symmetric(vertical: appBottomMargin - 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: _buildEmaratiBottomWidget()),
                  Expanded(
                    child: BottomWidget(
                      text: 'Docs',
                      icon: AppAssets.documentIcon,
                      isSelected: dashboardCubit.screenIndex == 1,
                      index: 1,
                      onTap: () {
                        _handleDocumentTap();
                      },
                    ),
                  ),
                  Expanded(
                    child: BottomWidget(
                      text: 'Home',
                      icon: AppAssets.homeIcon,
                      isSelected: dashboardCubit.screenIndex == 2,
                      index: 2,
                      onTap: () {
                        dashboardCubit.getIndex(2);
                      },
                    ),
                  ),
                  Expanded(
                    child: BottomWidget(
                      text: 'Rehma',
                      icon: AppAssets.islamicEduIcon,
                      isSelected: dashboardCubit.screenIndex == 3,
                      index: 3,
                      onTap: () {
                        dashboardCubit.getIndex(3);
                      },
                    ),
                  ),
                  Expanded(
                    child: BottomWidget(
                      text: 'Settings',
                      icon: AppAssets.personsInCircleIcon,
                      isSelected: dashboardCubit.screenIndex == 4,
                      index: 4,
                      onTap: () {
                        dashboardCubit.getIndex(4);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Dependency injectors
  final dashboardCubit = DiContainer().sl<DashboardCubit>();
  final _homeCubit = DiContainer().sl<HomeCubit>();
}
