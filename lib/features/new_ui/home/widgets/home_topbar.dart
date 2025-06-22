import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/settings/ui/choose_support_type_screen.dart';
import 'package:burzakh/features/new_ui/settings/ui/setting_screen.dart';
import 'package:burzakh/features/notification/presentation/controller/notification_controller.dart';
import 'package:burzakh/features/notification/presentation/page/notification_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/logout_bottom_sheet.dart';
import '../../../../widgets/under_construction_dialog.dart';
import '../../../authentication/presentation/page/login.dart';

class HomeTopbar extends StatelessWidget {
  const HomeTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Welcome Section
        Expanded(
          child: _buildWelcomeSection(context),
        ),

        // Action Buttons
        _buildActionButtons(context, controller),
      ],
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    final userName =
        '${authCubit.userModel!.firstName} ${authCubit.userModel!.lastName}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: "Welcome,",
          fontSize: context.mh * 0.015,
          color: AppColor.greyLight(),
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 2),
        AppText(
          text: userName,
          fontSize: context.mh * 0.02,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget _buildActionButtons(
      BuildContext context, NotificationController controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Notification Button
        _buildNotificationButton(context, controller),
        const SizedBox(width: 12),

        // Profile Menu Button
        _buildProfileMenuButton(context),
      ],
    );
  }

  Widget _buildNotificationButton(
      BuildContext context, NotificationController controller) {
    return InkWell(
      onTap: () {
        // showDialog(
        //   context: context,
        //   builder: (context) => const UnderConstructionDialog(),
        // );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationScreen()));
      },
      child: Stack(
        children: [
          const Icon(Icons.notifications_none, size: 30),
          Obx(() {
            return Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: AppText(
                  text: controller.model.value.notifications?.length.toString() ?? '0',
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget _buildProfileMenuButton(BuildContext context) {
    return InkWell(
      onTap: () => _showProfileMenu(context),
      child: CircleAvatar(
        backgroundColor: AppColor.white(),
        child: Icon(Icons.person, color: AppColor.buttonColor),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: AppColor.blurWhiteColor(),
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColor.greyLight(),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColor.buttonColor,
                  child: AppText(
                    text: _getUserInitials(),
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text:
                            '${authCubit.userModel!.firstName} ${authCubit.userModel!.lastName}',
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 4),
                      AppText(
                        text: authCubit.userModel!.email,
                        fontSize: context.mh * 0.014,
                        color: AppColor.greyLight(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            0.03.ph(context),

            _buildMenuOption(
              icon: Icons.settings_outlined,
              title: StringTranslateExtension('App Settings').tr(),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
            ),
            0.016.ph(context),
            _buildMenuOption(
              icon: Icons.help_outline,
              title: StringTranslateExtension('Help & Support').tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseSupportTypeScreen(),
                    ));
              },
            ),
            0.016.ph(context),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    barrierColor: AppColor.blurWhiteColor(),
                    builder: (context) => const LogoutAppSheet(),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: AppText(
                  text: 'Sign Out',
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.red.withOpacity(0.3)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.greyLight1()),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColor.greyLight(), size: 20),
            const SizedBox(width: 12),
            AppText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColor.greyLight(),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  String _getUserInitials() {
    final firstName = authCubit.userModel!.firstName;
    final lastName = authCubit.userModel!.lastName;
    return '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}'
        .toUpperCase();
  }
}

var homeCubit = DiContainer().sl<HomeCubit>();
var authCubit = DiContainer().sl<AuthenticationCubit>();
