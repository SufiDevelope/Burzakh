import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class RecentCaseWidget extends StatelessWidget {
  final String caseNumber;
  final String submittedTime;
  final String personName;
  final String location;
  final String issueDate;
  final String status;
  final Color? statusColor;
  final VoidCallback? onViewDetails;
  final VoidCallback? onQuickAction;

  const RecentCaseWidget({
    super.key,
    required this.caseNumber,
    required this.submittedTime,
    required this.personName,
    required this.location,
    required this.issueDate,
    this.status = "New",
    this.statusColor,
    this.onViewDetails,
    this.onQuickAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.mw * 0.04),
      margin: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mh * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row - Case Number and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                caseNumber,
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.03,
                  vertical: context.mh * 0.005,
                ),
                decoration: BoxDecoration(
                  color: statusColor ?? Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: context.mh * 0.014,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),

          0.01.ph(context),

          // Submitted Time
          Text(
            submittedTime,
            style: TextStyle(
              fontSize: context.mh * 0.014,
              color: Colors.grey[500],
            ),
          ),

          0.02.ph(context),

          // Divider
          Divider(
            color: Colors.grey[200],
            thickness: 1,
          ),

          0.02.ph(context),

          // Person Name
          Row(
            children: [
              Icon(
                Icons.person,
                size: context.mh * 0.02,
                color: Colors.grey[600],
              ),
              0.02.pw(context),
              Text(
                personName,
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          0.015.ph(context),

          // Location
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: context.mh * 0.02,
                color: Colors.grey[600],
              ),
              0.02.pw(context),
              Text(
                location,
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          0.015.ph(context),

          // Issue Date
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: context.mh * 0.02,
                color: Colors.grey[600],
              ),
              0.02.pw(context),
              Text(
                "Issue Date: $issueDate",
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          0.025.ph(context),

          // Action Buttons
          Column(
            children: [
              // View Details Button
              GestureDetector(
                onTap: onViewDetails,
                child: Container(
                  width: double.infinity,
                  height: context.mh * 0.055,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00734B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "View Details",
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              0.015.ph(context),

              // Quick Action Button
              Visibility(
                visible: status == "approved" ? false : true,
                child: GestureDetector(
                  onTap: onQuickAction,
                  child: Container(
                    width: double.infinity,
                    height: context.mh * 0.055,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[200]!,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Quick Action",
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
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