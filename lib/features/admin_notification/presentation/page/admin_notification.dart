import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/admin_notification/presentation/widgets/new_document_submit_widget.dart';
import 'package:burzakh/features/admin_notification/presentation/widgets/resubmission_recieved_notification.dart';
import 'package:burzakh/features/notification/presentation/widgets/approved_request_container.dart';
import 'package:burzakh/features/notification/presentation/widgets/notification_join_call_widget.dart';
import 'package:burzakh/features/notification/presentation/widgets/police_call_notification_widget.dart';
import 'package:burzakh/features/notification/presentation/widgets/police_clearance_issued_container.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';

class AdminNotificationScreen extends StatelessWidget {
  const AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
            child: Column(
              children: [
                CustomTopBar(text: "Notification"),
                NewDocumentSubmitWidget(),
                ResubmissionRecievedNotification(),
                SizedBox(height: commonHeightS,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
