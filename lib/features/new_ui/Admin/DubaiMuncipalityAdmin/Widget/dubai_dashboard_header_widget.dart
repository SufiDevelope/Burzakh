import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DMCemeteryHeaderWidget extends StatelessWidget {
  final String adminName;
  final String initials;
  final String email;
  final String role;
  final int notificationCount;
  final VoidCallback? onDMLogoPressed;
  final VoidCallback? onLogoutPressed;
  final VoidCallback? onLanguagePressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onReportsPressed;
  final VoidCallback? onMessagesPressed;
  final String? imageurl;
  final bool isArabicSelected;
  final VoidCallback? onAmbulancePressed;

  const DMCemeteryHeaderWidget({
    super.key,
    required this.adminName,
    required this.initials,
    required this.email,
    required this.role,
    this.notificationCount = 0,
    this.onDMLogoPressed,
    this.onLogoutPressed,
    this.onLanguagePressed,
    this.onNotificationPressed,
    this.onReportsPressed,
    this.onMessagesPressed,
    this.imageurl,
    this.isArabicSelected = false,
    this.onAmbulancePressed,
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
                  color: dashboardcolor,
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

              // Role
              Text(
                role,
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
                    backgroundColor: dashboardcolor,
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
      height: context.mh * 0.22,
      width: double.infinity,
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
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mw * 0.04,
            vertical: context.mh * 0.015,
          ),
          child: Column(
            children: [
              // Top Row - Logo, Title, and Language Switcher
              Row(
                children: [
                  // Logo Section
                  Container(
                    width: context.mw * 0.12, // Slightly smaller
                    height: context.mw * 0.12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF8A9AAE),
                          Color(0xFF6B7A8F),
                          Color(0xFF5A6B7D),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: imageurl == null
                          ? Center(
                              child: Text(
                                'DM',
                                style: TextStyle(
                                  color: const Color(0xFF6B7A8F),
                                  fontSize: context.mh * 0.018,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Image.asset(
                                imageurl!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                    ),
                  ),

                  SizedBox(width: context.mw * 0.03),

                  // Title Section - More Compact
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dubai Municipality Cemetery Services',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: context.mh * 0.002),
                        Text(
                          'Burial Supervisor Dashboard',
                          style: GoogleFonts.inter(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: context.mh * 0.013,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Language Switcher - Compact
                  Container(
                    height: context.mw * 0.09,
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.025),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff596e84),
                          Color(0xff617890),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.02,
                            vertical: context.mh * 0.003,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff828f9e),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'EN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.mw * 0.028,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: context.mw * 0.015),
                        Text(
                          'العربية',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: context.mw * 0.025,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.mh * 0.015),

              // Bottom Row - User Info and Action Buttons
              Row(
                children: [
                  // User Info Section
                  Row(
                    children: [
                      0.02.pw(context),
                      Container(
                          width: context.mw * 0.1,
                          height: context.mw * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff596e84),
                                Color(0xff617890),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              initials.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.mh * 0.016,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                      SizedBox(width: context.mw * 0.025),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: context.mw * 0.32,
                            child: Text(
                              adminName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.mh * 0.015,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Text(
                            'Cemetery Admin',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: context.mh * 0.011,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Action Buttons Row - More Compact
                  Row(
                    children: [
                      _buildActionButton(
                        context: context,
                        icon: Icons.logout,
                        onTap: () => _showLogoutBottomSheet(context),
                      ),
                      SizedBox(width: context.mw * 0.02),
                      _buildActionButton(
                        context: context,
                        icon: Icons.local_hospital,
                        onTap: onAmbulancePressed ?? () {},
                      ),
                      SizedBox(width: context.mw * 0.02),
                      _buildActionButton(
                        context: context,
                        icon: Icons.notifications,
                        onTap: onNotificationPressed ?? () {},
                        hasNotification: true,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// Helper method for action buttons
  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
    bool hasNotification = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.mw * 0.1,
        height: context.mw * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff596e84),
              Color(0xff617890),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: context.mw * 0.045,
              ),
            ),
            if (hasNotification)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
