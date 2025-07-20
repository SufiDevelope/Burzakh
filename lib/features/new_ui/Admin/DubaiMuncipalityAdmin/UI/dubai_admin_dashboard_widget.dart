import 'dart:developer';

import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_request_details_view.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_chat_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/notification_screen_view.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/ambulance_diaply_count_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/assign_grave_dialog_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dispatch_ambulance_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_dashboard_header_widget.dart';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_request_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/status_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/status_tab_widget_dubai.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getRequestApi();
      controller.getAmbulanceApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getRequestApi();
          controller.getAmbulanceApi();
          controller.resetToFirst();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              DMCemeteryHeaderWidget(
                imageurl: "assets/images/png/dubailogo.png",
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
                onNotificationPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MuncipalityNotificationScreen(),
                    ),
                  );
                },
                onAmbulancePressed: () {
                  controller.selectedIndex.value = 5;
                },
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
                    title: 'Approve',
                    count: 10,
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
                  horizontal: context.mw * 0.01,
                  vertical: context.mh * 0.01,
                ),
                child: Obx(
                  () {
                    if (controller.selectedIndex.value == 3) {
                      return AmbulanceStatusCardWidget(
                        controller: controller,
                      );
                    } else {
                      return DubaiStatusCardWidget(controller: controller);
                    }
                  },
                ),
              ),
              0.01.ph(context),
              Obx(() {
                switch (controller.rxRequestStatusForAllDubaiRequest.value) {
                  case Status.loading:
                    return SizedBox(height: 0);
                  case Status.completed:
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                      child: DubaiFilterWidget(
                        searchHint: controller.selectedIndex.value == 3
                            ? "Search by name or Id Vehicle Number or Status"
                            : "Search by name Cemetery or Id",
                        onSearchChanged: (value) {
                          if (controller.selectedIndex.value == 3) {
                            controller.filterAmbulanceUsingSearchQurey(value);
                          } else {
                            controller.filterRequestUsingSearchQurey(value);
                          }
                        },
                      ),
                    );
                  case Status.error:
                    return Center(child: Text("Error Loading Data"));
                  default:
                    return SizedBox();
                }
              }),
              0.01.ph(context),
              Obx(() {
                switch (controller.rxRequestStatusForAllDubaiRequest.value) {
                  case Status.loading:
                    return SizedBox(height: 0);
                  case Status.completed:
                    if (controller.selectedIndex.value == 3) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.filterAmbulanceList.value.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var data =
                              controller.filterAmbulanceList.value[index];

                          // Build a combined string of "Status for CaseName"
                          String statusAmbulance = "Not Assigned";
                          if (data.dispatchedInfo != null &&
                              data.dispatchedInfo!.isNotEmpty) {
                            statusAmbulance =
                                data.dispatchedInfo!.map((dispatch) {
                              final status = dispatch.status;
                              final caseName = dispatch.caseName;
                              return "$status for $caseName";
                            }).join(", ");
                          }

                          return BurialCardWidget(
                            name: "${data.driverName ?? ''}",
                            caseId: "${data.vehicleNumber ?? ''}",
                            location: data.currentLocation ?? "",
                            date: DateFormat('yyyy-MM-dd').format(
                              DateTime.tryParse(data.createdAt ?? "") ??
                                  DateTime.now(),
                            ),
                            status: data.status ?? "",
                            messageCount: 2,
                            onTap: () {},
                            relative: 'Ahmed Al Kaabi',
                            isAmbulance: true,
                            onCallTap: () {
                              launchUrl(
                                  Uri.parse('tel:${data.contactNumber ?? ''}'));
                            },
                            ongraveAssign: () {
                              showDispatchAmbulanceDialog(
                                context,
                                ambulanceId: data.vehicleNumber ?? '',
                                driverName: data.driverName ?? '',
                                currentLocation: data.currentLocation ?? '',
                                status: data.status ?? '',
                                onConfirm: (assignmentType, instructions,
                                    selectedOption) {
                                  log(assignmentType);
                                  controller.dispatchAmbulance(
                                      context, data.vehicleNumber ?? "");
                                },
                              );
                            },
                            statusAmbulance: statusAmbulance,
                          );
                        },
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.filterRequestList.value.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = controller.filterRequestList.value[index];
                        var caseDetail = (data.caseDetails != null &&
                                data.caseDetails!.isNotEmpty)
                            ? data.caseDetails![0]
                            : null;

                        return BurialCardWidget(
                          name:
                              "${data.user?.firstName ?? ''} ${data.user?.lastName ?? ''}",
                          caseId: "BUR-${DateTime.now().year}-${data.id}",
                          location: caseDetail?.location ?? "",
                          date: DateFormat('yyyy-MM-dd').format(
                            DateTime.parse(data.createdAt ??
                                DateTime.now().toIso8601String()),
                          ),
                          time: data.burialTiming ?? "",
                          status: data.status ?? "",
                          messageCount: 2,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DubaiAdminRequestDetailsView(
                                  model: data,
                                ),
                              ),
                            );
                          },
                          onMessageTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DubaiChatView(
                                  userId: data.user?.id ?? -1,
                                  deviceToken: data.user?.deviceToken ?? '',
                                ),
                              ),
                            );
                          },
                          relative: "Dead Person : ${caseDetail?.nameOfDeceased ?? ''}",
                          documents: [
                            if (caseDetail?.deathNotificationFile != null)
                              "Death Notification",
                            if (caseDetail?.hospitalCertificate != null)
                              "Hospital Certificate",
                            if (caseDetail?.policeClearance != null)
                              "Police Clearance",
                            if (caseDetail?.passportOrEmirateIdFront != null)
                              "Emirates ID Front",
                            if (caseDetail?.passportOrEmirateIdBack != null)
                              "Emirates ID Back",
                          ],
                          ongraveAssign: () {
                            showAssignGraveDialog(
                              context,
                              cemetery: data.preferredCemetery ?? '',
                              onAssign: (graveNumber) {
                                controller.assignGraveApi(
                                    data.id ?? -1, graveNumber, context, true);
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          graveStatus: data.grave_status ?? '',
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
      ),
    );
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();
