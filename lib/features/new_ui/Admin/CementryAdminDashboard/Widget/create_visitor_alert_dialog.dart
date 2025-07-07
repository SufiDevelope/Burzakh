import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateVisitorAlertDialog extends StatelessWidget {
  const CreateVisitorAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CementryController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.mw * 0.75,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(controller, context),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  spacing: context.mh * 0.02,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNameEnglishField(controller, context),
                    _buildGenderDropdown(controller, context),
                    _buildAlertTimeField(controller, context),
                    _buildCemeteryLocationDropdown(controller, context),
                    _buildMosqueNameField(controller, context),
                    _buildDescriptionEnglishField(controller, context),
                    // _buildDescriptionArabicField(controller, context),
                    _buildStatusDropdown(controller, context),
                    _buildImportantAlertCheckbox(controller, context),
                    _buildActionButtons(controller, context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(CementryController controller, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Create Visitor\nAlert',
            style: TextStyle(
              fontSize: context.mh * 0.022,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.red.shade300),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close, color: Colors.red, size: 20),
              padding: EdgeInsets.all(8),
              constraints: BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameEnglishField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Name (English)',
      controller: controller.nameEnglishController,
      textDirection: TextDirection.ltr,
      context: context,
    );
  }

  Widget _buildNameArabicField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Name (Arabic)',
      controller: controller.nameArabicController,
      textDirection: TextDirection.rtl,
      context: context,
    );
  }

  Widget _buildAlertTimeField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Alert Time',
      controller: controller.alertTimeController,
      textDirection: TextDirection.ltr,
      context: context,
    );
  }

  Widget _buildMosqueNameField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Mosque Name',
      controller: controller.mosqueNameController,
      textDirection: TextDirection.ltr,
      context: context,
    );
  }

  Widget _buildDescriptionEnglishField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Description (English)',
      controller: controller.descriptionEnglishController,
      textDirection: TextDirection.ltr,
      maxLines: 3,
      context: context,
    );
  }

  Widget _buildDescriptionArabicField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Description (Arabic)',
      controller: controller.descriptionArabicController,
      textDirection: TextDirection.rtl,
      maxLines: 3,
      context: context,
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextDirection textDirection,
    int maxLines = 1,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          textDirection: textDirection,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: context.mh * 0.015,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: maxLines > 1 ? 12 : 10,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderDropdown(
      CementryController controller, BuildContext context) {
    return _buildDropdown(
      label: 'Gender',
      value: controller.selectedGender,
      items: controller.genderOptions,
      onChanged: (value) => controller.selectedGender.value = value!,
      context: context,
    );
  }

  Widget _buildCemeteryLocationDropdown(
      CementryController controller, BuildContext context) {
    return _buildDropdown(
      label: 'Cemetery Location',
      value: controller.selectedCemeteryLocation,
      items: controller.cemeteryOptions,
      onChanged: (value) => controller.selectedCemeteryLocation.value = value!,
      context: context,
    );
  }

  Widget _buildStatusDropdown(
      CementryController controller, BuildContext context) {
    return _buildDropdown(
      label: 'Status',
      value: controller.selectedStatus,
      items: controller.statusOptions,
      onChanged: (value) => controller.selectedStatus.value = value!,
      context: context,
    );
  }

  Widget _buildDropdown({
    required String label,
    required RxString value,
    required List<String> items,
    required Function(String?) onChanged,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: context.mh * 0.015,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => DropdownButtonFormField<String>(
              value: value.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: context.mh * 0.015,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              icon:
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
            )),
      ],
    );
  }

  Widget _buildImportantAlertCheckbox(
      CementryController controller, BuildContext context) {
    return Obx(() => Row(
          children: [
            Transform.scale(
              scale: 1.1,
              child: Checkbox(
                value: controller.isImportantAlert.value,
                onChanged: (bool? value) {
                  controller.toggleImportantAlert();
                },
                activeColor: Colors.blue.shade500,
                checkColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            0.01.pw(context),
            Text(
              'Mark as Important Alert',
              style: TextStyle(
                fontSize: context.mh * 0.015,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ));
  }

  Widget _buildActionButtons(
      CementryController controller, BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
                fontSize: context.mh * 0.015,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          0.02.pw(context),
          ElevatedButton(
            onPressed: () {
              controller.createVisitorAlertApi(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
            ),
            child: controller.publishLoading.value
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  )
                : Text(
                    'Publish Alert',
                    style: TextStyle(
                      fontSize: context.mh * 0.015,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
