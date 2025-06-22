// ignore_for_file: must_be_immutable
import 'package:burzakh/core/theme/theme.dart';
import 'package:burzakh/features/admin_dashboard/presentation/page/admin_dashboard.dart';
import 'package:burzakh/features/authentication/presentation/page/sign_up.dart';
import 'package:burzakh/features/dashboard/presentation/page/dashboard.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Ui/cda_admin_dashboard_view.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/UI/police_admin_dashboard_view.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/rta_dashboard_widget.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_1.dart';
import 'package:burzakh/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/features/translation/presentation/page/translation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/presentation/page/forgot_otp_screen.dart';
import '../../features/authentication/presentation/page/login_01.dart';
import '../../features/new_ui/dashboard/app_dashboard.dart';
import '../../features/onboarding/presentation/page/onboarding_001.dart';
import '../../features/onboarding/presentation/page/onboarding_01.dart';
import '../../features/splash/presentation/page/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  var pro = Get.put(LocalizationGetx());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationGetx>(builder: (_) {
      return MaterialApp(
        navigatorKey: navigatorKey,
        locale: pro.lang.value,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        scaffoldMessengerKey: scaffoldMessengerKey,
        darkTheme: ThemeChange.darkTheme(),
        themeMode: pro.themeMode.value,
        theme: ThemeChange.lightTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          'appDashBoard': (context) => AppDashboard(),
          '/': (context) => SplashScreen(),
          'onboarding1': (context) => Onboarding1(),
          'onboarding01': (context) => Onboarding01(),
          'onboarding001': (context) => Onboarding001(),
          'SignUpScreen': (context) => SignUpScreen(),
          'dashboard': (context) => Dashboard(),
          'adminDashboard': (context) => AdminDashboard(),
          'translation': (context) => TranslationScreen(),
          'BurzakhEnhancedLogin': (context) => BurzakhEnhancedLogin(),
          'VerifyOtpForResetpassword': (context) => VerifyOtpForResetpassword(),
        },
        // home: RtaDashboardView(),
        // home: CdaAdminDashboardView(),
      );
    });
  }
}
