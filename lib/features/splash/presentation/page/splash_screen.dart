import 'dart:async';
import 'dart:developer';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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



// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class SplashScreen extends StatefulWidget {
//   final VoidCallback? onAnimationComplete;
  
//   const SplashScreen({
//     Key? key,
//     this.onAnimationComplete,
//   }) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
  
//   late AnimationController _doorController;
//   late AnimationController _lightController;
//   late AnimationController _fadeController;
//   late AnimationController _loadingController;
  
//   late Animation<double> _leftDoorAnimation;
//   late Animation<double> _rightDoorAnimation;
//   late Animation<double> _dividerAnimation;
//   late Animation<double> _lightOpacityAnimation;
//   late Animation<double> _fadeInAnimation;
  
//   @override
//   void initState() {
//     super.initState();
    
//     // Door animation controller (6 seconds, repeating)
//     _doorController = AnimationController(
//       duration: const Duration(seconds: 6),
//       vsync: this,
//     );
    
//     // Light reveal controller (synced with doors)
//     _lightController = AnimationController(
//       duration: const Duration(seconds: 6),
//       vsync: this,
//     );
    
//     // Fade in controller for overall entrance
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );
    
//     // Loading dots controller
//     _loadingController = AnimationController(
//       duration: const Duration(milliseconds: 1400),
//       vsync: this,
//     );
    
//     // Door animations with cubic bezier curve
//     _leftDoorAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _doorController,
//       curve: const Interval(0.25, 0.75, curve: Curves.easeInOut),
//     ));
    
//     _rightDoorAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _doorController,
//       curve: const Interval(0.25, 0.75, curve: Curves.easeInOut),
//     ));
    
//     // Central divider fade
//     _dividerAnimation = Tween<double>(
//       begin: 1.0,
//       end: 0.0,
//     ).animate(CurvedAnimation(
//       parent: _doorController,
//       curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
//     ));
    
//     // Divine light opacity
//     _lightOpacityAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _lightController,
//       curve: const Interval(0.4, 0.65, curve: Curves.easeInOut),
//     ));
    
//     // Overall fade in
//     _fadeInAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeOut,
//     ));
    
//     // Start animations
//     _startAnimations();
//   }
  
//   void _startAnimations() async {
//     // Start fade in immediately
//     _fadeController.forward();
    
//     // Start door animations after short delay
//     await Future.delayed(const Duration(milliseconds: 500));
//     _doorController.repeat();
//     _lightController.repeat();
    
//     // Start loading animation
//     await Future.delayed(const Duration(milliseconds: 1500));
//     _loadingController.repeat();
    
//     // Navigate after showing the animation
//     if (widget.onAnimationComplete != null) {
//       await Future.delayed(const Duration(seconds: 8));
//       widget.onAnimationComplete!();
//     }
//   }
  
//   @override
//   void dispose() {
//     _doorController.dispose();
//     _lightController.dispose();
//     _fadeController.dispose();
//     _loadingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFFFBF7F2),
//               Color(0xFFF2EDE6),
//             ],
//           ),
//         ),
//         child: AnimatedBuilder(
//           animation: _fadeController,
//           builder: (context, child) {
//             return Opacity(
//               opacity: _fadeInAnimation.value,
//               child: Transform.translate(
//                 offset: Offset(0, 30 * (1 - _fadeInAnimation.value)),
//                 child: _buildSplashContent(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
  
//   Widget _buildSplashContent() {
//     return Stack(
//       children: [
//         // Background pattern
//         _buildBackgroundPattern(),
        
//         // Main content
//         Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Top decorative line
//               _buildDecorativeLine(),
              
//               const SizedBox(height: 20),
              
//               // Arabic text
//               const Text(
//                 'برزخ',
//                 style: TextStyle(
//                   fontFamily: 'Amiri',
//                   fontSize: 64,
//                   fontWeight: FontWeight.w700,
//                   color: Color(0xFF1A1914),
//                   height: 1.2,
//                 ),
//               ),
              
//               const SizedBox(height: 40),
              
//               // Animated arch with doors
//               _buildAnimatedArch(),
              
//               const SizedBox(height: 40),
              
//               // English text
//               const Text(
//                 'BURZAKH',
//                 style: TextStyle(
//                   fontFamily: 'Montserrat',
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF1A1914),
//                   letterSpacing: 8,
//                 ),
//               ),
              
//               const SizedBox(height: 20),
              
//               // Bottom decorative line
//               _buildDecorativeLine(),
//             ],
//           ),
//         ),
        
//         // Loading indicator at bottom
//         Positioned(
//           bottom: 80,
//           left: 0,
//           right: 0,
//           child: _buildLoadingIndicator(),
//         ),
        
//         // Corner flourishes
//         _buildCornerFlourishes(),
//       ],
//     );
//   }
  
//   Widget _buildBackgroundPattern() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: RadialGradient(
//           center: const Alignment(-0.4, -0.6),
//           radius: 1.0,
//           colors: [
//             const Color(0xFFD4AF37).withOpacity(0.05),
//             Colors.transparent,
//           ],
//         ),
//       ),
//     );
//   }
  
//   Widget _buildDecorativeLine() {
//     return Container(
//       width: 120,
//       height: 1,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [
//             Colors.transparent,
//             Color(0xFFD4AF37),
//             Colors.transparent,
//           ],
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFD4AF37).withOpacity(0.3),
//             blurRadius: 4,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//     );
//   }
  
//   Widget _buildAnimatedArch() {
//     return SizedBox(
//       width: 300,
//       height: 300,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Divine light (behind doors)
//           AnimatedBuilder(
//             animation: _lightController,
//             builder: (context, child) {
//               return Opacity(
//                 opacity: _lightOpacityAnimation.value,
//                 child: _buildDivineLight(),
//               );
//             },
//           ),
          
//           // Arch frame and doors
//           AnimatedBuilder(
//             animation: _doorController,
//             builder: (context, child) {
//               return CustomPaint(
//                 size: const Size(300, 300),
//                 painter: ArchPainter(
//                   leftDoorRotation: _leftDoorAnimation.value * -30 * math.pi / 180,
//                   rightDoorRotation: _rightDoorAnimation.value * 30 * math.pi / 180,
//                   dividerOpacity: _dividerAnimation.value,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
  
//   Widget _buildDivineLight() {
//     return SizedBox(
//       width: 200,
//       height: 200,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Central bright point
//           Container(
//             width: 16,
//             height: 16,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: const RadialGradient(
//                 colors: [
//                   Colors.white,
//                   Color(0xFFFFF8E1),
//                   Color(0xFFF4E19C),
//                   Colors.transparent,
//                 ],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.white.withOpacity(0.9),
//                   blurRadius: 20,
//                   spreadRadius: 5,
//                 ),
//               ],
//             ),
//           ),
          
//           // Light rays
//           ...List.generate(12, (index) {
//             final angle = (index * 30.0) * math.pi / 180;
//             return Transform.rotate(
//               angle: angle,
//               child: _buildLightRay(index),
//             );
//           }),
//         ],
//       ),
//     );
//   }
  
//   Widget _buildLightRay(int index) {
//     // Different ray sizes based on index
//     double width;
//     double height;
//     List<Color> colors;
    
//     if (index == 0 || index == 6) {
//       // Main rays
//       width = 120;
//       height = 4;
//       colors = [
//         Colors.white,
//         const Color(0xFFFFF8E1).withOpacity(0.9),
//         const Color(0xFFF4E19C).withOpacity(0.7),
//         const Color(0xFFD4AF37).withOpacity(0.3),
//         Colors.transparent,
//       ];
//     } else if (index == 1 || index == 5 || index == 7 || index == 11) {
//       // Secondary rays
//       width = 100;
//       height = 3;
//       colors = [
//         Colors.white.withOpacity(0.9),
//         const Color(0xFFFFF8E1).withOpacity(0.8),
//         const Color(0xFFF4E19C).withOpacity(0.6),
//         const Color(0xFFD4AF37).withOpacity(0.2),
//         Colors.transparent,
//       ];
//     } else {
//       // Tertiary rays
//       width = 80;
//       height = 2;
//       colors = [
//         Colors.white.withOpacity(0.8),
//         const Color(0xFFFFF8E1).withOpacity(0.7),
//         const Color(0xFFF4E19C).withOpacity(0.5),
//         Colors.transparent,
//       ];
//     }
    
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: colors,
//         ),
//         borderRadius: BorderRadius.circular(height / 2),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white.withOpacity(0.6),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//     );
//   }
  
//   Widget _buildLoadingIndicator() {
//     return AnimatedBuilder(
//       animation: _loadingController,
//       builder: (context, child) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Loading dots
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(3, (index) {
//                 final delay = index * 0.2;
//                 final animation = Tween<double>(begin: 0.8, end: 1.2).animate(
//                   CurvedAnimation(
//                     parent: _loadingController,
//                     curve: Interval(delay, delay + 0.4, curve: Curves.easeInOut),
//                   ),
//                 );
                
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: Transform.scale(
//                     scale: animation.value,
//                     child: Container(
//                       width: 8,
//                       height: 8,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: LinearGradient(
//                           colors: [Color(0xFFD4AF37), Color(0xFFF4E19C)],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
            
//             const SizedBox(height: 15),
            
//             // Loading text
//             const Text(
//               'LOADING',
//               style: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF5F5A51),
//                 letterSpacing: 2,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
  
//   Widget _buildCornerFlourishes() {
//     return Stack(
//       children: [
//         // Top left
//         Positioned(
//           top: 40,
//           left: 40,
//           child: _buildCornerFlourish(true, true),
//         ),
//         // Top right
//         Positioned(
//           top: 40,
//           right: 40,
//           child: _buildCornerFlourish(true, false),
//         ),
//         // Bottom left
//         Positioned(
//           bottom: 40,
//           left: 40,
//           child: _buildCornerFlourish(false, true),
//         ),
//         // Bottom right
//         Positioned(
//           bottom: 40,
//           right: 40,
//           child: _buildCornerFlourish(false, false),
//         ),
//       ],
//     );
//   }
  
//   Widget _buildCornerFlourish(bool isTop, bool isLeft) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         border: Border(
//           top: isTop ? const BorderSide(color: Color(0xFFD4AF37), width: 2) : BorderSide.none,
//           bottom: !isTop ? const BorderSide(color: Color(0xFFD4AF37), width: 2) : BorderSide.none,
//           left: isLeft ? const BorderSide(color: Color(0xFFD4AF37), width: 2) : BorderSide.none,
//           right: !isLeft ? const BorderSide(color: Color(0xFFD4AF37), width: 2) : BorderSide.none,
//         ),
//         borderRadius: BorderRadius.only(
//           topLeft: isTop && isLeft ? const Radius.circular(8) : Radius.zero,
//           topRight: isTop && !isLeft ? const Radius.circular(8) : Radius.zero,
//           bottomLeft: !isTop && isLeft ? const Radius.circular(8) : Radius.zero,
//           bottomRight: !isTop && !isLeft ? const Radius.circular(8) : Radius.zero,
//         ),
//       ),
//     );
//   }
// }

// class ArchPainter extends CustomPainter {
//   final double leftDoorRotation;
//   final double rightDoorRotation;
//   final double dividerOpacity;
  
//   ArchPainter({
//     required this.leftDoorRotation,
//     required this.rightDoorRotation,
//     required this.dividerOpacity,
//   });
  
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final scale = size.width / 350; // Scale factor for different sizes
    
//     // Gold gradient paint
//     final goldPaint = Paint()
//       ..shader = const LinearGradient(
//         colors: [
//           Color(0xFFD4AF37),
//           Color(0xFFF4E19C),
//           Color(0xFFD4AF37),
//         ],
//       ).createShader(Rect.fromCenter(center: center, width: size.width, height: size.height));
    
//     // Emerald gradient paint
//     final emeraldPaint = Paint()
//       ..shader = LinearGradient(
//         colors: [
//           const Color(0xFF053B30).withOpacity(0.8),
//           const Color(0xFF0F4A3C).withOpacity(0.8),
//         ],
//       ).createShader(Rect.fromCenter(center: center, width: size.width, height: size.height));
    
//     // Save canvas state
//     canvas.save();
//     canvas.translate(center.dx, center.dy);
//     canvas.scale(scale);
    
//     // Draw main arch frame
//     final archPath = Path()
//       ..moveTo(-175, -125)
//       ..quadraticBezierTo(-175, -225, 0, -300)
//       ..quadraticBezierTo(175, -225, 175, -125)
//       ..lineTo(175, 175)
//       ..lineTo(125, 175)
//       ..lineTo(125, -115)
//       ..quadraticBezierTo(125, -195, 0, -245)
//       ..quadraticBezierTo(-125, -195, -125, -115)
//       ..lineTo(-125, 175)
//       ..lineTo(-175, 175)
//       ..close();
    
//     canvas.drawPath(archPath, goldPaint);
    
//     // Draw left door (animated)
//     canvas.save();
//     canvas.translate(-100, 0);
//     canvas.rotate(leftDoorRotation);
//     canvas.translate(100, 0);
    
//     final leftDoorPath = Path()
//       ..moveTo(-100, -100)
//       ..quadraticBezierTo(-100, -175, -60, -215)
//       ..lineTo(0, -215)
//       ..lineTo(0, 150)
//       ..lineTo(-100, 150)
//       ..close();
    
//     canvas.drawPath(leftDoorPath, emeraldPaint);
    
//     // Left door handle
//     canvas.drawCircle(const Offset(-35, 0), 8, goldPaint);
    
//     canvas.restore();
    
//     // Draw right door (animated)
//     canvas.save();
//     canvas.translate(100, 0);
//     canvas.rotate(rightDoorRotation);
//     canvas.translate(-100, 0);
    
//     final rightDoorPath = Path()
//       ..moveTo(0, -215)
//       ..lineTo(60, -215)
//       ..quadraticBezierTo(100, -175, 100, -100)
//       ..lineTo(100, 150)
//       ..lineTo(0, 150)
//       ..close();
    
//     canvas.drawPath(rightDoorPath, emeraldPaint);
    
//     // Right door handle
//     canvas.drawCircle(const Offset(35, 0), 8, goldPaint);
    
//     canvas.restore();
    
//     // Draw central divider (fades during animation)
//     final dividerPaint = Paint()
//       ..color = const Color(0xFFD4AF37).withOpacity(dividerOpacity);
    
//     canvas.drawRect(
//       const Rect.fromLTWH(-5, -215, 10, 365),
//       dividerPaint,
//     );
    
//     canvas.restore();
//   }
  
//   @override
//   bool shouldRepaint(ArchPainter oldDelegate) {
//     return oldDelegate.leftDoorRotation != leftDoorRotation ||
//            oldDelegate.rightDoorRotation != rightDoorRotation ||
//            oldDelegate.dividerOpacity != dividerOpacity;
//   }
// }
