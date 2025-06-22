import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/notification/presentation/controller/notification_controller.dart';
import 'package:burzakh/features/notification/presentation/widgets/approved_request_container.dart';
import 'package:burzakh/features/notification/presentation/widgets/notification_join_call_widget.dart';
import 'package:burzakh/features/notification/presentation/widgets/police_call_notification_widget.dart';
import 'package:burzakh/features/notification/presentation/widgets/police_clearance_issued_container.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final controller = Get.put(NotificationController());
  @override
  initState() {
    super.initState();
    controller.getNotifs();
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = EasyLocalization.of(context)!.locale;

    return Scaffold(
      backgroundColor: AppColor.bgPrimary(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getNotifs();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenPaddingHori, vertical: screenPaddingHori),
              child: Column(
                children: [
                  CustomTopBar(text: "Notification"),
                  SizedBox(
                    height: commonTopMargin,
                  ),
                  Obx(() {
                    if (controller.rxRequestStatusForAllCassesCount.value ==
                        Status.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller
                            .rxRequestStatusForAllCassesCount.value ==
                        Status.error) {
                      return const Center(child: Text("Error"));
                    } else if (controller
                            .rxRequestStatusForAllCassesCount.value ==
                        Status.completed) {
                      final notifications =
                          controller.model.value.notifications ?? [];

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          final langCode = currentLocale.languageCode;
                          final translatedMessage = notif.translations != null
                              ? notif.translations![langCode] ?? notif.message
                              : notif.message;

                          return ApprovedRequestContainer(
                            title: "Burzakh",
                            description: translatedMessage ?? "",
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("No Data"));
                    }
                  }),

                  // PoliceClearanceIssuedContainer(),
                  // NotificationJoinCallWidget(),
                  // PoliceCallNotificationWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
