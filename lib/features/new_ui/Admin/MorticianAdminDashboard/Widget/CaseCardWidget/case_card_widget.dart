import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/Widget/BurrialScheduleTimeWidget/burrial_schedule_time_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CaseCardWidget extends StatelessWidget {
  final String? caseNo;
  final String? caseName;
  final String? age;
  final String? status;
  final String? gender;
  final double? progress;
  final VoidCallback? onStartGhusl;
  final VoidCallback? onCompleteGhusl;
  final String burrialSchedule;
  final String burrialTiming;
  final String specialRequest;

  const CaseCardWidget({
    super.key,
    this.caseNo,
    this.caseName,
    this.age,
    this.status,
    this.gender,
    this.progress,
    this.onStartGhusl,
    this.onCompleteGhusl,
    required this.burrialSchedule,
    required this.burrialTiming, required this.specialRequest,
  });

  @override
  Widget build(BuildContext context) {
    bool _isStartGhusalButtonActive() {
      return status?.toLowerCase() != "Assigned" &&
          status?.toLowerCase() != "ghusal-started" &&
          status?.toLowerCase() != "ghusal-completed";
    }

    bool _isGhusalCompletedButtonActive() {
      return status?.toLowerCase() == "ghusal-started";
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.mw * 0.03,
        vertical: context.mw * 0.01,
      ),
      padding: EdgeInsets.all(context.mh * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
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
                      caseName ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Age'.tr(),
                          style: TextStyle(
                            fontSize: context.mh * 0.013,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '  ${age},',
                          style: TextStyle(
                            fontSize: context.mh * 0.013,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          'Gender'.tr(),
                          style: TextStyle(
                            fontSize: context.mh * 0.013,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          '  $gender',
                          style: TextStyle(
                            fontSize: context.mh * 0.013,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(status),
            ],
          ),
          SizedBox(height: 16),

          // Burial Schedule
          BurialScheduleTile(
            title: "Sect & Region",
            color: Color(0xfff9fafc),
            value: burrialSchedule,
            data: Icons.mosque,
          ),
          SizedBox(height: 12),

          // Prayer Time
          BurialScheduleTile(
            title: "Prayer Time",
            color: Color(0xffeef2ff),
            value: burrialTiming,
            data: Icons.location_on,
          ),
          SizedBox(height: 16),

          // Ghusl Progress
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ghusl Progress".tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151),
                    ),
                  ),
                  Text(
                    "${((progress ?? 0.0) * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress ?? 0.0,
                backgroundColor: Color(0xFFE5E7EB),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                minHeight: 6,
              ),
            ],
          ),
          SizedBox(height: 16),

          // Special Instructions
          Text(
            "Special Instructions".tr(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
          SizedBox(height: 4),
          Text(
            specialRequest,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
          SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _isStartGhusalButtonActive() ? onStartGhusl : null,
                  icon: Icon(
                    Icons.play_arrow,
                    size: 18,
                    color: Color(0xFF374151),
                  ),
                  label: Text(
                    "Start Ghusl".tr(),
                    style: TextStyle(
                      color: Color(0xFF374151),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    side: BorderSide(color: Color(0xFFD1D5DB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed:
                      _isGhusalCompletedButtonActive() ? onCompleteGhusl : null,
                  icon: Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Complete Ghusl".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF10B981),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
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
    case 'Pending':
      bgColor = Color(0xFFF1F5F9);
      textColor = Color(0xFF475569);
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
      status ?? 'Pending',
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
}
