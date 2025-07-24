import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuickActionsDialog extends StatelessWidget {
  final VoidCallback? onIssueReleaseForm;
  final VoidCallback? onScheduleVideoCall;
  final VoidCallback? onRequestDocuments;
  final VoidCallback? onAssignToOfficer;
  final VoidCallback? onClose;

  const QuickActionsDialog({
    super.key,
    this.onIssueReleaseForm,
    this.onScheduleVideoCall,
    this.onRequestDocuments,
    this.onAssignToOfficer,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.05),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quick Actions".tr(),
                    style: TextStyle(
                      fontSize: context.mh * 0.022,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: onClose ?? () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close,
                      size: context.mh * 0.025,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(context.mw * 0.05),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onScheduleVideoCall,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.mw * 0.04),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00734B),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: context.mw * 0.1,
                            height: context.mw * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.video_call,
                              color: Colors.white,
                              size: context.mh * 0.022,
                            ),
                          ),
                          0.04.pw(context),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Video Call".tr(),
                                  style: TextStyle(
                                    fontSize: context.mh * 0.018,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                0.005.ph(context),
                                Text(
                                  "Schedule a video verification call with the applicant".tr(),
                                  style: TextStyle(
                                    fontSize: context.mh * 0.014,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  0.02.ph(context),

                  // Request Additional Documents
                  _buildActionItem(
                    context: context,
                    icon: Icons.file_copy,
                    title: "Request Additional Documents",
                    description: "Request more documents from the applicant",
                    onTap: onRequestDocuments,
                  ),

                  0.02.ph(context),

                  // // Assign to Officer
                  // _buildActionItem(
                  //   context: context,
                  //   icon: Icons.person,
                  //   title: "Assign to Officer",
                  //   description: "Assign this case to a specific officer",
                  //   onTap: onAssignToOfficer,
                  // ),
                  // Send Notification
                  _buildActionItem(
                    context: context,
                    icon: Icons.notifications,
                    title: "Send Notification",
                    description: "Send a notification to the applicant",
                    onTap: onAssignToOfficer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(context.mw * 0.04),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: context.mw * 0.1,
              height: context.mw * 0.1,
              decoration: BoxDecoration(
                color: const Color(0xFF00734B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: context.mh * 0.022,
              ),
            ),
            0.04.pw(context),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr(),
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  0.005.ph(context),
                  Text(
                    description.tr(),
                    style: TextStyle(
                      fontSize: context.mh * 0.014,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Static method to show the dialog
  static void show(
    BuildContext context, {
    VoidCallback? onIssueReleaseForm,
    VoidCallback? onScheduleVideoCall,
    VoidCallback? onRequestDocuments,
    VoidCallback? onAssignToOfficer,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return QuickActionsDialog(
          onIssueReleaseForm: onIssueReleaseForm,
          onScheduleVideoCall: onScheduleVideoCall,
          onRequestDocuments: onRequestDocuments,
          onAssignToOfficer: onAssignToOfficer,
        );
      },
    );
  }
}
