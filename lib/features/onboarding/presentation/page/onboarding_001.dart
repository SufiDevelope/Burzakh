import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_003.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_widgets_size.dart';
import '../../../../core/app/myapp.dart';
import '../../../authentication/presentation/page/login.dart';
import '../../../authentication/presentation/page/login_01.dart';

class Onboarding001 extends StatefulWidget {
  const Onboarding001({Key? key}) : super(key: key);

  @override
  State<Onboarding001> createState() => _Onboarding001State();
}

class _Onboarding001State extends State<Onboarding001>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1), // Start from bottom
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start animation on first build
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColor.bgGradient),
        child: SlideTransition(
          position: _animation,
          child: SafeArea(
            child: Stack(
              children: [
                // Decorative Corner Pattern
                Positioned(
                  top: -15,
                  right: -15,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Opacity(
                      opacity: 0.03,
                      child: CustomPaint(
                        painter: DecorativePatternPainter(),
                      ),
                    ),
                  ),
                ),

                // Main Content
                SizedBox(
                  height: mdHeight(context) * 1,
                  width: mdWidth(context) * 1,
                  child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          0.01.ph(context),

                          // Logo Container
                          Column(
                            children: [
                              Image.asset(
                                
                                AppAssets.appLogo,
                                width: context.mw * 0.25,
                                height: context.mw * 0.25,
                              ),
                            ],
                          ),
                          0.01.ph(context),


                          // Gold Accent Line
                          Container(
                            width: 60,
                            height: 2,
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  const Color(0xFFB7935F).withOpacity(0.8),
                                  const Color(0xFFB7935F),
                                  const Color(0xFFB7935F).withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),

                          // Main Title
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'Compassionate Support When You Need It Most'
                                  .tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: context.mh * 0.020,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A1A),
                                height: 1.35,
                              ),
                            ),
                          ),
                          0.01.ph(context),

                          // Subtitle
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              'Honoring your loved one\'s journey with care, compassion, and Islamic guidance.'
                                  .tr(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: context.mh * 0.015,
                                height: 1.5,
                                color: Color(0xFF5F5A51),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          0.02.ph(context),


                          // Services Container
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  // Primary Services Grid
                                  SizedBox(
                                    height: 125,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: ServiceCard(
                                              icon: Icons.description_outlined,
                                              title: 'Document Processing'.tr(),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: ServiceCard(
                                            icon: Icons.security_outlined,
                                            title: 'Authority Clearances'.tr(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  // Secondary Services Grid
                                  SizedBox(
                                    height: 125,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ServiceCard(
                                            icon: Icons.location_city_outlined,
                                            title: 'Cemetery Services'.tr(),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: ServiceCard(
                                            icon: Icons.favorite_outline,
                                            title: 'Sadaqah Portal'.tr(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  // Featured Services Grid
                                  SizedBox(
                                    height: 125,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ServiceCard(
                                            icon: Icons.menu_book_outlined,
                                            title: 'Janazah Guidance'.tr(),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: ServiceCard(
                                            icon: Icons.flag_outlined,
                                            title: 'Emirati Services'.tr(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Button Container
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Onboarding003(),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.buttonColor,
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Next'.tr(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          // Progress Dots
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFB7935F),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFD9C9A8).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),

                // Skip Link
                Positioned(
                  top: 10,
                  right: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          _authCubit.setFirstTime();
                          navigatorKey.currentState?.pushNamedAndRemoveUntil(
                            "BurzakhEnhancedLogin",
                            (route) => false,
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFC7A876),
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        child: Text(
                          'Skip'.tr(),
                        ),
                      )
                    ],
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

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFFB7935F).withOpacity(0.2)
                : const Color(0xFFB7935F).withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.03),
              blurRadius: _isHovered ? 16 : 10,
              offset: Offset(0, _isHovered ? 4 : 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Gold accent line on hover
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      _isHovered ? const Color(0xFFB7935F) : Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFAF8F6), Color(0xFFF5F2ED)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFB7935F).withOpacity(0.15),
                      ),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 22,
                      color: const Color(0xFFB7935F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B2B2B),
                      height: 1.4,
                      letterSpacing: 0.01,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DecorativePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFB7935F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw circles
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 25, paint);

    // Draw center filled circle
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

var _authCubit = DiContainer().sl<AuthenticationCubit>();
