import 'dart:developer';

import 'package:burzakh/Model/AdminModels/MorticianCassesModel/mortician_model.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/CaseCardWidget/case_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/controller/mortician_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssignedCaseCardList extends StatelessWidget {
  final List<CemeteryCases> assignedCases;
  const AssignedCaseCardList({super.key, required this.assignedCases});

  // Method to calculate progress based on status
  double _calculateProgress(String? status) {
    if (status == null) return 0.0;
    switch (status.toLowerCase()) {
      case 'ghusal-started':
        return 0.5;
      case 'ghusal-completed':
        return 1.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MorticianController>();
    return Container(
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
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.people, color: Color(0xFF475569), size: 24),
                ),
                SizedBox(width: 12),
                Text(
                  'Assigned Cases',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: assignedCases.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: Color(0xFFF3F4F6)),
              itemBuilder: (context, index) {
                log(assignedCases.length.toString());
                final currentCase = assignedCases[index];
                final caseDetail =
                    assignedCases[index].caseDetails?.isNotEmpty == true
                        ? assignedCases[index].caseDetails!.first
                        : null;

                log("Assigned Case Id ${assignedCases[index].id.toString()}");

                return CaseCardWidget(
                  caseNo:
                      "BUR-${DateTime.now().year}-${currentCase.id.toString()}",
                  caseName: currentCase.caseName ?? "Unknown",
                  status: currentCase.status,
                  age: caseDetail?.age ?? "N/A",
                  gender: caseDetail?.gender ?? "N/A",
                  progress: _calculateProgress(currentCase.status),
                  onStartGhusl: () {
                    log("ghusal-started");
                    controller.updateCaseStatus(
                      assignedCases[index].id,
                      "ghusal-started",
                      context,
                    );
                  },
                  onCompleteGhusl: () {
                    log("ghusal-Updated");
                    controller.updateCaseStatus(
                      assignedCases[index].id,
                      "ghusal-completed",
                      context,
                    );
                  },
                  burrialSchedule:
                      "${currentCase.mancipalityRecord?.sect}, ${currentCase.mancipalityRecord?.religion}",
                  burrialTiming:
                      currentCase.mancipalityRecord?.burialTiming ?? "",
                  specialRequest:
                      currentCase.mancipalityRecord?.specialRequest ?? "",
                );
              }),
        ],
      ),
    );
  }
}
