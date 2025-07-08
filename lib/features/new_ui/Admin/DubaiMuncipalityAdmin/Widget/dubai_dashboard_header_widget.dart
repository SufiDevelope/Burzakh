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
      height: context.mh * 0.37,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color(0xff596e84),
            Color(0xff617890),
            Color(0xff2d4159),
          ])),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.mw * 0.04),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: context.mw * 0.15,
                    height: context.mw * 0.15,
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
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
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
                                  fontSize: context.mh * 0.022,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            )
                          : Center(
                              child: Image.asset(
                                imageurl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),

                  // Text
                  0.02.pw(context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Dubai Municipality Cemetery',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: context.mh * 0.02,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              ' Services',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: context.mh * 0.02,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        0.008.ph(context),
                        Center(
                          child: Text(
                            'Burial Supervisor Dashboard',
                            style: GoogleFonts.inter(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: context.mh * 0.016,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              0.02.ph(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logout Icon Container
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showLogoutBottomSheet(context);
                        },
                        child: Container(
                          width: context.mw * 0.12,
                          height: context.mw * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff596e84),
                                Color(0xff617890),
                                // Color(0xff2d4159),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: context.mw * 0.05,
                          ),
                        ),
                      ),
                      0.02.pw(context),

                      // Ambulance Icon Container
                      GestureDetector(
                        onTap: onAmbulancePressed,
                        child: Container(
                          width: context.mw * 0.12,
                          height: context.mw * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff596e84),
                                Color(0xff617890),
                                // Color(0xff2d4159),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.local_hospital,
                            color: Colors.white,
                            size: context.mw * 0.05,
                          ),
                        ),
                      ),
                      0.02.pw(context),

                      // Notification Icon Container (with red dot)
                      GestureDetector(
                        onTap: onNotificationPressed,
                        child: Container(
                          width: context.mw * 0.12,
                          height: context.mw * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff596e84),
                                Color(0xff617890),
                                // Color(0xff2d4159),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: context.mw * 0.05,
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: context.mw * 0.12,
                    width: context.mw * 0.35,
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 2,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff596e84),
                          Color(0xff617890),
                          // Color(0xff2d4159),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.03,
                              vertical: context.mh * 0.005),
                          decoration: BoxDecoration(
                            color: Color(0xff828f9e),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'EN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.mw * 0.032,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        0.02.pw(context),
                        Text(
                          'العربية',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: context.mw * 0.028,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              0.015.ph(context),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.mw * 0.35,
                        child: Text(
                          adminName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.017,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      0.001.ph(context),
                      Text(
                        'Cementry Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.mh * 0.012,
                        ),
                      ),
                    ],
                  ),
                  0.01.pw(context),
                  Container(
                    width: context.mw * 0.12,
                    height: context.mw * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 2,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff596e84),
                          Color(0xff617890),
                          // Color(0xff2d4159),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        initials.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.mh * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
