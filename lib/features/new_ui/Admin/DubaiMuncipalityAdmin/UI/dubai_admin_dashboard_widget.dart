import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_dashboard_header_widget.dart';
import 'package:flutter/material.dart';

class DubaiAdminDashboardView extends StatelessWidget {
  const DubaiAdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DubaiDashboardHeader(
        title: "Dubai Municipality",
        subtitle: "Cemetery Service",
        supervisorName: "Ahmed",
        initials: "AH",
        notificationCount: 3,
      ),
      body: Column(),
    );
  }
}
