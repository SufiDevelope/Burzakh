import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Ui/cda_chat_view.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Ui/cda_details_widget.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Widgets/cda_admin_header_widget.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Widgets/cda_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Widgets/status_bar_cda_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/dashboard_overview_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/filter_list_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/status_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CdaAdminDashboardView extends StatefulWidget {
  final String name;
  const CdaAdminDashboardView({super.key, required this.name});

  @override
  State<CdaAdminDashboardView> createState() => _CdaAdminDashboardViewState();
}

class _CdaAdminDashboardViewState extends State<CdaAdminDashboardView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CdaController());
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
              CDADashboardHeaderWidget(
                title: "Community Development Authority",
                subtitle: "Mourning Tent Administration",
                adminName: widget.name,
                initials:
                    widget.name.split(" ").map((e) => e[0]).take(2).join(),
                notificationCount: 3,
                onrtaLogoPressed: () {
                  Navigator.pop(context);
                },
                email: '',
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
                imageUrl: "assets/images/png/cdalogo.png",
              ),
              Obx(() {
                return GenericDashboardOverviewWidget(
                  title: "Dashboard Overview",
                  selectedTimeRange: controller.selectedTimeRange.value,
                  onTimeRangeChanged: (TimeRange range) {
                    controller.updateTimeRange(range);
                  },
                  selectedColor: Color(0xFF1e40af),
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
                              title: "Today's Tents",
                              count:
                                  controller.model.value.todayTent.toString(),
                              statusText: "",
                              lastUpdated: DateFormat("dd MMM yyyy")
                                  .format(DateTime.now()),
                              icon: Icons.description_outlined,
                              primaryColor: Color(0xFF1e40af),
                              backgroundColor: Colors.grey[50],
                              progressValue: 0.6,
                              onTap: () {},
                            ),
                            GenericStatusCardWidget(
                              title: "Pending",
                              count: controller.model.value.pendingCount
                                  .toString(),
                              statusText: "Need Approval",
                              lastUpdated: "Last updated: 30 min ago",
                              icon: Icons.check,
                              primaryColor: Colors.amber,
                              backgroundColor: Colors.grey[50],
                              progressValue: 0.6,
                              onTap: () {},
                            ),
                            GenericStatusCardWidget(
                              title: "Approved",
                              count: controller.model.value.approvedCount
                                  .toString(),
                              statusText: "This Week",
                              lastUpdated: "Last updated: 30 min ago",
                              icon: Icons.check_circle,
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
                              lastUpdated: "Last updated: 30 min ago",
                              icon: Icons.close,
                              primaryColor: Colors.red,
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
              CdaFilterWidget(
                searchHint: 'Search by name, location, or ID...',
                selectedFilter: 'All Requests',
                onSearchChanged: (value) {
                  controller.filterCassesApiAccordingToSearchQuery(value);
                },
                onFilterChanged: (filter) => {},
                onExportPressed: () => print('Export pressed'),
              ),
              StatusBarWidgetCda(
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
                        return FilterListCardWidget(
                          name:
                              "${data.user?.firstName} ${data.user?.lastName}",
                          caseId: "Case ID: BUR-${DateTime.now().year}-${data.id ?? ""}",
                          location: data.locationOfTent ?? "",
                          signCount: "",
                          messageCount: 2,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CdaRequestDetailView(
                                  requestId: data.id ?? -1,
                                ),
                              ),
                            );
                          },
                          onMessageTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CdaChatView(
                                    userId: data.user?.id ?? -1, deviceToken: data.user?.deviceToken ?? "",
                                  ),
                                ));
                          },

                          primaryColor: Color(0xFF1e40af), rta: 'cda',
                          // rta: "cda",
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
