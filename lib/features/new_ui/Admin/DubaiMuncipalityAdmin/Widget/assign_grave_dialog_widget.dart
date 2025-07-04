import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:get/get.dart';

class AssignGraveDialogWidget extends StatefulWidget {
  final String cemetery;
  final VoidCallback? onCancel;
  final Function(String graveNumber)? onAssign;

  const AssignGraveDialogWidget({
    super.key,
    required this.cemetery,
    this.onCancel,
    this.onAssign,
  });

  @override
  State<AssignGraveDialogWidget> createState() =>
      _AssignGraveDialogWidgetState();
}

class _AssignGraveDialogWidgetState extends State<AssignGraveDialogWidget> {
  final TextEditingController _graveNumberController = TextEditingController();

  @override
  void dispose() {
    _graveNumberController.dispose();
    super.dispose();
  }

  void _handleAssign() {
    if (_graveNumberController.text.trim().isNotEmpty) {
      widget.onAssign?.call(_graveNumberController.text.trim());
    }
  }

  final controller = Get.put(DubaiController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.mw * 0.85,
        padding: EdgeInsets.all(context.mw * 0.06),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              'Assign Grave Number',
              style: TextStyle(
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            0.04.ph(context),

            /// Cemetery Section
            Text(
              'Cemetery',
              style: TextStyle(
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            0.015.ph(context),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.cemetery,
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            0.03.ph(context),

            /// Grave Number Section
            Text(
              'Grave Number',
              style: TextStyle(
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            0.015.ph(context),

            /// Text Field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue.shade300,
                  width: 2,
                ),
              ),
              child: TextField(
                controller: _graveNumberController,
                decoration: InputDecoration(
                  hintText: 'e.g. A-142',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: context.mh * 0.016,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.04,
                    vertical: context.mh * 0.018,
                  ),
                ),
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  color: Colors.black87,
                ),
              ),
            ),

            0.05.ph(context),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: _buildButton(
                    context,
                    'Cancel',
                    Colors.white,
                    Colors.grey.shade600,
                    widget.onCancel ?? () => Navigator.of(context).pop(),
                    hasBorder: true,
                  ),
                ),
                0.03.pw(context),
                Expanded(
                  child: _buildButton(
                    context,
                    'Assign',
                    Color(0xff475569),
                    Colors.white,
                    _handleAssign,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback onTap, {
    bool hasBorder = false,
  }) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: context.mh * 0.018,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: hasBorder
                ? Border.all(color: Colors.grey.shade300, width: 1)
                : null,
          ),
          child: controller.graveBtnLoading.value
              ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
              : Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: context.mh * 0.016,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ),
      );
    });
  }
}

/// Helper function to show the dialog
void showAssignGraveDialog(
  BuildContext context, {
  required String cemetery,
  VoidCallback? onCancel,
  Function(String graveNumber)? onAssign,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AssignGraveDialogWidget(
        cemetery: cemetery,
        onCancel: onCancel,
        onAssign: (graveNumber) {
          // Navigator.of(context).pop(); // Close dialog first
          onAssign?.call(graveNumber);
        },
      );
    },
  );
}
