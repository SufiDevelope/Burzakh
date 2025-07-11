// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/Controller/ambulance_controller.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/widget/ambulance_card_list_widget.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/widget/tab_selection_widget.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/widget/today_schedule_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulanceDashboard extends StatefulWidget {
  const AmbulanceDashboard({super.key});

  @override
  State<AmbulanceDashboard> createState() => _AmbulanceDashboardState();
}

class _AmbulanceDashboardState extends State<AmbulanceDashboard> {
  final ambulanceController = Get.put(AmbulanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9fafb),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFffffff),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.03, vertical: context.mw * 0.02),
          child: Row(
            children: [
              Container(
                width: context.mw * 0.1,
                height: context.mw * 0.1,
                decoration: BoxDecoration(
                  color: const Color(0xFF4b5563),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.directions_car,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              0.05.pw(context),
              // Middle - Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Driver Dashboard',
                      style: GoogleFonts.inter(
                        fontSize: context.mh * 0.02,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4b5563),
                      ),
                    ),
                    0.001.ph(context),
                    Text(
                      'Khalil Ahmed • AMB-001',
                      style: TextStyle(
                        fontSize: context.mh * 0.012,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: context.mw * 0.25,
                height: context.mw * 0.09,
                padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.02, vertical: context.mw * 0.01),
                decoration: BoxDecoration(
                  color: const Color(0xFF4b5563),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'عربي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ambulanceController.getAmbulanceCasses();
          ambulanceController.getAmbulanceSchedule();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              0.02.ph(context),
              TabSelectionWidget(),
              0.01.ph(context),
              Obx(
                () {
                  switch (ambulanceController
                      .rxRequestStatusForAllAmbulanceRequest.value) {
                    case Status.loading:
                      return Center(child: CircularProgressIndicator());
                    case Status.completed:
                      var data = ambulanceController.model.value.ambulance;
                      return Container(
                        height: context.mh * 0.7,
                        child: ListView.builder(
                            itemCount: ambulanceController
                                    .model.value.dispatchedCases?.length ??
                                0,
                            itemBuilder: (context, index) {
                              return AmbulanceListCardWidget(
                                driverName: data?.driverName ?? "",
                                ambulanceId: data?.vehicleNumber ?? "",
                                caseId:
                                    "BUR-${DateTime.now().year}-${ambulanceController.model.value.caseDetails?[index].id?.toString() ?? ""}",
                                pickupLocation: "Al-Manara Hospital",
                                pickupAddress: "Sheikh Zayed Road, Dubai",
                                deliverLocation: "Qusais Cemetery",
                                scheduledTime: "09:00",
                                dispatchPhone: data?.contactNumber ?? "",
                                priority: "High",
                                status: data?.status ?? "",
                                driverId: ambulanceController
                                    .model.value.dispatchedCases?[index].id,
                              );
                            }),
                      );

                    case Status.error:
                      return Text("Error");
                    default:
                      return SizedBox();
                  }
                },
              ),
              0.01.ph(context),
              Obx(
                () {
                  switch (ambulanceController
                      .rxRequestStatusForScheduleAmbulanceRequest.value) {
                    case Status.loading:
                      return Center(child: CircularProgressIndicator());
                    case Status.completed:
                      return TodaysScheduleWidget(
                        scheduleItems: ambulanceController
                                .modelSchedule.value.dispatchedCases ??
                            [],
                      );
                    case Status.error:
                      return Text("Error");
                    default:
                      return SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
