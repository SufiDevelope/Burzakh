import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateVisitorAlertDialog extends StatelessWidget {
  const CreateVisitorAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CementryController>();

    final Map<String, String> genderMap = {
      'Male': StringTranslateExtension("Male").tr(),
      'Female': StringTranslateExtension("Female").tr(),
    };

    final Map<String, String> cemeteryMap = {
      'Al Qusais Cemetery': StringTranslateExtension('Al Qusais Cemetery').tr(),
      'Al Warqa Cemetery': StringTranslateExtension('Al Warqa Cemetery').tr(),
      'Jumeirah Cemetery': StringTranslateExtension('Jumeirah Cemetery').tr(),
      'Dubai Silicon Oasis Cemetery':
          StringTranslateExtension('Dubai Silicon Oasis Cemetery').tr(),
      'Other Cemetery': StringTranslateExtension('Other Cemetery').tr(),
    };

    final Map<String, String> statusMap = {
      'Confirmed': StringTranslateExtension('Confirmed').tr(),
      'Pending': StringTranslateExtension('Pending').tr(),
      'Cancelled': StringTranslateExtension('Cancelled').tr(),
    };

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
              offset: const Offset(0, 5),
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
                  children: [
                    SizedBox(height: context.mh * 0.02),
                    _buildNameEnglishField(controller, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildGenderDropdown(controller, context, genderMap),
                    SizedBox(height: context.mh * 0.02),
                    _buildAlertTimeDropdown(controller, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildCemeteryLocationDropdown(
                        controller, context, cemeteryMap),
                    SizedBox(height: context.mh * 0.02),
                    _buildMosqueNameField(controller, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildDescriptionEnglishField(controller, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildDescriptionArabicField(controller, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildStatusDropdown(controller, context, statusMap),
                    SizedBox(height: context.mh * 0.02),
                    _buildImportantAlertCheckbox(controller, context),
                    SizedBox(height: context.mh * 0.02),
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringTranslateExtension("Create Visitor Alert").tr(),
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
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
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
      context: context,
    );
  }

  Widget _buildMosqueNameField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Mosque Name',
      controller: controller.mosqueNameController,
      context: context,
    );
  }

  Widget _buildDescriptionEnglishField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Description (English)',
      controller: controller.descriptionEnglishController,
      maxLines: 3,
      context: context,
    );
  }

  Widget _buildDescriptionArabicField(
      CementryController controller, BuildContext context) {
    return _buildTextField(
      label: 'Description (Arabic)',
      controller: controller.descriptionArabicController,
      maxLines: 3,
      context: context,
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringTranslateExtension(label).tr(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
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

  Widget _buildGenderDropdown(CementryController controller,
      BuildContext context, Map<String, String> genderMap) {
    return _buildDropdown(
      label: 'Gender',
      value: controller.selectedGender,
      items: genderMap,
      onChanged: (value) => controller.selectedGender.value = value!,
      context: context,
    );
  }

  Widget _buildCemeteryLocationDropdown(CementryController controller,
      BuildContext context, Map<String, String> cemeteryMap) {
    return _buildDropdown(
      label: 'Cemetery Location',
      value: controller.selectedCemeteryLocation,
      items: cemeteryMap,
      onChanged: (value) => controller.selectedCemeteryLocation.value = value!,
      context: context,
    );
  }

  Widget _buildStatusDropdown(CementryController controller,
      BuildContext context, Map<String, String> statusMap) {
    return _buildDropdown(
      label: 'Status',
      value: controller.selectedStatus,
      items: statusMap,
      onChanged: (value) => controller.selectedStatus.value = value!,
      context: context,
    );
  }

  Widget _buildDropdown({
    required String label,
    required RxString value,
    required Map<String, String> items,
    required Function(String?) onChanged,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringTranslateExtension(label).tr(),
          style: TextStyle(
            fontSize: context.mh * 0.015,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => DropdownButtonFormField<String>(
              value: items.keys.contains(value.value) ? value.value : null,
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
              items: items.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key,
                  child: Text(
                    entry.value,
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
            SizedBox(width: context.mw * 0.01),
            Text(
              StringTranslateExtension('Mark as Important Alert').tr(),
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
              StringTranslateExtension('Cancel').tr(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: context.mh * 0.015,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: context.mw * 0.02),
          ElevatedButton(
            onPressed: () {
              controller.sendVisitorAlertApi(context);
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
                    StringTranslateExtension('Publish Alert').tr(),
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

  Widget _buildAlertTimeDropdown(
      CementryController controller, BuildContext context) {
    // Create a map for alert time options with translated values
    final Map<String, String> alertTimeMap = {
      for (String option in controller.alertTimeOptions)
        option: StringTranslateExtension(option).tr(),
      'Custom Time': StringTranslateExtension('Custom Time').tr(),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringTranslateExtension('Alert Time').tr(),
          style: TextStyle(
            fontSize: context.mh * 0.015,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  value: alertTimeMap.keys
                          .contains(controller.selectedAlertTime.value)
                      ? controller.selectedAlertTime.value
                      : 'Custom Time',
                  onChanged: (value) async {
                    if (value == 'Custom Time') {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        final formatted = picked.format(context);
                        controller.customAlertTime.value = formatted;
                        controller.alertTimeController.text = formatted;
                      }
                    } else {
                      controller.alertTimeController.text = value!;
                    }
                    controller.selectedAlertTime.value = value!;
                  },
                  items: alertTimeMap.entries.map((entry) {
                    return DropdownMenuItem<String>(
                      value: entry.key,
                      child: Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: context.mh * 0.015,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
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
                      borderSide:
                          BorderSide(color: Colors.blue.shade400, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                  ),
                  icon: Icon(Icons.keyboard_arrow_down,
                      color: Colors.grey.shade600),
                ),
                if (controller.selectedAlertTime.value == 'Custom Time' &&
                    controller.customAlertTime.value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${StringTranslateExtension("Selected Time").tr()}: ${controller.customAlertTime.value}',
                      style: TextStyle(
                        fontSize: context.mh * 0.015,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}
