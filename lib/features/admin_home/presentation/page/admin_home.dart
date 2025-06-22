import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/admin_home/presentation/widgets/home_sections_widget.dart';
import 'package:burzakh/features/admin_home/presentation/widgets/welcom_admin_row.dart';
import 'package:burzakh/features/admin_notification/presentation/page/admin_notification.dart';
import 'package:burzakh/features/home/presentation/widgets/home_top_bar.dart';
import 'package:burzakh/features/home/presentation/widgets/select_resting_sheet.dart';
import 'package:burzakh/features/home/presentation/widgets/video_call_required_widget.dart';
import 'package:flutter/material.dart';

import '../../../admin_graveyard_approval/presentation/page/admin_graveyard_approval.dart';
import '../widgets/active_case_screen.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(screenPaddingHori),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopBar(notificationTap:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNotificationScreen(),));
                },),
                WelcomeAdminRow(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: HomeSectionsWidget(heading: "Active\nCases", total: '12',onTap:  () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ActiveCaseScreen(),));
                    },)),
                    SizedBox(width: heading3,),
                    Expanded(child: HomeSectionsWidget(heading: "Pending Police\nReview", total: '12')),
                  ],
                ),
                SizedBox(height: heading3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: HomeSectionsWidget(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => AdminGraveyardApproval(),));

                    },heading: "Awaiting Graveyard\nApproval", total: '12')),
                    SizedBox(width: heading3,),
                    Expanded(child: HomeSectionsWidget(heading: "Emirati Services\nRequested", total: '12')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
