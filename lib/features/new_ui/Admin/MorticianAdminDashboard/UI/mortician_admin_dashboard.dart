import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/AssignedCaseCardList/assigned_case_card_list_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/DutyStatusCountWidget/duty_status_count_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/GridViewStatsWidget/grid_view_stats_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/MorticianHeaderWidget/mortician_header_widget.dart';
import 'package:flutter/material.dart';

class MorticianAdminDashboard extends StatelessWidget {
  const MorticianAdminDashboard({super.key});

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
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              MorticianDashboardHeaderWidget(
                title: 'Masab Haider',
                subtitle: 'masab',
                morticianName: 'Masab',
                initials: 'MH',
                email: 'masabhaider4@gmail.com',
              ),
              Container(
                height: context.mh * 0.16,
                margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Duty Status",
                              style: TextStyle(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF374151),
                              ),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.mw * 0.02,
                                    vertical: context.mh * 0.01),
                                decoration: BoxDecoration(
                                  color: Color(0xFFECFDF5),
                                  // : Color(0xFFFEF2F2),
                                  border: Border.all(
                                    color: Color(0xFFBBF7D0),
                                    //  Color(0xFFFECACA),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF10B981),
                                        // : Color(0xFFEF4444),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    0.008.pw(context),
                                    Text(
                                      "On Duty",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF065F46),
                                        // : Color(0xFF991B1B),
                                        fontSize: context.mh * 0.014,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DutyStatusCountWidget(count: 20, label: "Total Cases"),
                        DutyStatusCountWidget(count: 20, label: "Pending"),
                        DutyStatusCountWidget(
                            count: 20, label: "Completed Today"),
                      ],
                    ),
                  ],
                ),
              ),
              0.02.ph(context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                child: StatisticsCardsGrid(
                  assignedCasesCount: 1,
                  pendingGhuslCount: 2,
                  ghuslInProgressCount: 2,
                  completedTodayCount: 4,
                  label: '',
                ),
              ),
              0.02.ph(context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                child: AssignedCaseCardList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
