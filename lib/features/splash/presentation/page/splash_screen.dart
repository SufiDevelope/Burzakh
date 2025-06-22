import 'dart:async';
import 'dart:developer';

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/app/myapp.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/dashboard/app_dashboard.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_01.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../core/domain/connectivity/presentaion/connectivity_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Timer? timer;
  // late AnimationController controller;
  // late Animation<Offset> animation;

  // controller = AnimationController(
  //   vsync: this,
  //   duration: Duration(seconds: 70),
  // );
  //
  // animation = Tween<Offset>(  begin: Offset(0.0, -1.5), // Starts off-screen above
  //   end: Offset(0.0, 0.0),).animate(
  //   CurvedAnimation(
  //     parent: controller,
  //     curve: Curves.bounceOut,
  //   ),
  // );

  late AnimationController controllerArch;
  late Animation<double> animationArch;
  late AnimationController controllerEnglish;
  late Animation<double> animationEnglish;
  late AnimationController controllerArabic;
  late Animation<double> animationArabic;

  late AnimationController controller1;
  late Animation<double> animation1;

  int playCountArch = 0;
  int playCountArabic = 0;
  int playCountEnglish = 0;
  int playCount1 = 0;
  bool showLoader = false;

  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) {
        var localizationController = Get.find<LocalizationGetx>();
        localizationController.selectLocal(context);
      },
    );
    super.initState();

    timer = Timer(Duration(seconds: 7), () async {
      var authCubit = DiContainer().sl<AuthenticationCubit>();
      await authCubit.checkUserExist();
    });

    controllerArch = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationArch = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerArch,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
    controllerArabic = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    animationArabic = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerArabic,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
    controllerEnglish = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    animationEnglish = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controllerEnglish,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    // Listen to animation status
    controllerArch.addStatusListener((statusArch) {
      if (statusArch == AnimationStatus.completed) {
        log("986");
        controllerArabic.addStatusListener((statusArabic) {
          if (statusArabic == AnimationStatus.completed) {
            controllerEnglish.addStatusListener((statusEnglish) {
              if (statusEnglish == AnimationStatus.completed) {
                controller1.addStatusListener((status1) {
                  if (status1 == AnimationStatus.completed && playCount1 < 0) {
                    log("897324");
                    playCount1++;
                    controller1.reset();
                    controller1.forward();
                  }
                });
                controller1.forward();

                setState(() {
                  showLoader = true;
                });
              }
              if (statusEnglish == AnimationStatus.completed &&
                  playCountEnglish < 0) {
                playCountEnglish++;
                controllerEnglish.reset();
                controllerEnglish.forward();
              }
            });
            controllerEnglish.forward();
          }
          if (statusArabic == AnimationStatus.completed &&
              playCountArabic < 0) {
            playCountArabic++;
            controllerArabic.reset();
            controllerArabic.forward();
          }
        });

        controllerArabic.forward();
      }
      if (statusArch == AnimationStatus.completed && playCountArch < 0) {
        log("986");
        playCountArch++;
        controllerArch.reset();
        controllerArch.forward();
      }
    });
    controllerArch.forward();
  }

  @override
  void dispose() {
    controllerArch.dispose();
    controller1.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: mdHeight(context),
        width: mdWidth(context),
        decoration: BoxDecoration(
            gradient: AppColor.bgGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center(
            //   child: ScaleTransition(
            //     scale: animation,
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: mdWidth(context) * .25),
            //       child: Image.asset(AppAssets.appLogo),
            //     ),
            //   ),
            // ),

            Center(
              child: ScaleTransition(
                scale: animationArch,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: mdWidth(context) * .25),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 17),
                      child: Image.asset(
                        AppAssets.arch,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: animationArabic,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding:
                      EdgeInsets.symmetric(horizontal: mdWidth(context) * .25),
                  child: Image.asset(AppAssets.burzakhArabic),
                ),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: animationEnglish,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: mdWidth(context) * .25),
                  child: Image.asset(AppAssets.burzakhEnglish),
                ),
              ),
            ),

            showLoader
                ? AnimatedBuilder(
                    animation: animation1,
                    builder: (context, child) {
                      return SizedBox(height: animation1.value * 50);
                    },
                  )
                : SizedBox(),
            showLoader
                ? AnimatedBuilder(
                    animation: animation1,
                    builder: (context, child) {
                      return SpinKitThreeBounce(
                        color: AppColor.primary(),
                        size: animation1.value * 30.0,
                      );
                    },
                  )
                : SizedBox(),
            SizedBox(height: 150,),
          ],
        ),
      ),
    );
  }
}
