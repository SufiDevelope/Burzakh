import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/request_details_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/rta_chat_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/admin_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/dashboard_overview_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/filter_list_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/rta_header_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/status_bar_widget_rta.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/status_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RtaDashboardView extends StatefulWidget {
  final String name;
  final bool flag;
  const RtaDashboardView({super.key, required this.name, required this.flag});

  @override
  State<RtaDashboardView> createState() => _RtaDashboardViewState();
}

class _RtaDashboardViewState extends State<RtaDashboardView> {
  var selectectRange = TimeRange.week;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RtaController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getRequestApi();
          controller.filterRtaRequestApi("None");
          controller.resetToFirst();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              RTADashboardHeaderWidget(
                title: "Roads and Transport Authority",
                subtitle: "Road Sign Services Administration",
                adminName: widget.name,
                initials:
                    widget.name.split(" ").map((e) => e[0]).take(2).join(),
                notificationCount: 3,
                onrtaLogoPressed: () async {},
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
                email: '',
                imageurl: "assets/images/png/rtalogo.png", flag: widget.flag,
              ),
              Obx(() {
                return GenericDashboardOverviewWidget(
                  title: "Dashboard Overview",
                  selectedTimeRange: controller.selectedTimeRange.value,
                  onTimeRangeChanged: (TimeRange range) {
                    controller.updateTimeRange(range);
                  },
                  selectedColor: Color(0xFFbd4753),
                );
              }),
              Padding(
                padding: EdgeInsets.all(context.mw * 0.02),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () {
                      if (controller.rxRequestStatusForAllRtaRequest.value ==
                          Status.loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (controller
                              .rxRequestStatusForAllRtaRequest.value ==
                          Status.completed) {
                        return Row(
                          children: [
                            GenericStatusCardWidget(
                              title: "Pending Requests",
                              count: controller.model.value.pendingCount
                                  .toString(),
                              statusText: "Needs approval",
                              lastUpdated: DateFormat("dd MMM yyyy")
                                  .format(DateTime.now()),
                              icon: Icons.description_outlined,
                              primaryColor: Color(0xFFbd4753),
                              backgroundColor: Colors.grey[50],
                              progressValue: 0.6,
                              onTap: () {},
                            ),
                            GenericStatusCardWidget(
                              title: "Approved",
                              count: controller.model.value.approvedCount
                                  .toString(),
                              statusText: "Approved",
                              lastUpdated: "",
                              icon: Icons.check,
                              primaryColor: Colors.green,
                              backgroundColor: Colors.grey[50],
                              progressValue: 0.6,
                              onTap: () {},
                            ),
                            GenericStatusCardWidget(
                              title: "Rejected",
                              count: controller.model.value.rejectedCount
                                  .toString(),
                              statusText: "This Week",
                              lastUpdated: "",
                              icon: Icons.close,
                              primaryColor: Color(0xFFbd4753),
                              backgroundColor: Colors.grey[50],
                              progressValue: 0.6,
                              onTap: () {},
                            ),
                            GenericStatusCardWidget(
                              title: "Response Time",
                              count:
                                  controller.model.value.todayTent.toString(),
                              statusText: "This Week",
                              lastUpdated: "",
                              icon: Icons.timer_outlined,
                              primaryColor: Colors.amber,
                              backgroundColor: Colors.grey[50],
                              progressValue: 0.6,
                              onTap: () {},
                            )
                          ],
                        );
                      } else if (controller
                              .rxRequestStatusForAllRtaRequest.value ==
                          Status.error) {
                        return Center(child: Text("Error"));
                      } else {
                        return Center(child: Text("No Data"));
                      }
                    },
                  ),
                ),
              ),
              FilterWidget(
                searchHint: 'Search by name, location, or ID...',
                selectedFilter: 'All Requests',
                onSearchChanged: (value) {
                  controller.filterCassesApiAccordingToSearchQuery(value);
                },
                onFilterChanged: (filter) => {},
                onExportPressed: () => print('Export pressed'),
              ),
              StatusBarWidgetRta(
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
                ],
              ),
              Obx(() {
                if (controller.rxRequestStatusForfilterRtaRequest.value ==
                    Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller
                        .rxRequestStatusForfilterRtaRequest.value ==
                    Status.completed) {
                  return ListView.builder(
                      itemCount: controller.filterList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var data = controller.filterList[index];
                        // return Text( controller.filterList[index].user?.firstName.toString() ?? "");
                        return FilterListCardWidget(
                          name:
                              "${data.user?.firstName} ${data.user?.lastName}",
                          caseId: " BUR-${DateTime.now().year}-${data.id ?? ""}",
                          location: data.locationOfHouse ?? "",
                          signCount: data.signsRequired.toString(),
                          rta: 'rta',
                          primaryColor: Color(0xFFbd4753),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RtaRequestDetailView(
                                  requestId: data.id ?? -1,
                                ),
                              ),
                            );
                          },
                          onMessageTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RtaChatView(
                                    userId: data.user?.id ?? -1, deviceToken: data.user?.token ?? "",
                                  ),
                                ));
                          },
                        );
                      });
                } else if (controller
                        .rxRequestStatusForfilterRtaRequest.value ==
                    Status.error) {
                  return Center(child: Text("Error"));
                } else {
                  return Center(child: Text("No Data"));
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  var documentCubit = DiContainer().sl<HomeCubit>();
}
