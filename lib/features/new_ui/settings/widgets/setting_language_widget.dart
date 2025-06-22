import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_003.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/localization/localization_getx.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class SettingLanguageWidget extends StatefulWidget {
  const SettingLanguageWidget({super.key});

  @override
  State<SettingLanguageWidget> createState() => _SettingLanguageWidgetState();
}

class _SettingLanguageWidgetState extends State<SettingLanguageWidget> {
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'EN'},
    {'name': 'العربية', 'code': 'AR'},
    {'name': 'اردو', 'code': 'UR'},
    {'name': 'Русский', 'code': 'RU'},
    {'name': '中文', 'code': 'ZH'},
    {'name': 'മലയാളം', 'code': 'ML'},
  ];

  String selectedLanguage = 'English';
  @override
  void initState() {
    var localizationController = Get.find<LocalizationGetx>();
    final matchedLanguage = languages.firstWhere(
          (element) => element['code']!.toLowerCase() == localizationController.lang.value.languageCode,
      orElse: () => {'name': 'English'},
    );

    selectedLanguage = matchedLanguage['name']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var langController=Get.find<LocalizationGetx>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
          child: AppText(text:
          "Language",
            fontSize: context.mh * 0.016,
            fontWeight: FontWeight.w500,
            color: Colors.grey[500],
            fontFamily: 'nm',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding003(isFromSetting: true,),));
          },
          child:  Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text:
                  "App Language",
                    fontSize: context.mh * 0.016,
                    color: AppColor.black(),
                  ),
                  Row(
                    children: [
                     Obx(() {
                       var localizationController = Get.find<LocalizationGetx>();
                       final matchedLanguage = languages.firstWhere(
                             (element) => element['code']!.toLowerCase() == localizationController.lang.value.languageCode,
                         orElse: () => {'name': 'English'},
                       );

                       selectedLanguage = matchedLanguage['name']!;
                       return  AppText(text:
                       "${selectedLanguage}",
                         fontSize: context.mh * 0.016,
                         color: Colors.blue[500],
                       );
                     },),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right,
                        size: 16,
                        color: Colors.blue[500],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}


var langController = Get.find<LocalizationGetx>();

