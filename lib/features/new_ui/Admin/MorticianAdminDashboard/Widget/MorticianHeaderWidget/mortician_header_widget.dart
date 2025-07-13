import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class MorticianDashboardHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String morticianName;
  final String initials;
  final String email;
  final int notificationCount;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onCallPressed;
  final VoidCallback? onLanguagePressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onLogoutPressed;
  final String? imageurl;
  final bool isArabic;

  const MorticianDashboardHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.morticianName,
    required this.initials,
    required this.email,
    this.notificationCount = 0,
    this.onProfilePressed,
    this.onCallPressed,
    this.onLanguagePressed,
    this.onNotificationPressed,
    this.onLogoutPressed,
    this.imageurl,
    this.isArabic = false,
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
                  color: const Color(0xFF374151),
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

              // Mortician name
              Text(
                morticianName,
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
                    backgroundColor: const Color(0xFF374151),
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
                        'Logout',
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
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02, vertical: context.mh * 0.03),
      padding: EdgeInsets.symmetric(vertical: context.mh * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF475569),
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  Icon(Icons.person_2_outlined, color: Colors.white, size: 24),
            ),
            0.02.pw(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: context.mh * 0.016,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     color: Color(0xFF059669),
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: Icon(Icons.phone_outlined, color: Colors.white, size: 16),
            // ),
            0.01.pw(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'عربي',
                style: TextStyle(
                  fontSize: context.mh * 0.013,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                ),
              ),
            ),
            0.01.pw(context),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF475569),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.notifications_none_outlined,
                  color: Colors.white, size: 16),
            ),
            0.01.pw(context),
            GestureDetector(
              onTap: () {
                _showLogoutBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  // color: Color(0xFF475569),
                  border: Border.all(color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.logout, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
