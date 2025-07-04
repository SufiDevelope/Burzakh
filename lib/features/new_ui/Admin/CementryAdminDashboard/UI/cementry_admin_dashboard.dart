import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/cementry_dashboard_header_view.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/cementry_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/status_card_widget.dart';
import 'package:flutter/material.dart';

class CementryAdminDashboard extends StatefulWidget {
  const CementryAdminDashboard({super.key});

  @override
  State<CementryAdminDashboard> createState() => _CementryAdminDashboardState();
}

class _CementryAdminDashboardState extends State<CementryAdminDashboard> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = "All Cases";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.mh * 0.18),
        child: Padding(
          padding: EdgeInsets.only(top: context.mh * 0.03),
          child: const CementryDashboardHeaderWidget(),
        ),
      ),
      body: Container(
        height: context.mh,
        width: context.mw,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 2.0,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFE2E8F0),
              Color(0xFFCBD5E1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GenericStatsContainerWidget(
                        title: "TOTAL CASES",
                        value: "7",
                        icon: Icons.assessment,
                        iconBackgroundColor: const Color(0xFF3B82F6),
                        topBorderColor: const Color(0xFF3B82F6),
                      ),
                    ),
                    Expanded(
                      child: GenericStatsContainerWidget(
                        title: "TODAY'S BURIALS",
                        value: "5",
                        icon: Icons.today,
                        iconBackgroundColor: const Color(0xFFEF4444),
                        topBorderColor: const Color(0xFFEF4444),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GenericStatsContainerWidget(
                        title: "PENDING CASES",
                        value: "2",
                        icon: Icons.pending,
                        iconBackgroundColor: const Color(0xFFF59E0B),
                        topBorderColor: const Color(0xFFF59E0B),
                      ),
                    ),
                    Expanded(
                      child: GenericStatsContainerWidget(
                        title: "COMPLETED CASES",
                        value: "2",
                        icon: Icons.check_circle,
                        iconBackgroundColor: const Color(0xFF10B981),
                        topBorderColor: const Color(0xFF10B981),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GenericStatsContainerWidget(
                        title: "ACTIVE MORTICIANS",
                        value: "3",
                        icon: Icons.person,
                        iconBackgroundColor: const Color(0xFF8B5CF6),
                        topBorderColor: const Color(0xFF8B5CF6),
                      ),
                    ),
                    Expanded(
                      child: GenericStatsContainerWidget(
                        title: "CEMETERY DISTRIBUTION",
                        value: "3/2",
                        icon: Icons.location_on,
                        iconBackgroundColor: const Color(0xFF6366F1),
                        topBorderColor: const Color(0xFF6366F1),
                      ),
                    ),
                  ],
                ),
                CementryFilterWidget(
                  searchHint: "Search by name or case ID...",
                  dropdownValue: _selectedFilter,
                  dropdownItems: [
                    "All Cases",
                    "Active Cases",
                    "Closed Cases",
                    "Pending Cases",
                    "Urgent Cases",
                  ],
                  searchController: _searchController,
                  onSearchChanged: (value) {
                    log("Search changed: $value");
                  },
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedFilter = value;
                    });
                    log("Dropdown changed: $value");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
