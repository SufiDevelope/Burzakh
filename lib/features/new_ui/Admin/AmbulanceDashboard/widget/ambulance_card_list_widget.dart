import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/Controller/ambulance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceListCardWidget extends StatelessWidget {
  final String driverName;
  final String ambulanceId;
  final String caseId;
  final String pickupLocation;
  final String pickupAddress;
  final String deliverLocation;
  final String scheduledTime;
  final String dispatchPhone;
  final String priority;
  final String status;
  final dynamic driverId;

  const AmbulanceListCardWidget({
    super.key,
    required this.driverName,
    required this.ambulanceId,
    required this.caseId,
    required this.pickupLocation,
    required this.pickupAddress,
    required this.deliverLocation,
    required this.scheduledTime,
    required this.dispatchPhone,
    required this.priority,
    required this.status, this.driverId,
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
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Current Assignment",
                style: TextStyle(
                  fontSize: context.mh * 0.02,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          0.02.ph(context),

          // Driver Info Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driverName,
                    style: TextStyle(
                      fontSize: context.mh * 0.024,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  0.005.ph(context),
                  Text(
                    "ID: $ambulanceId • Case: $caseId",
                    style: TextStyle(
                      fontSize: context.mh * 0.016,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.03,
                      vertical: context.mh * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.mh * 0.014,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          0.03.ph(context),

          // Pickup Location
          Container(
            padding: EdgeInsets.all(context.mw * 0.04),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[600],
                  size: context.mh * 0.024,
                ),
                0.03.pw(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pickup From",
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: Colors.grey[600],
                        ),
                      ),
                      0.005.ph(context),
                      Text(
                        pickupLocation,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      0.005.ph(context),
                      Text(
                        pickupAddress,
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          0.02.ph(context),

          // Deliver Location
          Container(
            padding: EdgeInsets.all(context.mw * 0.04),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[600],
                  size: context.mh * 0.024,
                ),
                0.03.pw(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deliver To",
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: Colors.grey[600],
                        ),
                      ),
                      0.005.ph(context),
                      Text(
                        deliverLocation,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          0.02.ph(context),

          // Scheduled Time
          Container(
            padding: EdgeInsets.all(context.mw * 0.04),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.grey[600],
                  size: context.mh * 0.024,
                ),
                0.03.pw(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Scheduled Time",
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: Colors.grey[600],
                        ),
                      ),
                      0.005.ph(context),
                      Text(
                        scheduledTime,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          0.02.ph(context),

          // Dispatch Phone
          Container(
            padding: EdgeInsets.all(context.mw * 0.04),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.grey[600],
                  size: context.mh * 0.024,
                ),
                0.03.pw(context),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dispatch",
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: Colors.grey[600],
                        ),
                      ),
                      0.005.ph(context),
                      Text(
                        dispatchPhone,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          0.03.ph(context),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(
                        'https://www.google.com/maps/dir/?api=1&destination=$pickupLocation'));
                  },
                  child: Container(
                    height: context.mh * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xff2663eb),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.navigation,
                          color: Colors.white,
                          size: context.mh * 0.022,
                        ),
                        0.02.pw(context),
                        Text(
                          "Navigate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              0.02.pw(context),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ambulanceController.updateCaseStatus("arrived", driverId, context);
                  },
                  child: Container(
                    height: context.mh * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: context.mh * 0.022,
                        ),
                        0.02.pw(context),
                        Text(
                          "Arrived",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          0.02.ph(context),

          // Secondary Action Buttons
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ambulanceController.updateCaseStatus("picked-up", driverId, context);
                  },
                  child: Container(
                    height: context.mh * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: context.mh * 0.022,
                        ),
                        0.02.pw(context),
                        Text(
                          "Picked Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              0.02.pw(context),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ambulanceController.updateCaseStatus("delivered", driverId, context);
                  },
                  child: Container(
                    height: context.mh * 0.06,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.white,
                          size: context.mh * 0.022,
                        ),
                        0.02.pw(context),
                        Text(
                          "Delivered",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          0.02.ph(context),

          // Call Dispatch Button
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse("tel:$dispatchPhone"));
            },
            child: Container(
              width: double.infinity,
              height: context.mh * 0.06,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: context.mh * 0.022,
                  ),
                  0.02.pw(context),
                  Text(
                    "Call Dispatch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
