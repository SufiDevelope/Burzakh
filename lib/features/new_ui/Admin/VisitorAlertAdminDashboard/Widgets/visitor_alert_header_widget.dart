import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/select_language_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitorAlertHeadingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onToolsPressed;
  final VoidCallback? onSettingsPressed;
  final int notificationCount;
  final bool isArabic;

  const VisitorAlertHeadingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onNotificationPressed,
    this.onToolsPressed,
    this.onSettingsPressed,
    this.notificationCount = 0,
    this.isArabic = false,
  });

  @override
  Widget build(BuildContext context) {
     final LocalizationGetx controller = Get.find<LocalizationGetx>();
    void _showLanguageSelectionCustom() {
      LanguageSelectionBottomSheet.show(
        context,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        selectedColor: Color(0xFFad8443),
        borderColor: Colors.white.withOpacity(0.3),
        borderRadius: 20,
      );
    }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02, vertical: context.mh * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.05, vertical: context.mh * 0.025),
      child: Row(
        children: [
          // Left side content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Row(
                  children: [
                    Text(
                      StringTranslateExtension(title).tr(),
                      style: TextStyle(
                        fontSize: context.mh * 0.022,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    0.01.pw(context),
                    GestureDetector(
                      onTap: _showLanguageSelectionCustom,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.03,
                            vertical: context.mh * 0.01),
                        decoration: BoxDecoration(
                          color: const Color(0xFFf1eade),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFf1eade),
                            width: 1,
                          ),
                        ),
                        child: Text(
                           controller.lang.value.languageCode != 'ar' ? 'EN' : 'عر',
                          style: TextStyle(
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFad8443),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                0.005.ph(context),
                // Subtitle
                Text(
                  StringTranslateExtension(subtitle).tr(),
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: const Color(0xFF6B7280),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          // Right side - Arabic text

          0.015.pw(context),

          // Notification icon
          GestureDetector(
            onTap: onNotificationPressed,
            child: Container(
              padding: EdgeInsets.all(context.mw * 0.022),
              decoration: BoxDecoration(
                color: const Color(0xFFf1eade),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFf1eade),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: const Color(0xFFad8443),
                size: context.mh * 0.02,
              ),
            ),
          ),
          0.015.pw(context),

          // Tools/Construction icon
          GestureDetector(
            onTap: onToolsPressed,
            child: Container(
              padding: EdgeInsets.all(context.mw * 0.022),
              decoration: BoxDecoration(
                color: const Color(0xFFe6e6e6),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFe6e6e6),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.person_off,
               color: const Color(0xFF4b6fa5),
                size: context.mh * 0.02,
              ),
            ),
          ),
          0.015.pw(context),

          // Settings icon
          GestureDetector(
            onTap: onSettingsPressed,
            child: Container(
              padding: EdgeInsets.all(context.mw * 0.022),
              decoration: BoxDecoration(
                color: const Color(0xFFf1eade),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFf1eade),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.settings_outlined,
               color: const Color(0xFFad8443),
                size: context.mh * 0.02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
