import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class CDADashboardHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String adminName;
  final String initials;
  final int notificationCount;
  final VoidCallback? onrtaLogoPressed;
  final VoidCallback? onLogoutPressed;
  final String email;
  final String? imageUrl;

  const CDADashboardHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.adminName,
    required this.initials,
    this.notificationCount = 0,
    this.onrtaLogoPressed,
    this.onLogoutPressed,
    required this.email,
    this.imageUrl,
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
                  color: Color(0xFF1e40af),
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
                    backgroundColor: Color(0xFF1e40af),
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
                      const Icon(Icons.logout, size: 20),
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
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1e40af),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // RTA Logo/Icon Container
            GestureDetector(
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
                child: imageUrl == null
                    ? Center(
                        child: Text(
                          'CDA',
                          style: TextStyle(
                            color: const Color(0xFF1e40af),
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imageUrl ?? "",
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
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  0.004.ph(context),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: context.mh * 0.010,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Notification Icon
            // if (notificationCount > 0) ...[
            //   Stack(
            //     children: [
            //       Container(
            //         width: context.mw * 0.1,
            //         height: context.mw * 0.1,
            //         decoration: BoxDecoration(
            //           color: Colors.white.withOpacity(0.2),
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         child: Icon(
            //           Icons.notifications_outlined,
            //           color: Colors.white,
            //           size: context.mh * 0.025,
            //         ),
            //       ),
            //       if (notificationCount > 0)
            //         Positioned(
            //           right: 0,
            //           top: 0,
            //           child: Container(
            //             padding: const EdgeInsets.all(4),
            //             decoration: const BoxDecoration(
            //               color: Colors.red,
            //               shape: BoxShape.circle,
            //             ),
            //             child: Text(
            //               notificationCount > 9 ? '9+' : '$notificationCount',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: context.mh * 0.01,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ),
            //     ],
            //   ),
            //   0.03.pw(context),
            // ],

            // Admin Info
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
                      'Administrator',
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

                        // Profile Circle
                        Container(
                          width: context.mw * 0.09,
                          height: context.mw * 0.09,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
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
                              initials,
                              style: TextStyle(
                                color: Color(0xFF1e40af),
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
