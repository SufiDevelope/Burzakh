import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:flutter/material.dart';

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
      height: context.mh * 0.25, // Increased height to accommodate two rows
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.04,
        vertical: context.mh * 0.02,
      ),
      decoration: const BoxDecoration(
        color: dashboardcolor,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  // DM Logo Container
                  GestureDetector(
                    onTap: onDMLogoPressed,
                    child: Container(
                      width: context.mw * 0.12,
                      height: context.mw * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(context.mw * 0.06),
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
                                'DM',
                                style: TextStyle(
                                  color: const Color(0xFF6B7A8F),
                                  fontSize: context.mh * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(context.mw * 0.06),
                              child: Image.asset(
                                imageurl ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  0.025.pw(context),

                  // Title and Subtitle Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dubai Municipality',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.015,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Cemetery Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.015,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Admin Profile Section
                  GestureDetector(
                    onTap: () => _showLogoutBottomSheet(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Admin Info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              adminName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.mh * 0.011,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              role,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: context.mh * 0.009,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        0.015.pw(context),

                        // Profile Circle
                        Container(
                          width: context.mw * 0.07,
                          height: context.mw * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(context.mw * 0.045),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.logout,
                              color: Colors.grey[600],
                              size: context.mh * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Second Row - Action Buttons
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Language Toggle Button
                  GestureDetector(
                    onTap: onLanguagePressed,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.03,
                        vertical: context.mh * 0.008,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'EN',
                            style: TextStyle(
                              color: isArabicSelected
                                  ? Colors.white.withOpacity(0.7)
                                  : Colors.white,
                              fontSize: context.mh * 0.012,
                              fontWeight: isArabicSelected
                                  ? FontWeight.w400
                                  : FontWeight.w600,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: context.mw * 0.015),
                            width: 1,
                            height: context.mh * 0.015,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          Text(
                            'العربية',
                            style: TextStyle(
                              color: isArabicSelected
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.7),
                              fontSize: context.mh * 0.012,
                              fontWeight: isArabicSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  0.015.pw(context),

                  // // Reports Button
                  // GestureDetector(
                  //   onTap: onReportsPressed,
                  //   child: Container(
                  //     width: context.mw * 0.08,
                  //     height: context.mw * 0.08,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.2),
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(
                  //         color: Colors.white.withOpacity(0.3),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     child: Icon(
                  //       Icons.description_outlined,
                  //       color: Colors.white,
                  //       size: context.mh * 0.02,
                  //     ),
                  //   ),
                  // ),
                  // 0.015.pw(context),

                  // // Documents Button
                  // GestureDetector(
                  //   onTap: onReportsPressed,
                  //   child: Container(
                  //     width: context.mw * 0.08,
                  //     height: context.mw * 0.08,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.2),
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(
                  //         color: Colors.white.withOpacity(0.3),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     child: Icon(
                  //       Icons.folder_outlined,
                  //       color: Colors.white,
                  //       size: context.mh * 0.02,
                  //     ),
                  //   ),
                  // ),
                  // 0.015.pw(context),

                  // // Messages Button with Notification Badge
                  // GestureDetector(
                  //   onTap: onMessagesPressed,
                  //   child: Container(
                  //     width: context.mw * 0.08,
                  //     height: context.mw * 0.08,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.2),
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(
                  //         color: Colors.white.withOpacity(0.3),
                  //         width: 1,
                  //       ),
                  //     ),
                  //     child: Stack(
                  //       children: [
                  //         Center(
                  //           child: Icon(
                  //             Icons.chat_bubble_outline,
                  //             color: Colors.white,
                  //             size: context.mh * 0.02,
                  //           ),
                  //         ),
                  //         if (notificationCount > 0)
                  //           Positioned(
                  //             top: context.mh * 0.008,
                  //             right: context.mw * 0.008,
                  //             child: Container(
                  //               width: context.mw * 0.025,
                  //               height: context.mw * 0.025,
                  //               decoration: const BoxDecoration(
                  //                 color: Colors.red,
                  //                 shape: BoxShape.circle,
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   notificationCount > 99
                  //                       ? '99+'
                  //                       : notificationCount.toString(),
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: context.mh * 0.008,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
