import 'package:burzakh/Extenshion/extenshion.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            0.02.ph(context),
            TabSelectionWidget(),
            0.01.ph(context),
            AmbulanceListCardWidget(
              driverName: "Ahmad Hassan",
              ambulanceId: "AMB001",
              caseId: "F2025001",
              pickupLocation: "Al-Manara Hospital",
              pickupAddress: "Sheikh Zayed Road, Dubai",
              deliverLocation: "Qusais Cemetery",
              scheduledTime: "09:00",
              dispatchPhone: "+971-4-555-0123",
              priority: "High",
              status: "Assigned",
            ),
            0.01.ph(context),
            TodaysScheduleWidget(
              scheduleItems: [
                ScheduleItem(
                  time: "09:00",
                  location: "Al-Manara Hospital",
                  status: "Current",
                ),
                ScheduleItem(
                  time: "11:30",
                  location: "Dubai Hospital",
                  status: "Upcoming",
                ),
                ScheduleItem(
                  time: "14:00",
                  location: "American Hospital",
                  status: "Upcoming",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
