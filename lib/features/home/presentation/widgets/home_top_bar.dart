// ignore_for_file: must_be_immutable

import 'package:burzakh/features/onboarding/presentation/page/onboarding_03.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_widgets_size.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({
    super.key,
    required this.notificationTap,
    this.userName = "User",
  });
  
  final VoidCallback notificationTap;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Welcome message with user name
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenPaddingHori,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColor.grey().withOpacity(0.05),
              border: Border.all(
                width: 1,
                color: AppColor.grey().withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.grey().withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    color: AppColor.grey(),
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppText(
                    text: "Welcome, $userName",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontFamily: 'nr',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        SizedBox(width: 12),
        
        // Action buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Language selector
            _buildActionButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Onboarding03(showButtons: false),
                  ),
                );
              },
              child: SvgPicture.asset(
                AppAssets.languageIcon,
                color: AppColor.grey(),
                width: 18,
                height: 18,
              ),
            ),
            
            SizedBox(width: 8),
            
            // Notification button
            _buildActionButton(
              onTap: notificationTap,
              child: SvgPicture.asset(
                AppAssets.notificationIcon,
                color: AppColor.grey(),
                width: 18,
                height: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback onTap,
    required Widget child,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: AppColor.grey().withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}