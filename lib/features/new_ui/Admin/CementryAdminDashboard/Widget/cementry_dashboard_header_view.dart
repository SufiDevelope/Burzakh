import 'dart:io';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/create_visitor_alert_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/select_language_bottom_sheet.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/UI/visitor_alert_admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class CementryDashboardHeaderWidget extends StatelessWidget {
  final String initails;
  final String adminname;
  final VoidCallback? onLogoutPressed;
  final bool flag;
  const CementryDashboardHeaderWidget(
      {super.key,
      required this.initails,
      required this.adminname,
      this.onLogoutPressed,
      required this.flag});

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
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff596e84),
                      Color(0xff617890),
                      Color(0xff2d4159),
                    ],
                  ),
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
                    initails,
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
                adminname,
                style: TextStyle(
                  fontSize: context.mh * 0.02,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              0.01.ph(context),

              // Role
              Text(
                StringTranslateExtension("Cemetery Admin").tr(),
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
                    backgroundColor: Color(0xff2d4159),
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
                        StringTranslateExtension("Logout").tr(),
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
        selectedColor: Color(0xff2d4159),
        borderColor: Colors.white.withOpacity(0.3),
        borderRadius: 20,
      );
    }

    return Container(
      width: context.mw,
      height: context.mh * 0.15,
      margin: EdgeInsets.all(context.mw * 0.025),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff596e84),
            Color(0xff617890),
            Color(0xff2d4159),
          ],
        ),
        borderRadius: BorderRadius.circular(context.mw * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: context.mw * 0.04,
            offset: Offset(0, context.mh * 0.008),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.04,
          vertical: context.mh * 0.015,
        ),
        child: Row(
          children: [
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
                : Container(),
            // Left Side - Title Section
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringTranslateExtension("Cemetery Admin Dashboard").tr(),
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1.2,
                      letterSpacing: 0.5,
                    ),
                  ),
                  0.01.ph(context),
                  Text(
                    adminname,
                    style: TextStyle(
                      fontSize: context.mh * 0.013,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            0.04.pw(context),

            // Right Side - Action Buttons
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First Row - Create Visitor Alert
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          context: context,
                          icon: Icons.chat_bubble_outline,
                          text: 'Create Visitor Alert',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  const CreateVisitorAlertDialog(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  0.01.ph(context),

                  // Second Row - Multiple Actions
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          context: context,
                          icon: Icons.remove_red_eye_outlined,
                          text: 'Visitor Portal',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VisitorAlertAdminDashboard(
                                  isDashboard: true,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      0.02.pw(context),
                      Obx(() {
                        return _buildSquareIconButton(
                          context: context,
                          icon: Icons.language,
                          text: controller.lang.value.languageCode != 'ar'
                              ? 'English'
                              : 'العربية',
                          onTap: () {
                            _showLanguageSelectionCustom();
                          },
                        );
                      }),
                      0.02.pw(context),
                      _buildSquareIconButton(
                        context: context,
                        icon: Icons.logout,
                        onTap: () {
                          _showLogoutBottomSheet(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper method for full action buttons
  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02,
          vertical: context.mh * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(context.mw * 0.025),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: context.mw * 0.015,
              offset: Offset(0, context.mh * 0.005),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: context.mh * 0.018,
              color: Colors.white,
            ),
            SizedBox(width: context.mw * 0.01),
            Flexible(
              child: Text(
                StringTranslateExtension(text).tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.mh * 0.013,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

// Helper method for square icon buttons
  Widget _buildSquareIconButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
    String? text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.mw * 0.07,
        height: context.mw * 0.07,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(context.mw * 0.02),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: context.mw * 0.015,
              offset: Offset(0, context.mh * 0.005),
            ),
          ],
        ),
        child: text != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: context.mh * 0.012,
                    color: Colors.white,
                  ),
                  0.003.ph(context),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.008,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Icon(
                icon,
                size: context.mh * 0.014,
                color: Colors.white,
              ),
      ),
    );
  }
}
