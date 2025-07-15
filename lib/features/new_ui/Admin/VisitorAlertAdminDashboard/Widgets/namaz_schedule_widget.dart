import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Controller/visitor_alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerScheduleWidget extends StatelessWidget {
  final VoidCallback? onLocationPressed;

  const PrayerScheduleWidget({super.key, this.onLocationPressed});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VisitorAlertController>();

    return Obx(() => Container(
          margin: EdgeInsets.symmetric(
              horizontal: context.mw * 0.04, vertical: context.mh * 0.02),
          padding: EdgeInsets.all(context.mw * 0.05),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF144132),
                Color(0xFF525d39),
                Color(0xFFa28755),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Next Prayer',
                    style: TextStyle(
                      fontSize: context.mh * 0.016,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: onLocationPressed,
                    child: Container(
                      padding: EdgeInsets.all(context.mw * 0.025),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: context.mh * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
              0.015.ph(context),

              Text(
                '${controller.currentPrayer.value} - ${controller.currentTime.value}',
                style: TextStyle(
                  fontSize: context.mh * 0.032,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              0.01.ph(context),
              Text(
                "",
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
              0.025.ph(context),

              // Prayer Times Row
              Row(
                children: controller.prayerTimes.asMap().entries.map((entry) {
                  int index = entry.key;
                  final prayer = entry.value;
                  final isActive =
                      prayer.name == controller.currentPrayer.value;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.updateCurrentPrayer(prayer.name, prayer.time, '');
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: index < controller.prayerTimes.length - 1
                              ? context.mw * 0.02
                              : 0,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: context.mh * 0.015,
                          horizontal: context.mw * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.white.withOpacity(0.25)
                              : Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: isActive
                              ? Border.all(
                                  color: Colors.white.withOpacity(0.3), width: 1)
                              : null,
                        ),
                        child: Column(
                          children: [
                            Text(
                              prayer.name,
                              style: TextStyle(
                                fontSize: context.mh * 0.011,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            0.005.ph(context),
                            Text(
                              prayer.time,
                              style: TextStyle(
                                fontSize: context.mh * 0.014,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ));
  }
}

class PrayerTime {
  final String name;
  final String time;

  PrayerTime({required this.name, required this.time});
}
