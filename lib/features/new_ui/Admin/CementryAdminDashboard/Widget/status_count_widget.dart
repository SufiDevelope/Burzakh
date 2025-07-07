import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/status_card_widget.dart';
import 'package:flutter/material.dart';

class StatusCountWidget extends StatelessWidget {
  final CementryController controller;
  const StatusCountWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GenericStatsContainerWidget(
                title: "TOTAL CASES",
                value: controller.model.value.totalCases.toString(),
                icon: Icons.assessment,
                iconBackgroundColor: const Color(0xFF3B82F6),
                topBorderColor: const Color(0xFF3B82F6),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "TODAY'S BURIALS",
                value: controller.model.value.todayBurials.toString(),
                icon: Icons.today,
                iconBackgroundColor: const Color(0xFFEF4444),
                topBorderColor: const Color(0xFFEF4444),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "PENDING CASES",
                value: controller.model.value.pendingCount.toString(),
                icon: Icons.pending,
                iconBackgroundColor: const Color(0xFFF59E0B),
                topBorderColor: const Color(0xFFF59E0B),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: GenericStatsContainerWidget(
                title: "COMPLETED CASES",
                value: controller.model.value.approvedCount.toString(),
                icon: Icons.check_circle,
                iconBackgroundColor: const Color(0xFF10B981),
                topBorderColor: const Color(0xFF10B981),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "ACTIVE MORTICIANS",
                value: controller.model.value.activeMorticians.toString(),
                icon: Icons.person,
                iconBackgroundColor: const Color(0xFF8B5CF6),
                topBorderColor: const Color(0xFF8B5CF6),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "CEMETERY DISTRIBUTION",
                value: "1/1",
                icon: Icons.location_on,
                iconBackgroundColor: const Color(0xFF6366F1),
                topBorderColor: const Color(0xFF6366F1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
