import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_dashboard_header_widget.dart';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_request_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/status_tab_widget_dubai.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/status_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';

const dashboardcolor = Color(0xFF6B7A8F);

class DubaiAdminDashboardView extends StatefulWidget {
  final String name;
  const DubaiAdminDashboardView({super.key, required this.name});

  @override
  State<DubaiAdminDashboardView> createState() =>
      _DubaiAdminDashboardViewState();
}

class _DubaiAdminDashboardViewState extends State<DubaiAdminDashboardView> {
  final controller = Get.put(DubaiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            DMCemeteryHeaderWidget(
              adminName: widget.name,
              initials: widget.name.substring(0, 2),
              email: "ahmed.alkaabi@dm.gov.ae",
              role: "Adminstrator",
              notificationCount: 3,
              isArabicSelected: false,
              onDMLogoPressed: () {},
              onLogoutPressed: () async {
                await documentCubit.logOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BurzakhEnhancedLogin(),
                  ),
                  (route) => false,
                );
              },
              onLanguagePressed: () {},
              onMessagesPressed: () {},
              onReportsPressed: () {},
              onNotificationPressed: () {},
            ),
            StatusBarWidgetDubai(
              tabs: <TabItem>[
                TabItem(
                  title: 'All',
                  count: 3,
                ),
                TabItem(
                  title: 'Pending',
                  count: 3,
                ),
                TabItem(
                  title: 'Approved',
                  count: 10,
                ),
                TabItem(
                  title: 'Rejected',
                  count: 2,
                ),
                TabItem(
                  title: 'Completed',
                  count: 2,
                ),
                TabItem(
                  title: 'Ambulance',
                  count: 2,
                ),
              ],
            ),
            0.02.ph(context),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.01, vertical: context.mh * 0.01),
                child: Obx(() {
                  return Row(
                    children: [
                      GenericStatusCardWidget(
                        title: "Today's Burials",
                        count: controller.model.value.todayBurials.toString(),
                        statusText: "",
                        lastUpdated:
                            DateFormat("dd MMM yyyy").format(DateTime.now()),
                        icon: Icons.calendar_month,
                        primaryColor: dashboardcolor,
                        backgroundColor: Colors.grey[50],
                        progressValue: 0.6,
                        onTap: () {},
                        size: context.mh * 0.033,
                        containerheight: context.mw * 0.2,
                        containerwidth: context.mw * 0.2,
                        borderRadius: 18,
                      ),
                      GenericStatusCardWidget(
                        title: "Pending",
                        count: controller.model.value.pendingCount.toString(),
                        statusText: "",
                        lastUpdated:
                            DateFormat("dd MMM yyyy").format(DateTime.now()),
                        icon: Icons.pending_actions,
                        primaryColor: dashboardcolor,
                        backgroundColor: Colors.grey[50],
                        progressValue: 0.6,
                        onTap: () {},
                        size: context.mh * 0.033,
                        containerheight: context.mw * 0.2,
                        containerwidth: context.mw * 0.2,
                        borderRadius: 18,
                      ),
                      GenericStatusCardWidget(
                        title: "Approved",
                        count: controller.model.value.approvedCount.toString(),
                        statusText: "",
                        lastUpdated:
                            DateFormat("dd MMM yyyy").format(DateTime.now()),
                        icon: Icons.timer,
                        primaryColor: dashboardcolor,
                        backgroundColor: Colors.grey[50],
                        progressValue: 0.6,
                        onTap: () {},
                        size: context.mh * 0.033,
                        containerheight: context.mw * 0.2,
                        containerwidth: context.mw * 0.2,
                        borderRadius: 18,
                      ),
                      GenericStatusCardWidget(
                        title: "Rejected",
                        count: controller.model.value.rejectedCount.toString(),
                        statusText: "",
                        lastUpdated:
                            DateFormat("dd MMM yyyy").format(DateTime.now()),
                        icon: Icons.timer,
                        primaryColor: dashboardcolor,
                        backgroundColor: Colors.grey[50],
                        progressValue: 0.6,
                        onTap: () {},
                        size: context.mh * 0.033,
                        containerheight: context.mw * 0.2,
                        containerwidth: context.mw * 0.2,
                        borderRadius: 18,
                      ),
                    ],
                  );
                })),
            0.01.ph(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
              child: DubaiFilterWidget(
                searchHint: "Search by name Cemetery or Id",
                onSearchChanged: (value) {},
              ),
            ),
            0.01.ph(context),
            Obx(() {
              switch (controller.rxRequestStatusForAllDubaiRequest.value) {
                case Status.loading:
                  return Center(child: CircularProgressIndicator());
                case Status.completed:
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.model.value.allRequests?.length ?? 0,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = controller.model.value.allRequests?[index];
                      var caseDetail = (data?.caseDetails != null &&
                              data!.caseDetails!.isNotEmpty)
                          ? data.caseDetails![0]
                          : null;

                      return BurialCardWidget(
                        name:
                            "${data?.user?.firstName ?? ''} ${data?.user?.lastName ?? ''}",
                        caseId: "BUR-${DateTime.now().year}-${data?.id}",
                        location: caseDetail?.location ?? "",
                        date: DateFormat('yyyy-MM-dd').format(
                          DateTime.parse(data?.createdAt ??
                              DateTime.now().toIso8601String()),
                        ),
                        time: data?.burialTiming ?? "",
                        status: data?.status ?? "",
                        messageCount: 2,
                        onTap: () {},
                        onMessageTap: () {},
                        relative: 'Ahmed Al Kaabi',
                        documents: [
                          "Death Certificate",
                        ],
                      );
                    },
                  );
                case Status.error:
                  return Center(child: Text("Error Loading Data"));
                default:
                  return SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();
