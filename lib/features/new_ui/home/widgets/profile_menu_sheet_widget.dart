import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class ProfileMenuSheet extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final VoidCallback onSettingsTap;
  final VoidCallback onSupportTap;
  final VoidCallback onLogoutTap;

  final Color? backgroundColor;
  final Color? handleColor;
  final Color? nameTextColor;
  final Color? emailTextColor;
  final Color? avatarBgColor;
  final Color? iconColor;
  final Color? logoutTextColor;
  final Color? logoutBgColor;
  final Color? logoutBorderColor;
  final Color? barrierColor;

  const ProfileMenuSheet({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.onSettingsTap,
    required this.onSupportTap,
    required this.onLogoutTap,
    this.backgroundColor,
    this.handleColor,
    this.nameTextColor,
    this.emailTextColor,
    this.avatarBgColor,
    this.iconColor,
    this.logoutTextColor,
    this.logoutBgColor,
    this.logoutBorderColor,
    this.barrierColor,
  });

  String _getUserInitials() {
    return "${firstName[0].toUpperCase()}${lastName[0].toUpperCase()}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: handleColor ?? Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),

          // Profile Header
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: avatarBgColor ?? Theme.of(context).primaryColor,
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
                      text: "$firstName $lastName",
                      fontSize: context.mh * 0.016,
                      fontWeight: FontWeight.bold,
                      color: nameTextColor ?? Colors.black,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: email,
                      fontSize: context.mh * 0.014,
                      color: emailTextColor ?? Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          0.03.ph(context),

          // Menu Options
          _buildMenuOption(
            icon: Icons.settings_outlined,
            title: 'App Settings'.tr(),
            onTap: onSettingsTap,
            iconColor: iconColor,
          ),
          0.016.ph(context),
          _buildMenuOption(
            icon: Icons.help_outline,
            title: 'Help & Support'.tr(),
            onTap: onSupportTap,
            iconColor: iconColor,
          ),
          0.016.ph(context),

          // Logout Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onLogoutTap,
              icon: Icon(Icons.logout, color: logoutTextColor ?? Colors.red),
              label: AppText(
                text: 'Sign Out',
                color: logoutTextColor ?? Colors.red,
                fontWeight: FontWeight.w600,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: logoutBgColor ?? Colors.red.withOpacity(0.1),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: logoutBorderColor ?? Colors.red.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor ?? Colors.black),
      title: AppText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
