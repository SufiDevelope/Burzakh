import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/Controller/ambulance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabSelectionWidget extends StatelessWidget {
  final String driverId;
  const TabSelectionWidget({super.key, required this.driverId});

  @override
  Widget build(BuildContext context) {
    final ambulanceController = Get.find<AmbulanceController>();
    return Obx(
      () {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          height: context.mh * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: context.mw * 0.17,
                height: context.mw * 0.08,
                decoration: BoxDecoration(
                  color: ambulanceController.selectedStatus.value == "Available"
                      ? Colors.green.shade600
                      : ambulanceController.selectedStatus.value == "On Route"
                          ? Colors.blue.shade600
                          : ambulanceController.selectedStatus.value == "Busy"
                              ? Color(0xffda7708)
                              : Colors.grey,
                  //   Color(0xff2663eb),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    ambulanceController.selectedStatus.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.015,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  // Available - Green when selected
                  GestureDetector(
                    onTap: () => ambulanceController.setStatus(
                        "Available", context, driverId),
                    child: Container(
                      width: context.mw * 0.19,
                      height: context.mw * 0.12,
                      decoration: BoxDecoration(
                        color: ambulanceController.selectedStatus.value ==
                                "Available"
                            ? Colors.green.shade600
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.015,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  0.02.pw(context),

                  // On Route - Blue when selected
                  GestureDetector(
                    onTap: () => ambulanceController.setStatus(
                        "On Route", context, driverId),
                    child: Container(
                      width: context.mw * 0.19,
                      height: context.mw * 0.12,
                      decoration: BoxDecoration(
                        color: ambulanceController.selectedStatus.value ==
                                "On Route"
                            ? Colors.blue.shade600
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "\t\tOn\nRoute",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.015,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  0.02.pw(context),

                  // Busy - Yellow when selected
                  GestureDetector(
                    onTap: () => ambulanceController.setStatus(
                        "Busy", context, driverId),
                    child: Container(
                      width: context.mw * 0.19,
                      height: context.mw * 0.12,
                      decoration: BoxDecoration(
                        color:
                            ambulanceController.selectedStatus.value == "Busy"
                                ? Color(0xffda7708)
                                : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Busy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.015,
                            fontWeight: FontWeight.w500,
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
      },
    );
  }
}
