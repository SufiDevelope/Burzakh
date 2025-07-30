import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class SendtoVisitorAlertDialog extends StatefulWidget {
  final String? nameEnglish;
  final String? nameArabic;
  final String? alertTime;
  final String? mosqueName;
  final String? descriptionEnglish;
  final String? descriptionArabic;
  final String? cemeteryLoaction;

  const SendtoVisitorAlertDialog({
    Key? key,
    this.nameEnglish,
    this.nameArabic,
    this.alertTime,
    this.mosqueName,
    this.descriptionEnglish,
    this.descriptionArabic,
    this.cemeteryLoaction,
  }) : super(key: key);

  @override
  State<SendtoVisitorAlertDialog> createState() =>
      _SendtoVisitorAlertDialogState();
}

class _SendtoVisitorAlertDialogState extends State<SendtoVisitorAlertDialog> {
  late final TextEditingController nameEnglishController;
  late final TextEditingController nameArabicController;
  late final TextEditingController alertTimeController;
  late final TextEditingController mosqueNameController;
  late final TextEditingController descriptionEnglishController;
  late final TextEditingController descriptionArabicController;
  late final TextEditingController cemeteryLoactionController;

  final CementryController controller = Get.find();

  @override
  void initState() {
    super.initState();
    nameEnglishController =
        TextEditingController(text: widget.nameEnglish ?? '');
    nameArabicController = TextEditingController(text: widget.nameArabic ?? '');
    alertTimeController = TextEditingController(text: widget.alertTime ?? '');
    mosqueNameController = TextEditingController(text: widget.mosqueName ?? '');
    descriptionEnglishController =
        TextEditingController(text: widget.descriptionEnglish ?? '');
    descriptionArabicController =
        TextEditingController(text: widget.descriptionArabic ?? '');
    cemeteryLoactionController =
        TextEditingController(text: widget.cemeteryLoaction ?? '');
  }

  @override
  void dispose() {
    nameEnglishController.dispose();
    nameArabicController.dispose();
    alertTimeController.dispose();
    mosqueNameController.dispose();
    descriptionEnglishController.dispose();
    descriptionArabicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> genderMap = {
      for (String option in controller.genderOptions) option: option,
    };

    final Map<String, String> statusMap = {
      for (String option in controller.statusOptions) option: option,
    };

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.mw * 0.75,
        constraints: BoxConstraints(maxHeight: context.mh * 0.9),
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
            _buildHeader(context),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  children: [
                    SizedBox(height: context.mh * 0.02),
                    _buildTextField(
                        'Name (English)', nameEnglishController, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildGenderDropdown(context, genderMap),
                    SizedBox(height: context.mh * 0.02),
                    _buildTextField('Alert Time', alertTimeController, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildTextField('Cemetery Location',
                        cemeteryLoactionController, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildTextField(
                        'Mosque Name', mosqueNameController, context),
                    SizedBox(height: context.mh * 0.02),
                    _buildTextField('Description (English)',
                        descriptionEnglishController, context,
                        maxLines: 3),
                    SizedBox(height: context.mh * 0.02),
                    _buildTextField('Description (Arabic)',
                        descriptionArabicController, context,
                        maxLines: 3),
                    SizedBox(height: context.mh * 0.02),
                    _buildStatusDropdown(context, statusMap),
                    SizedBox(height: context.mh * 0.02),
                    _buildImportantAlertCheckbox(context),
                    SizedBox(height: context.mh * 0.02),
                    _buildActionButtons(context, controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
            'Send To Visitor\nAlert',
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

  Widget _buildTextField(
      String label, TextEditingController controller, BuildContext context,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(StringTranslateExtension(label).tr(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(fontSize: context.mh * 0.015),
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
                horizontal: 12, vertical: maxLines > 1 ? 12 : 10),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
        ),
      ],
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
        Text(StringTranslateExtension(label).tr(),
            style: TextStyle(
                fontSize: context.mh * 0.015, fontWeight: FontWeight.w500)),
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
                    StringTranslateExtension(entry.value).tr(),
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

  Widget _buildGenderDropdown(
      BuildContext context, Map<String, String> genderMap) {
    return _buildDropdown(
      label: 'Gender',
      value: controller.selectedGender,
      items: genderMap,
      onChanged: (val) => controller.selectedGender.value = val!,
      context: context,
    );
  }

  Widget _buildStatusDropdown(
      BuildContext context, Map<String, String> statusMap) {
    return _buildDropdown(
      label: 'Status',
      value: controller.selectedStatus,
      items: statusMap,
      onChanged: (val) => controller.selectedStatus.value = val!,
      context: context,
    );
  }

  Widget _buildImportantAlertCheckbox(BuildContext context) {
    return Obx(() => Row(
          children: [
            Transform.scale(
              scale: 1.1,
              child: Checkbox(
                value: controller.isImportantAlert.value,
                onChanged: (_) => controller.toggleImportantAlert(),
                activeColor: Colors.blue.shade500,
                checkColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
              ),
            ),
            SizedBox(width: context.mw * 0.01),
            Text(StringTranslateExtension('Mark as Important Alert').tr(),
                style: TextStyle(fontSize: context.mh * 0.015)),
          ],
        ));
  }

  Widget _buildActionButtons(
      BuildContext context, CementryController controller) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(StringTranslateExtension('Cancel').tr(),
                  style: TextStyle(
                      color: Colors.grey, fontSize: context.mh * 0.015)),
            ),
            SizedBox(width: context.mw * 0.02),
            ElevatedButton(
              onPressed: () {
                if (nameEnglishController.text.isEmpty ||
                    alertTimeController.text.isEmpty ||
                    mosqueNameController.text.isEmpty ||
                    descriptionEnglishController.text.isEmpty ||
                    descriptionArabicController.text.isEmpty) {
                } else {
                  controller.sendTOVisitorAlertApi(
                    context,
                    nameEnglishController.text,
                    alertTimeController.text,
                    cemeteryLoactionController.text,
                    mosqueNameController.text,
                    descriptionEnglishController.text,
                    descriptionArabicController.text,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                elevation: 0,
              ),
              child: controller.publishLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2)
                  : Text(StringTranslateExtension('Publish Alert').tr(),
                      style: TextStyle(fontSize: context.mh * 0.015)),
            ),
          ],
        ));
  }
}
