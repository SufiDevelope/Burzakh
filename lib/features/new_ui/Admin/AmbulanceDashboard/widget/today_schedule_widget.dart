import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/Model/AdminModels/AmbulanceCassesModel/ambulance_casses_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodaysScheduleWidget extends StatelessWidget {
  final List<DispatchInfo> scheduleItems;

  const TodaysScheduleWidget({
    super.key,
    required this.scheduleItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mw,
      margin: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mh * 0.01,
      ),
      padding: EdgeInsets.all(context.mw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Schedule",
            style: TextStyle(
              fontSize: context.mh * 0.02,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          0.03.ph(context),

          ...scheduleItems.asMap().entries.map((entry) {
            int index = entry.key;
            DispatchInfo item = entry.value;
            bool isLast = index == scheduleItems.length - 1;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline dot and line
                  SizedBox(
                    width: context.mw * 0.02,
                    child: Column(
                      children: [
                        SizedBox(height: context.mh * 0.009),
                        Container(
                          width: context.mw * 0.02,
                          height: context.mw * 0.02,
                          decoration: BoxDecoration(
                            color: _getStatusColor(item.status ?? ""),
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 2,
                              margin: EdgeInsets.only(top: context.mh * 0.01),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  0.04.pw(context),

                  // Content
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: isLast ? 0 : context.mh * 0.02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // Format iso date
                                      DateFormat('yyyy-MM-dd HH:mm').format(
                                          DateTime.parse(
                                              scheduleItems[index].createdAt ??
                                                  "")),
                                      style: TextStyle(
                                        fontSize: context.mh * 0.018,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    0.005.ph(context),
                                    Text(
                                      // Fixed: Check if caseDetails exists and has items before accessing
                                      (item.caseDetails != null && item.caseDetails!.isNotEmpty)
                                          ? item.caseDetails!.first.location ?? ""
                                          : "",
                                      style: TextStyle(
                                        fontSize: context.mh * 0.016,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Status Badge
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.025,
                                  vertical: context.mh * 0.006,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusBackgroundColor(
                                      item.status ?? ""),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item.status ?? "",
                                  style: TextStyle(
                                    color:
                                        _getStatusTextColor(item.status ?? ""),
                                    fontSize: context.mh * 0.013,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'current':
        return Color(0xff2663eb);
      case 'completed':
        return Colors.green;
      case 'upcoming':
      default:
        return Colors.grey[400]!;
    }
  }

  Color _getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'current':
        return Color(0xff2663eb).withOpacity(0.1);
      case 'completed':
        return Colors.green.withOpacity(0.1);
      case 'upcoming':
      default:
        return Colors.grey[100]!;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'current':
        return Color(0xff2663eb);
      case 'completed':
        return Colors.green;
      case 'upcoming':
      default:
        return Colors.grey[600]!;
    }
  }
}