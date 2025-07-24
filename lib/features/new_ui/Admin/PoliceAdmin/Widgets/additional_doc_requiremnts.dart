import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class AdditionalDocsRequirementsDialog extends StatelessWidget {
  final String caseNumber;
  final String personName;
  final VoidCallback onClose;
  final Function(String requirements) onSubmit;

  const AdditionalDocsRequirementsDialog({
    super.key,
    required this.caseNumber,
    required this.personName,
    required this.onClose,
    required this.onSubmit,
  });

  static void show(
    BuildContext context, {
    required String caseNumber,
    required String personName,
    required Function(String requirements) onSubmit,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AdditionalDocsRequirementsDialog(
        caseNumber: caseNumber,
        personName: personName,
        onClose: () => Navigator.pop(context),
        onSubmit: onSubmit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController requirementsController =
        TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringTranslateExtension('Additional Docs Requirements').tr(),
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E3A59),
                  ),
                ),
                0.01.pw(context),
                GestureDetector(
                  onTap: () => onClose(),
                  child: Icon(
                    Icons.close,
                    color: Color(0xFF2E3A59),
                    size: 24,
                  ),
                ),
              ],
            ),

            0.016.ph(context),

            // Case Information
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE9ECEF)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        StringTranslateExtension('Case: ').tr(),
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF495057),
                        ),
                      ),
                      Text(
                        '$caseNumber',
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF495057),
                        ),
                      ),
                    ],
                  ),
                  0.005.ph(context),
                  Row(
                    children: [
                      Text(
                        StringTranslateExtension('Applicant: ').tr(),
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: Color(0xFF6C757D),
                        ),
                      ),
                      Text(
                        '$personName',
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: Color(0xFF6C757D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            0.02.ph(context),

            // Requirements Input Field
            Text(
              StringTranslateExtension(
                      'Specify Additional Document Requirements:')
                  .tr(),
              style: TextStyle(
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E3A59),
              ),
            ),

            0.012.ph(context),

            TextFormField(
              controller: requirementsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: StringTranslateExtension(
                        'Please specify the additional documents required for this case...')
                    .tr(),
                hintStyle: TextStyle(
                  color: Color(0xFF6C757D),
                  fontSize: context.mh * 0.014,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFDEE2E6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFF4A7C59), width: 2),
                ),
                contentPadding: const EdgeInsets.all(16),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                fontSize: context.mh * 0.014,
                color: Color(0xFF2E3A59),
              ),
              textAlignVertical: TextAlignVertical.top,
            ),

            0.024.ph(context),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onClose,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Color(0xFFDEE2E6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      StringTranslateExtension('Cancel').tr(),
                      style: TextStyle(
                        color: Color(0xFF6C757D),
                        fontWeight: FontWeight.w600,
                        fontSize: context.mh * 0.014,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (requirementsController.text.trim().isNotEmpty) {
                        onSubmit(requirementsController.text.trim());
                        onClose();
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please specify the additional document requirements',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.TOP,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00734B),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      StringTranslateExtension('Send Request').tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: context.mh * 0.014,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
