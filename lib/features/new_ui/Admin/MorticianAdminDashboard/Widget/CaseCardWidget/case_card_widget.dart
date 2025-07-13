import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class CaseCardWidget extends StatelessWidget {
  final String? caseNo;
  final String? caseName;
  final String? age;
  final String? status;
  final String? gender;
  const CaseCardWidget(
      {super.key,
      this.caseNo,
      this.caseName,
      this.age,
      this.status,
      this.gender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02, vertical: context.mw * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      caseNo ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      '${age} years• ${gender}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(status),
            ],
          ),
          
        ],
      ),
    );
  }
}

Widget _buildStatusBadge(status) {
  Color bgColor, textColor;
  switch (status) {
    case 'Ready':
      bgColor = Color(0xFFECFDF5);
      textColor = Color(0xFF065F46);
      break;
    case 'In Progress':
      bgColor = Color(0xFFFFF7ED);
      textColor = Color(0xFF92400E);
      break;
    default:
      bgColor = Color(0xFFF1F5F9);
      textColor = Color(0xFF475569);
  }
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      status ?? '',
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
