import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/UI/mortician_notifs_screen.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/AssignedCaseCardList/assigned_case_card_list_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/DutyStatusCountWidget/duty_status_count_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/GridViewStatsWidget/grid_view_stats_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/MorticianHeaderWidget/mortician_header_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/controller/mortician_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MorticianAdminDashboard extends StatefulWidget {
  final String id, name, phoneNo;
  const MorticianAdminDashboard({
    super.key,
    required this.id,
    required this.name,
    required this.phoneNo,
  });

  @override
  State<MorticianAdminDashboard> createState() =>
      _MorticianAdminDashboardState();
}

class _MorticianAdminDashboardState extends State<MorticianAdminDashboard> {
  final controller = Get.put(MorticianController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getAllCasses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFEBF4FF),
            ],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getAllCasses();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                MorticianDashboardHeaderWidget(
                  title: widget.name,
                  subtitle: 'Mortician Dashboard',
                  morticianName: widget.name,
                  initials:
                      widget.name.split(" ").map((e) => e[0]).take(2).join(),
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
                  onNotificationPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MorticianNotifs();
                    }));
                  },
                ),
                Obx(() {
                  switch (
                      controller.rxRequestStatusForAllMorticianRequest.value) {
                    case Status.loading:
                      return Center(child: CircularProgressIndicator());
                    case Status.completed:
                      return Column(
                        children: [
                          Container(
                            height: context.mh * 0.16,
                            margin: EdgeInsets.symmetric(
                                horizontal: context.mw * 0.02),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.selectedStatus.value,
                                          style: TextStyle(
                                            fontSize: context.mh * 0.018,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF374151),
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        GestureDetector(
                                          onTap: () {
                                            String newStatus = controller
                                                        .selectedStatus.value ==
                                                    'On Duty'
                                                ? 'Off Duty'
                                                : 'On Duty';
                                            controller.setStatus(
                                              newStatus,
                                              context,
                                              "49",
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: context.mw * 0.02,
                                                vertical: context.mh * 0.01),
                                            decoration: BoxDecoration(
                                              color: controller.selectedStatus
                                                          .value ==
                                                      'On Duty'
                                                  ? Color(0xFFECFDF5)
                                                  : Color(0xFFFEF2F2),
                                              border: Border.all(
                                                color: controller.selectedStatus
                                                            .value ==
                                                        'On Duty'
                                                    ? Color(0xFFBBF7D0)
                                                    : Color(0xFFFECACA),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    color: controller
                                                                .selectedStatus
                                                                .value ==
                                                            'On Duty'
                                                        ? Color(0xFF065F46)
                                                        : Color(0xFF991B1B),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                0.008.pw(context),
                                                Text(
                                                  controller
                                                      .selectedStatus.value,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: controller
                                                                .selectedStatus
                                                                .value ==
                                                            'On Duty'
                                                        ? Color(0xFF065F46)
                                                        : Color(0xFF991B1B),
                                                    fontSize:
                                                        context.mh * 0.014,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                0.016.ph(context),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DutyStatusCountWidget(
                                      count: controller.model.value.mortician
                                              ?.cemeteryCases?.length ??
                                          0,
                                      label: "Total Cases",
                                    ),
                                    DutyStatusCountWidget(
                                      count: controller.model.value.caseCounts
                                              ?.pending ??
                                          0,
                                      label: "Pending",
                                    ),
                                    DutyStatusCountWidget(
                                      count: controller.model.value.caseCounts
                                              ?.completed ??
                                          0,
                                      label: "Completed Today",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          0.02.ph(context),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.mw * 0.02),
                            child: StatisticsCardsGrid(
                              assignedCasesCount:
                                  controller.model.value.caseCounts?.assigned ??
                                      0,
                              pendingGhuslCount:
                                  controller.model.value.caseCounts?.pending ??
                                      0,
                              ghuslInProgressCount: controller.model.value
                                      .caseCounts?.ghuslInProgress ??
                                  0,
                              completedTodayCount: controller
                                      .model.value.caseCounts?.completed ??
                                  0,
                              label: '',
                            ),
                          ),
                          0.02.ph(context),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.mw * 0.02),
                            child: AssignedCaseCardList(
                              assignedCases: controller
                                      .model.value.mortician?.cemeteryCases ??
                                  [],
                            ),
                          ),
                        ],
                      );
                    case Status.error:
                      return Center(child: Text("Error"));
                    default:
                      return Center(child: Text("No Data"));
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();
