import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Controller/visitor_alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';


class VistorFilterWidget extends StatelessWidget {
  const VistorFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final VisitorAlertController controller =
        Get.find<VisitorAlertController>();
    // Map for internal (English) keys → UI-translated labels
    final Map<String, String> dayLabelMap = {
      'Today': StringTranslateExtension("Today").tr(),
      'Tomorrow': StringTranslateExtension('Tomorrow').tr(),
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.04),
      child: Obx(
        () => Row(
          children: [
            _buildSelectableButton(
              context,
              label: dayLabelMap['Today']!,
              isSelected: controller.selectedDay.value == 'Today',
              onTap: () => controller.setSelectedDay('Today'),
            ),
            0.01.pw(context),
            _buildSelectableButton(
              context,
              label: dayLabelMap['Tomorrow']!,
              isSelected: controller.selectedDay.value == 'Tomorrow',
              onTap: () => controller.setSelectedDay('Tomorrow'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableButton(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.mh * 0.04,
        width: context.mw * 0.3,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFad8443) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: context.mh * 0.015,
              color: isSelected ? Colors.white : const Color(0xFFad8443),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
