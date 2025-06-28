import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/settings/widgets/user_chat_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';

class RecentChatWidget extends StatefulWidget {
  const RecentChatWidget({super.key});

  @override
  State<RecentChatWidget> createState() => _RecentChatWidgetState();
}

class _RecentChatWidgetState extends State<RecentChatWidget> {
  bool isShowAllChat = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
          child: AppText(
            text: "Recent Messages",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[500],
            fontFamily: 'nm',
          ),
        ),
        // if (hasMessages)
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              UserChatWidget(
                  adminType: "burzakh_support",
                  id: "send-support-message",
                  name: "Burzakh Support",
                  time: '10:52 AM',
                  // image: "assets/images/png/logo.png",
                  image: "assets/images/jpg/logo.jpeg",
                  lastMessage:
                      "👋 Welcome! Let us know how we can assist you. We're here to help!"),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[100],
              ),
              UserChatWidget(
                  adminType: "police_support",
                  id: "send-support-message",
                  name: "Dubai Police",
                  time: '10:52 AM',
                  image: "assets/images/jpg/dubaipolice.jpeg",
                  lastMessage:
                      "👋 Welcome! Let us know how we can assist you. We're here to help!"),
              isShowAllChat
                  ? Column(
                      children: [
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[100],
                        ),
                        UserChatWidget(
                            adminType: "cemetery_administration",
                            id: "send-support-message",
                            name: "Cemetery Administration",
                            time: '10:52 AM',
                            image: "assets/images/jpg/grave.jpg",
                            lastMessage:
                                "👋 Welcome! Let us know how we can assist you. We're here to help!"),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[100],
                        ),
                        UserChatWidget(
                            adminType: "rta",
                            id: "send-support-message",
                            name: "RTA Help",
                            time: '10:52 AM',
                            image: "assets/images/png/rtalogo.png",
                            lastMessage:
                                "👋 Welcome! Let us know how we can assist you. We're here to help!"),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[100],
                        ),
                        UserChatWidget(
                            adminType: "cda",
                            id: "send-support-message",
                            name: "CDA Assistance",
                            time: '10:52 AM',
                            image: "assets/images/png/cdalogo.png",
                            lastMessage:
                                "👋 Welcome! Let us know how we can assist you. We're here to help!"),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
        // else
        //   Container(
        //     padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(16),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.05),
        //           blurRadius: 8,
        //           offset: const Offset(0, 2),
        //         ),
        //       ],
        //     ),
        //     child: Center(
        //       child: Column(
        //         children: [
        //           Container(
        //             width: 48,
        //             height: 48,
        //             decoration: BoxDecoration(
        //               color: Colors.grey[100],
        //               shape: BoxShape.circle,
        //             ),
        //             child: Icon(
        //               Icons.notifications,
        //               size: 20,
        //               color: Colors.grey[400],
        //             ),
        //           ),
        //           const SizedBox(height: 12),
        //           Text(
        //             "You have no messages yet. We'll notify you here once there's progress.",
        //             style: TextStyle(
        //               fontSize: 14,
        //               color: Colors.grey[500],
        //             ),
        //             textAlign: TextAlign.center,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),

        0.016.ph(context),

        !isShowAllChat
            ? CustomElevatedButton(
                onPressed: () {
                  setState(() {
                    isShowAllChat = true;
                  });
                },
                text: "View All Messages",
                fontSize: context.mh * 0.016,
                height: context.mh * 0.06,
              )
            : SizedBox(),

        // App Info
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                children: [
                  AppText(
                    text: "Burzakh Premium App v2.1.0",
                    fontSize: context.mh * 0.013,
                    color: Colors.grey[500],
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: "© 2025 Dubai Islamic Affairs",
                    fontSize: context.mh * 0.012,
                    color: Colors.grey[500],
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
