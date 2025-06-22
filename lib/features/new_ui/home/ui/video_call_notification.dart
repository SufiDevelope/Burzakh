import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:burzakh/widgets/app_text.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/custom_button.dart';

class VideoCallNotificationScreen extends StatelessWidget {
  const VideoCallNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: AppText(
          text: "Video Call Notification",
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: AppColor.black(),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.white(),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppText(
                      text: "Video Call with Dubai Police",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColor.black(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildAvatar("DP"),
                  _buildAvatar("B"),
                ],
              ),
              const SizedBox(height: 2),
              AppText(
                text: "Begin the call when you're ready.",
                color: AppColor.greyLight(),
                fontSize: 14,
              ),
              const SizedBox(height: 16),

              /// Join Button
              CustomElevatedButton(
                text: "Join",
                onPressed: () {},
                bgColor: AppColor.buttonColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),

              const SizedBox(height: 16),

              /// Info Box
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColor.whiteLight1,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Police needs to speak with you",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColor.black(),
                    ),
                    const SizedBox(height: 8),
                    AppText(
                      text:
                      "A representative from Dubai Police will initiate a video call shortly to complete the verification step for the burial permit process.",
                      fontSize: 13,
                      color: AppColor.greyLight(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        AppText(
                          text: "Time: ",
                          fontSize: 13,
                          color: AppColor.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      AppText(
                          text: "Today at 4:30 PM",
                          fontSize: 13,
                          color: AppColor.greyLight(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Note
              AppText(
                text:
                "Please stay in a quiet space with stable internet to ensure a smooth call.",
                fontSize: 13,
                color: AppColor.greyLight(),
              ),
              const SizedBox(height: 8),
              AppText(
                text:
                "This verification is a required step to complete the funeral permit process.",
                fontSize: 13,
                color: AppColor.greyLight(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper to build initials avatar
  Widget _buildAvatar(String initials) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: AppColor.blue.withOpacity(0.9),
      child: AppText(
        text: initials,
        color: AppColor.white(),
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
