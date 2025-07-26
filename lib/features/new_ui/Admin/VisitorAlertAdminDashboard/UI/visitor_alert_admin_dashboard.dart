import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/UI/notifs_screen.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/cemetery_notifs_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/dua_widget.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/janaza_schedule_widget.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/namaz_schedule_widget.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/visitor_alert_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/visitor_alert_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';
import '../Controller/visitor_alert_controller.dart';

class VisitorAlertAdminDashboard extends StatefulWidget {
  final bool isDashboard;
  const VisitorAlertAdminDashboard({super.key, required this.isDashboard});

  @override
  State<VisitorAlertAdminDashboard> createState() =>
      _VisitorAlertAdminDashboardState();
}

class _VisitorAlertAdminDashboardState
    extends State<VisitorAlertAdminDashboard> {
  final controller = Get.put(VisitorAlertController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllCasses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f3ed),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.resetData();
          controller.getAllCasses();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              0.015.ph(context),
              VisitorAlertHeadingWidget(
                title: 'Janazah Alerts',
                subtitle: 'Community prayer schedules and spiritual reminders',
                onNotificationPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotifsScreen()));
                },
                onToolsPressed: () {
                  if (widget.isDashboard == true) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurzakhEnhancedLogin(),
                      ),
                      (route) => false,
                    );
                  }
                },
                onSettingsPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CemeteryDropdownDialog();
                    },
                  );
                },
                notificationCount: 3,
              ),
              Obx(() {
                switch (controller.rxRequestStatusForAllCassesCount.value) {
                  case Status.loading:
                    return Center(child: CircularProgressIndicator());
                  case Status.completed:
                    return Column(
                      children: [
                        0.01.ph(context),
                        VistorFilterWidget(),
                        PrayerScheduleWidget(),
                        DuaWidget(),
                        0.01.ph(context),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.model.value.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            var data = controller.model.value.data?[index];
                            return JanazaScheduleCardWidget(
                              name: data?.name ?? "",
                              arabicName: data?.name ?? "",
                              mercyText: "may Allah have mercy on him",
                              timeLabel: controller.selectedDay.value,
                              isToday: true,
                              description:
                                  "Dubai resident since 1962. Beloved community elder who dedicated his life to serving others. Known for his wisdom, kindness, and generous spirit that touched countless lives in our community.",
                              cemetery: data?.cemeteryLocation ?? "",
                              time: data?.alertTime ?? "",
                              mosque: data?.mosqueName ?? "",
                            );
                          },
                        ),
                      ],
                    );
                  case Status.error:
                    return Text("Error");
                  default:
                    return SizedBox.shrink();
                }
              }),
              0.02.ph(context),
            ],
          ),
        ),
      ),
    );
  }
}
