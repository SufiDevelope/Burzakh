import 'dart:developer';

import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/settings/widgets/choose_supper_header_text.dart';
import 'package:burzakh/features/new_ui/settings/widgets/choose_support_topbar.dart';
import 'package:flutter/material.dart';

import '../../chat/ui/chat_screen.dart';
import '../widgets/support_types.dart';

class ChooseSupportTypeScreen extends StatelessWidget {
  const ChooseSupportTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColor.bgGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              ChooseSupportTopbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: mdWidth(context) * 1,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChooseSupperHeaderText(),
                        const SizedBox(height: 24),

                        buildSupportCard(
                          icon: Icons.shield,
                          title: "Police Support",
                          subtitle:
                              "Assistance with clearance documents, verification, and legal requirements",
                          isAvailable: true,
                          responseTime: "~15 minutes",
                          iconBgColor: Colors.blue[100]!,
                          iconColor: const Color(0xFF0B3C68),
                          onTap: () {
                            log("8934232");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    adminType: "police",
                                    name: "Police Support",
                                    id: "send-support-message",
                                    image: "",
                                  ),
                                ));
                          },
                        ),

                        // Cemetery Administration
                        buildSupportCard(
                          icon: Icons.bar_chart,
                          title: "Cemetery Administration",
                          subtitle:
                              "Burial arrangements, plot selection, and cemetery-related inquiries",
                          isAvailable: false,
                          responseTime: "~45 minutes",
                          iconBgColor: AppColor.green1,
                          iconColor: AppColor.green1,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    adminType: "cemetery",
                                    name: "Cemetery Administration",
                                    id: "send-support-message",
                                    image: "",
                                  ),
                                ));
                          },
                        ),

                        // RTA Help
                        buildSupportCard(
                          icon: Icons.directions_car,
                          title: "RTA Help",
                          subtitle:
                              "Support for road signage, directions, and transportation arrangements",
                          isAvailable: true,
                          responseTime: "~30 minutes",
                          iconBgColor: Colors.amber[500]!,
                          iconColor: Colors.amber[500]!,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    adminType: "rta",
                                    name: "RTA Help",
                                    id: "send-support-message",
                                    image: "",
                                  ),
                                ));
                          },
                        ),

                        // CDA Assistance
                        buildSupportCard(
                          icon: Icons.cloud_outlined,
                          title: "CDA Assistance",
                          subtitle:
                              "Help with mourning tent setup, facilities, and hospitality arrangements",
                          isAvailable: false,
                          responseTime: "~1 hour",
                          iconBgColor: Colors.purple[100]!,
                          iconColor: Colors.purple[700]!,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    adminType: "cda",
                                    name: "CDA Assistance",
                                    id: "send-support-message",
                                    image: "",
                                  ),
                                ));
                          },
                        ),

                        // App Support
                        buildSupportCard(
                          icon: Icons.person_outline,
                          title: "App Support",
                          subtitle:
                              "Technical assistance, document upload issues, and general inquiries",
                          isAvailable: true,
                          responseTime: "~5 minutes",
                          iconBgColor: AppColor.blue,
                          iconColor: AppColor.blue,
                          availableText: '24/7',
                          isLast: true,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                    adminType: "burzakh",
                                    name: "App Support",
                                    id: "send-support-message",
                                    image: "",
                                  ),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
