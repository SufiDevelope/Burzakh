import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/Model/AdminModels/AmbulanceSchduleModel/ambulance_schdule_model.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/Controller/ambulance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TodaysScheduleWidget extends StatelessWidget {
  final List<DispatchedCasesList> scheduleItems;
  
  const TodaysScheduleWidget({
    super.key,
    required this.scheduleItems,
  });

  @override
  Widget build(BuildContext context) {
    final ambulanceController = Get.find<AmbulanceController>();
    
    return Container(
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
          // Header
          Text(
            "Today's Schedule",
            style: TextStyle(
              fontSize: context.mh * 0.022,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          0.03.ph(context),
          
          // Schedule Items
          ...scheduleItems.asMap().entries.map((entry) {
            int index = entry.key;
            DispatchedCasesList item = entry.value;
            bool isLast = index == scheduleItems.length - 1;
            
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline dot and line
                    Column(
                      children: [
                        Container(
                          width: context.mw * 0.03,
                          height: context.mw * 0.03,
                          decoration: BoxDecoration(
                            color: _getStatusColor(item.status ?? ""),
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: context.mh * 0.06,
                            color: Colors.grey[300],
                          ),
                      ],
                    ),
                    0.04.pw(context),
                    
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Time",
                                    style: TextStyle(
                                      fontSize: context.mh * 0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  0.005.ph(context),
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                      fontSize: context.mh * 0.016,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              
                              // Status Badge
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.025,
                                  vertical: context.mh * 0.006,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusBackgroundColor(item.status ?? ""),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item.status ?? "",
                                  style: TextStyle(
                                    color: _getStatusTextColor(item.status ?? ""),
                                    fontSize: context.mh * 0.013,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (!isLast) 0.025.ph(context),
                        ],
                      ),
                    ),
                  ],
                ),
                if (!isLast) 0.01.ph(context),
              ],
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