import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/StatusCardWidget/stats_card_widget.dart';
import 'package:flutter/material.dart';

class StatisticsCardsGrid extends StatelessWidget {
  final int assignedCasesCount;
  final int pendingGhuslCount;
  final int ghuslInProgressCount;
  final int completedTodayCount;
  final String label;

  const StatisticsCardsGrid({
    super.key,
    required this.assignedCasesCount,
    required this.pendingGhuslCount,
    required this.ghuslInProgressCount,
    required this.completedTodayCount,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width < 768 ? 2 : 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.6,
      children: [
        StatCardWidget(
          icon: Icons.people,
          title: 'Assigned Cases',
          value: assignedCasesCount.toString(),
          bgColor: const Color(0xFFF1F5F9),
          iconColor: const Color(0xFF475569),
        ),
        StatCardWidget(
          icon: Icons.access_time,
          title: "Pending Ghusl",
          value: pendingGhuslCount.toString(),
          bgColor: const Color(0xFFFFF7ED),
          iconColor: const Color(0xFFD97706),
        ),
        StatCardWidget(
          icon: Icons.trending_up,
          title: "Ghusl In Progress",
          value: ghuslInProgressCount.toString(),
          bgColor: const Color(0xFFF0F9FF),
          iconColor: const Color(0xFF2563EB),
        ),
        StatCardWidget(
          icon: Icons.check_circle,
          title: "Completed Today",
          value: completedTodayCount.toString(),
          bgColor: const Color(0xFFECFDF5),
          iconColor: const Color(0xFF059669),
        ),
      ],
    );
  }
}
