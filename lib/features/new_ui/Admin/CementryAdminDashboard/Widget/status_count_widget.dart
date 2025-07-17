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
                iconBackgroundColor: Color(0xFF6B7A8F),
                topBorderColor: const Color(0xFF6B7A8F),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "TODAY'S BURIALS",
                value: controller.model.value.todayBurials.toString(),
                icon: Icons.today,
                iconBackgroundColor: Color(0xFF6B7A8F),
                topBorderColor: Color(0xFF6B7A8F),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "PENDING CASES",
                value: controller.model.value.pendingCount.toString(),
                icon: Icons.pending,
                iconBackgroundColor: Color(0xFF6B7A8F),
                topBorderColor: Color(0xFF6B7A8F),
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
                iconBackgroundColor: Color(0xFF6B7A8F),
                topBorderColor: Color(0xFF6B7A8F),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "ACTIVE MORTICIANS",
                value: controller.model.value.activeMorticians.toString(),
                icon: Icons.person,
                iconBackgroundColor: Color(0xFF6B7A8F),
                topBorderColor: Color(0xFF6B7A8F),
              ),
            ),
            Expanded(
              child: GenericStatsContainerWidget(
                title: "CEMETERY DISTRIBUTION",
                value: "1/1",
                icon: Icons.location_on,
                iconBackgroundColor: Color(0xFF6B7A8F),
                topBorderColor: Color(0xFF6B7A8F),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
