import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:burzakh/Extenshion/extenshion.dart';

class DispatchAmbulanceDialogWidget extends StatelessWidget {
  final String ambulanceId;
  final String driverName;
  final String currentLocation;
  final String status;
  final VoidCallback? onCancel;
  final Function(String assignmentType, String additionalInstructions,
      String selectedOption)? onConfirm;

  const DispatchAmbulanceDialogWidget({
    super.key,
    required this.ambulanceId,
    required this.driverName,
    required this.currentLocation,
    required this.status,
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DubaiController());

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.mw * 0.99,
        padding: EdgeInsets.all(context.mw * 0.06),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                'Dispatch Ambulance $ambulanceId',
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              0.03.ph(context),

              /// Ambulance Info Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.mw * 0.04),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ambulanceId,
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.03,
                            vertical: context.mh * 0.006,
                          ),
                          decoration: BoxDecoration(
                            color: status == 'Available'
                                ? Colors.grey.shade300
                                : Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: context.mh * 0.014,
                              color: status == 'Available'
                                  ? Colors.grey.shade700
                                  : Colors.green.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    0.02.ph(context),
                    Text(
                      'Driver: $driverName',
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    0.01.ph(context),
                    Text(
                      'Current Location: $currentLocation',
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              0.04.ph(context),

              /// Assignment Type Section
              Text(
                'Select Assignment Type:',
                style: TextStyle(
                  fontSize: context.mh * 0.017,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              0.02.ph(context),

              /// Burial Case Option
              _buildAssignmentOption(
                context,
                controller,
                'burial',
                'Dispatch to Specific Burial Case',
                'Send ambulance to collect deceased from hospital and transport to cemetery',
                Icons.local_shipping,
                Colors.blue,
              ),

              /// Burial Cases Dropdown

              0.02.ph(context),

              /// Mosque Standby Option
              _buildAssignmentOption(
                context,
                controller,
                'mosque',
                'Standby at Mosque',
                'Position ambulance in front of mosque for emergency standby during prayers',
                Icons.location_on,
                Colors.orange,
              ),
              Obx(() => controller.selectedAssignmentType.value == 'burial'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        0.02.ph(context),
                        Text(
                          'Select Burial Case:',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        0.01.ph(context),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.04),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller.selectedBurialCase.value.isEmpty
                                  ? null
                                  : controller.selectedBurialCase.value,
                              hint: Text(
                                'Select a burial case...',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: context.mh * 0.016,
                                ),
                              ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.grey.shade600),
                              items: controller.burialCases
                                  .map((String case_) =>
                                      DropdownMenuItem<String>(
                                        value: case_,
                                        child: Text(
                                          case_,
                                          style: TextStyle(
                                            fontSize: context.mh * 0.016,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: controller.updateBurialCase,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container()),

              /// Mosque Dropdown
              Obx(() => controller.selectedAssignmentType.value == 'mosque'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        0.02.ph(context),
                        Text(
                          'Select Burial Case:',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        0.01.ph(context),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.04),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller.selectedBurialCase.value.isEmpty
                                  ? null
                                  : controller.selectedBurialCase.value,
                              hint: Text(
                                'Select a burial case...',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: context.mh * 0.016,
                                ),
                              ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.grey.shade600),
                              items: controller.burialCases
                                  .map((String case_) =>
                                      DropdownMenuItem<String>(
                                        value: case_,
                                        child: Text(
                                          case_,
                                          style: TextStyle(
                                            fontSize: context.mh * 0.016,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: controller.updateBurialCase,
                            ),
                          ),
                        ),
                        0.02.ph(context),
                        Text(
                          'Select Mosque:',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        0.01.ph(context),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.04),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller.selectedMosque.value.isEmpty
                                  ? null
                                  : controller.selectedMosque.value,
                              hint: Text(
                                'Select a mosque...',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: context.mh * 0.016,
                                ),
                              ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.grey.shade600),
                              items: controller.mosques
                                  .map((String mosque) =>
                                      DropdownMenuItem<String>(
                                        value: mosque,
                                        child: Text(
                                          mosque,
                                          style: TextStyle(
                                            fontSize: context.mh * 0.016,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: controller.updateMosque,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container()),

              0.03.ph(context),

              Text(
                'Additional Instructions:',
                style: TextStyle(
                  fontSize: context.mh * 0.017,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              0.015.ph(context),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: controller.instructionsController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        'Enter any special instructions for the driver...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: context.mh * 0.016,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(context.mw * 0.04),
                  ),
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: Colors.black87,
                  ),
                ),
              ),

              0.03.ph(context),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.mw * 0.04),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.blue.shade600,
                          size: context.mh * 0.02,
                        ),
                        0.02.pw(context),
                        Text(
                          'Estimated Arrival:',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                    0.01.ph(context),
                    Text(
                      'Will be calculated after destination selection',
                      style: TextStyle(
                        fontSize: context.mh * 0.014,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
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
                      Colors.grey.shade700,
                      onCancel ??
                          () {
                            Navigator.of(context).pop();
                          },
                      hasBorder: true,
                    ),
                  ),
                  0.03.pw(context),
                  Expanded(
                    child: _buildButton(
                      context,
                      'Confirm Dispatch',
                      Color(0xff475569),
                      Colors.white,
                      () => _handleConfirm(controller),
                      icon: Icons.send,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleConfirm(DubaiController controller) {
    String selectedOption = '';

    if (controller.selectedAssignmentType.value == 'burial') {
      selectedOption = controller.selectedBurialCase.value;
    } else if (controller.selectedAssignmentType.value == 'mosque') {
      selectedOption = controller.selectedMosque.value;
    }

    onConfirm?.call(
      controller.selectedAssignmentType.value,
      controller.instructionsController.text.trim(),
      selectedOption,
    );

  }

  Widget _buildAssignmentOption(
    BuildContext context,
    DubaiController controller,
    String value,
    String title,
    String description,
    IconData icon,
    Color iconColor,
  ) {
    return Obx(() {
      bool isSelected = controller.selectedAssignmentType.value == value;

      return GestureDetector(
        onTap: () => controller.updateAssignmentType(value),
        child: Container(
          padding: EdgeInsets.all(context.mw * 0.04),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue.shade300 : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Radio<String>(
                value: value,
                groupValue: controller.selectedAssignmentType.value,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.updateAssignmentType(newValue);
                  }
                },
                activeColor: Colors.blue.shade600,
              ),
              0.02.pw(context),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    0.01.ph(context),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: context.mh * 0.014,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                icon,
                color: iconColor,
                size: context.mh * 0.025,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback onTap, {
    bool hasBorder = false,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.mh * 0.018,
          horizontal: context.mw * 0.02,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: hasBorder
              ? Border.all(color: Colors.grey.shade300, width: 1)
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: context.mh * 0.014,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper function to show the dialog
void showDispatchAmbulanceDialog(
  BuildContext context, {
  required String ambulanceId,
  required String driverName,
  required String currentLocation,
  required String status,
  VoidCallback? onCancel,
  Function(String assignmentType, String additionalInstructions,
          String selectedOption)?
      onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return DispatchAmbulanceDialogWidget(
        ambulanceId: ambulanceId,
        driverName: driverName,
        currentLocation: currentLocation,
        status: status,
        onCancel: onCancel,
        onConfirm: (assignmentType, instructions, selectedOption) {
          Navigator.of(context).pop();
          onConfirm?.call(assignmentType, instructions, selectedOption);
        },
      );
    },
  );
}
