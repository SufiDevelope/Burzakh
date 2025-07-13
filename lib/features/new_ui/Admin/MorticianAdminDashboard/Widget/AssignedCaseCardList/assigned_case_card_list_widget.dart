import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/CaseCardWidget/case_card_widget.dart';
import 'package:flutter/material.dart';

class AssignedCaseCardList extends StatelessWidget {
  const AssignedCaseCardList({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 10,
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Color(0xFFF3F4F6)),
            itemBuilder: (context, index) => CaseCardWidget(
              caseNo: 'Case #${index + 1}',
              status: 'Pending',
              age: '25',
              gender: 'Male',
            ),
          ),
        ],
      ),
    );
  }
}
