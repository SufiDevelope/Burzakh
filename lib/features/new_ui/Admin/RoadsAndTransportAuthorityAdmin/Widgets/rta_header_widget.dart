import 'dart:io';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/select_language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class RTADashboardHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String adminName;
  final String initials;
  final String email;
  final int notificationCount;
  final VoidCallback? onrtaLogoPressed;
  final VoidCallback? onLogoutPressed;
  final String? imageurl;
  final bool flag;

  const RTADashboardHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.adminName,
    required this.initials,
    required this.email,
    this.notificationCount = 0,
    this.onrtaLogoPressed,
    this.onLogoutPressed,
    this.imageurl,
    required this.flag,
  });

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(context.mw * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bottom sheet handle
              Container(
                width: context.mw * 0.12,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              0.03.ph(context),

              // Profile section
              Container(
                width: context.mw * 0.2,
                height: context.mw * 0.2,
                decoration: BoxDecoration(
                  color: const Color(0xFFbd4753),
                  borderRadius: BorderRadius.circular(context.mw * 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              0.02.ph(context),

              // Admin name
              Text(
                adminName,
                style: TextStyle(
                  fontSize: context.mh * 0.02,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              0.01.ph(context),

              // Email
              Text(
                email,
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              0.03.ph(context),

              // Divider
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              0.02.ph(context),

              // Logout button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (onLogoutPressed != null) {
                      onLogoutPressed!();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFbd4753),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: context.mh * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      ),
                      0.02.pw(context),
                      Text(
                        StringTranslateExtension('Logout').tr(),
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              0.02.ph(context),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationGetx controller = Get.find<LocalizationGetx>();
    void _showLanguageSelectionCustom() {
      LanguageSelectionBottomSheet.show(
        context,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        selectedColor: Color(0xFFbd4753),
        borderColor: Colors.white.withOpacity(0.3),
        borderRadius: 20,
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFbd4753),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // RTA Logo/Icon Container
            flag == true
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_new
                          : Icons.arrow_back,
                    ),
                  )
                : GestureDetector(
                    onTap: onrtaLogoPressed,
                    child: Container(
                      width: context.mw * 0.12,
                      height: context.mw * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: imageurl == null
                          ? Center(
                              child: Text(
                                'RTA',
                                style: TextStyle(
                                  color: const Color(0xFFbd4753),
                                  fontSize: context.mh * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imageurl ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
            0.03.pw(context),

            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringTranslateExtension(title).tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  0.004.ph(context),
                  Text(
                    StringTranslateExtension(subtitle).tr(),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: context.mh * 0.010,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Admin Info with Logout Button
            GestureDetector(
              onTap: () => _showLogoutBottomSheet(context),
              child: Container(
                width: context.mw * 0.42,
                padding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.02,
                  vertical: context.mh * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringTranslateExtension('Administrator').tr(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: context.mh * 0.014,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    0.005.ph(context),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            adminName,
                            maxLines: 2,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.mh * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        0.015.pw(context),
                        Obx(
                          () {
                            return GestureDetector(
                              onTap: () => _showLanguageSelectionCustom(),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.015,
                                  vertical: context.mh * 0.006,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  controller.lang.value.languageCode != 'ar'
                                      ? 'English'
                                      : "العربية",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.mh * 0.012,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        0.015.pw(context),

                        // Logout Button
                        GestureDetector(
                          onTap: () => _showLogoutBottomSheet(context),
                          child: Container(
                            width: context.mw * 0.08,
                            height: context.mw * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: context.mh * 0.018,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
