import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Controller/visitor_alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class CemeteryDropdownDialog extends StatefulWidget {
  @override
  _CemeteryDropdownDialogState createState() => _CemeteryDropdownDialogState();
}

class _CemeteryDropdownDialogState extends State<CemeteryDropdownDialog> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VisitorAlertController>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final Map<String, String> cemeteryMap = {
      '': StringTranslateExtension('Select Cemetery').tr(),
      'Al Qusais Cemetery': StringTranslateExtension('Al Qusais Cemetery').tr(),
      'Al Warqa Cemetery': StringTranslateExtension('Al Warqa Cemetery').tr(),
      'Jumeirah Cemetery': StringTranslateExtension('Jumeirah Cemetery').tr(),
      'Dubai Silicon Oasis Cemetery': StringTranslateExtension('Dubai Silicon Oasis Cemetery').tr(),
      'Other Cemetery': StringTranslateExtension('Other Cemetery').tr(),
    };

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(height * 0.02),
      ),
      child: Container(
        padding: EdgeInsets.all(height * 0.03),
        width: width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringTranslateExtension('Notification Settings').tr(),
                  style: TextStyle(
                    fontSize: height * 0.018,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: height * 0.02),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

            SizedBox(height: height * 0.04),

            // Cemetery Dropdown Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringTranslateExtension('Preferred Cemetery').tr(),
                  style: TextStyle(
                    fontSize: height * 0.018,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.015),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.008,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(height * 0.012),
                      color: Colors.grey.shade50,
                    ),
                    child: DropdownButton<String>(
                      value: controller.selectedCemetery.value,
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade600,
                        size: height * 0.028,
                      ),
                      items: controller.cemeteries.map((String cemetery) {
                        return DropdownMenuItem<String>(
                          value: cemetery,
                          child: Text(
                            cemeteryMap[cemetery]!,
                            style: TextStyle(
                              fontSize: height * 0.018,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.setSelectedCemetery(newValue!);
                      },
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
