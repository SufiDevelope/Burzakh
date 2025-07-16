import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Controller/visitor_alert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CemeteryDropdownDialog extends StatefulWidget {
  @override
  _CemeteryDropdownDialogState createState() => _CemeteryDropdownDialogState();
}

class _CemeteryDropdownDialogState extends State<CemeteryDropdownDialog> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VisitorAlertController>();
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notification Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close, size: 24),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),

            SizedBox(height: 32),

            // Cemetery Dropdown Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preferred Cemetery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade50,
                    ),
                    child: DropdownButton<String>(
                      value: controller.selectedCemetery.value,
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey.shade600),
                      items: controller.cemeteries.map((String cemetery) {
                        return DropdownMenuItem<String>(
                          value: cemetery,
                          child: Text(
                            cemetery,
                            style: TextStyle(
                              fontSize: 16,
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
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
