import 'dart:developer';

import 'package:burzakh/core/app/myapp.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_widgets_size.dart';
import '../../../../core/app/di_container.dart';
import '../../../../core/localization/localization_getx.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../authentication/presentation/controller/cubit.dart';

class Onboarding003 extends StatefulWidget {
   Onboarding003({Key? key,this.isFromSetting=false}) : super(key: key);
bool? isFromSetting;
  @override
  State<Onboarding003> createState() => _Onboarding003State();
}

class _Onboarding003State extends State<Onboarding003>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  String selectedLanguage = 'English';
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'EN'},
    {'name': 'العربية', 'code': 'AR'},
    {'name': 'اردو', 'code': 'UR'},
    {'name': 'Русский', 'code': 'RU'},
    {'name': '中文', 'code': 'ZH'},
    {'name': 'മലയാളം', 'code': 'ML'},
  ];

  @override
  void initState() {
    super.initState();
    var localizationController = Get.find<LocalizationGetx>();
    log("64328327  ${localizationController.lang.value.languageCode}");
    final matchedLanguage = languages.firstWhere(
          (element) => element['code']!.toLowerCase() == localizationController.lang.value.languageCode,
      orElse: () => {'name': 'English'},
    );

    selectedLanguage = matchedLanguage['name']!;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var langController=Get.find<LocalizationGetx>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: AppColor.bgGradient
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              width: 375,
              // height: 812,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(40),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        // _buildSkipButton(),
                        _buildLogoSection(),
                        _buildMainContent(),
                        widget.isFromSetting==true?   CustomElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, text: "Done"):
                        _buildFooter(),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildSkipButton() {
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: ,
  //   );
  // }

  Widget _buildLogoSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 30),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child:
                  Image.asset(AppAssets.appLogo,width: logoWidthBoarding,height: logoHeightBoarding,),

                ),
              ),
            ],
          ),
        widget.isFromSetting==true? SizedBox(): Positioned(
              top: 0,
              right: 0,
              child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: TextButton(
              onPressed: () {
                _authCubit.setFirstTime();
              navigatorKey.currentState?.pushNamedAndRemoveUntil("BurzakhEnhancedLogin", (route) => false,);
                },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFC7A876),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              child:  Text('Skip'.tr()),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: TweenAnimationBuilder<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
        builder: (context, offset, child) {
          return Transform.translate(
            offset: Offset(0, offset.dy * 20),
            child: child,
          );
        },
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: Column(
            children: [
               Text(
                'Select Your Language'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF053B30),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
               Text(
                'Choose the language you had like to use. You can change this later in settings.'.tr(),
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5F5A51),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                width: 80,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFFC7A876),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    final isSelected = language['name'] ==
                        selectedLanguage;
                    final valu = language['code'];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Locale loc = Locale(valu!.toLowerCase());
                            langController.updateUi(loc, context);
                            setState(() {
                              selectedLanguage = language['name']!;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.8),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF053B30)
                                    : const Color(0xFFAD8442)
                                    .withOpacity(0.08),
                                width: isSelected ? 1.5 : 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: isSelected
                                  ? [
                                BoxShadow(
                                  color: const Color(0xFF053B30)
                                      .withOpacity(0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Text(
                                  language['name']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1A1914),
                                  ),
                                ),
                                Text(
                                  language['code']!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF5F5A51),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: AppColor.buttonColor,
                    // gradient:  LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [AppColor.buttonColor, AppColor.buttonColor],
                    // ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF053B30).withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        _authCubit.setFirstTime();
                        navigatorKey.currentState?.pushNamedAndRemoveUntil("BurzakhEnhancedLogin", (route) => false,);

                      },
                      child:  Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Text(
                          '${"Next".tr()} →'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFC7A876).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFC7A876),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

var langController = Get.find<LocalizationGetx>();
var _authCubit=DiContainer().sl<AuthenticationCubit>();
