import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/dashboard/presentation/controller/cubit.dart';
import 'package:burzakh/features/dashboard/presentation/widgets/bottom_widget.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
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

    // if (!shouldShow) {
    //   dashboardCubit.changeScreenIndex(0);
    //   return;
    // }

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
                      child: Icon(
                        Icons.flag,
                        color: AppColor.primary(),
                        size: 30,
                      ),
                    ),
                    0.03.ph(context),

                    // Title
                    Text(
                      'UAE Citizens Only'.tr(),
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
                      'This section is strictly for UAE Citizens only. Kindly confirm you are an Emirati to proceed.'
                          .tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: AppColor.grey(),
                        fontFamily: 'nr',
                        height: 1.4,
                      ),
                    ),
                    0.02.ph(context),

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
                              });
                            },
                            activeColor: AppColor.primary(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Don't show this again".tr(),
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

                    0.02.ph(context),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: context.mh * 0.05,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                dashboardCubit.changeScreenIndex(0);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    AppColor.greyLight1().withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Cancel'.tr(),
                                style: TextStyle(
                                  color: AppColor.grey(),
                                  fontSize: context.mh * 0.016,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'ns',
                                ),
                              ),
                            ),
                          ),
                        ),
                        0.02.pw(context),
                        Expanded(
                          child: Container(
                            height: context.mh * 0.05,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_dontShowAgain) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool('show_emirati_popup', false);
                                }
                                Navigator.of(context).pop();
                                dashboardCubit.changeScreenIndex(0);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary(),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Confirm'.tr(),
                                style: TextStyle(
                                  color: AppColor.white(),
                                  fontSize: context.mh * 0.016,
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
                      ? CreatCaseScreen()
                      : dashboardCubit.screenIndex == 2
                          ? HomeScreen1()
                          : dashboardCubit.screenIndex == 3
                              ? RehmaScreen()
                              : SettingScreen(),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    color: AppColor.white(),
                    border: Border(
                        top: BorderSide(
                            width: .5, color: AppColor.greyLight1()))),
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
                            index: 1)),
                    Expanded(
                        child: BottomWidget(
                      text: 'Home',
                      icon: AppAssets.homeIcon,
                      isSelected: dashboardCubit.screenIndex == 2,
                      index: 2,
                    )),
                    Expanded(
                        child: BottomWidget(
                            text: 'Rehma',
                            icon: AppAssets.islamicEduIcon,
                            isSelected: dashboardCubit.screenIndex == 3,
                            index: 3)),
                    Expanded(
                        child: BottomWidget(
                            text: 'Settings',
                            icon: AppAssets.personsInCircleIcon,
                            isSelected: dashboardCubit.screenIndex == 4,
                            index: 4)),
                  ],
                ),
              ),
            );
          }),
    );
  }

  var dashboardCubit = DiContainer().sl<DashboardCubit>();
  var _homeCubit = DiContainer().sl<HomeCubit>();
}
