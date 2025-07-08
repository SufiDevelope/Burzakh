import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/create_visitor_alert_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/visitor_alert_portal_dialog.dart';
import 'package:flutter/material.dart';

class CementryDashboardHeaderWidget extends StatelessWidget {
  final String initails;
  final String adminname;
  final VoidCallback? onLogoutPressed;
  const CementryDashboardHeaderWidget(
      {super.key,
      required this.initails,
      required this.adminname,
      this.onLogoutPressed});

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
                      const Color(0xFF4F46E5),
                      const Color(0xFF7C3AED),
                      const Color(0xFF059669)
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
                "Cemetery Admin",
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
                    backgroundColor: const Color(0xFF4F46E5),
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
      width: context.mw,
      margin: EdgeInsets.all(context.mw * 0.025),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(context.mw * 0.04),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: context.mw * 0.03,
            offset: Offset(0, context.mh * 0.005),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.04,
          vertical: context.mh * 0.02,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFF4F46E5),
                        Color(0xFF7C3AED),
                        Color(0xFF059669)
                      ],
                    ).createShader(bounds),
                    child: Text(
                      "Cemetery\nAdmin\nDashboard",
                      style: TextStyle(
                        fontSize: context.mh * 0.022,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            0.05.pw(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const CreateVisitorAlertDialog(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.015,
                      vertical: context.mh * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(context.mw * 0.02),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF10B981).withOpacity(0.3),
                          blurRadius: context.mw * 0.01,
                          offset: Offset(0, context.mh * 0.003),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: context.mh * 0.016,
                          color: Colors.white,
                        ),
                        SizedBox(width: context.mw * 0.008),
                        Flexible(
                          child: Text(
                            'Create Visitor Alert',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.mh * 0.012,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                0.005.ph(context),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showVisitorPortalDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.015,
                          vertical: context.mh * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7C3AED),
                          borderRadius:
                              BorderRadius.circular(context.mw * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7C3AED).withOpacity(0.3),
                              blurRadius: context.mw * 0.01,
                              offset: Offset(0, context.mh * 0.003),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              size: context.mh * 0.016,
                              color: Colors.white,
                            ),
                            SizedBox(width: context.mw * 0.008),
                            Flexible(
                              child: Text(
                                'View Visitor Portal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.mh * 0.012,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    0.02.pw(context),
                    GestureDetector(
                      onTap: () {
                        _showLogoutBottomSheet(context);
                      },
                      child: Icon(
                        Icons.logout,
                        color: Colors.red.shade300,
                      ),
                    ),
                  ],
                ),
                0.005.ph(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.015,
                      vertical: context.mh * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF64748B),
                      borderRadius: BorderRadius.circular(context.mw * 0.02),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF64748B).withOpacity(0.3),
                          blurRadius: context.mw * 0.01,
                          offset: Offset(0, context.mh * 0.003),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.language,
                          size: context.mh * 0.016,
                          color: Colors.white,
                        ),
                        SizedBox(width: context.mw * 0.008),
                        Text(
                          'العربية',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.012,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
