import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateWhatsappAnnouncementDialog extends StatelessWidget {
  const CreateWhatsappAnnouncementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final CementryController controller = Get.find<CementryController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.mw * 0.9,
        constraints: BoxConstraints(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Send WhatsApp\nAnnouncement',
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close,
                          color: Colors.red.shade600, size: 20),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
            ),

            // Form content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and timing info
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Text(
                        'Family Preferred Time: After Maghrib Prayer',
                        style: TextStyle(
                          fontSize: context.mh * 0.015,
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    0.02.ph(context),

                    // Deceased Name
                    _buildSectionTitle('Deceased Name', context),
                    SizedBox(height: 8),
                    _buildTextField(
                      controller: controller.whatsappDeceasedNameController,
                      hintText: 'Enter deceased name',
                      prefixIcon: Icons.person,
                      context: context,
                    ),

                    0.02.ph(context),

                    // Gender Selection
                    _buildSectionTitle('Gender', context),
                    SizedBox(height: 8),
                    Obx(() => Column(
                          children: [
                            RadioListTile<String>(
                              title: Text('Male',
                                  style:
                                      TextStyle(fontSize: context.mh * 0.012)),
                              value: 'Male',
                              groupValue:
                                  controller.selectedWhatsappGender.value,
                              onChanged: (value) {
                                controller.setSelectedWhatsappGender(value!);
                              },
                              activeColor: Colors.green.shade600,
                            ),
                            RadioListTile<String>(
                              title: Text(
                                'Female',
                                style: TextStyle(fontSize: context.mh * 0.012),
                              ),
                              value: 'Female',
                              groupValue:
                                  controller.selectedWhatsappGender.value,
                              onChanged: (value) {
                                controller.setSelectedWhatsappGender(value!);
                              },
                              activeColor: Colors.green.shade600,
                            ),
                          ],
                        )),

                    0.02.ph(context),

                    // Nationality
                    _buildSectionTitle('Nationality', context),
                    SizedBox(height: 8),
                    _buildTextField(
                      controller: controller.whatsappNationalityController,
                      hintText: 'Enter nationality',
                      prefixIcon: Icons.flag,
                      context: context,
                    ),
                    0.02.ph(context),

                    // Prayer Time
                    _buildSectionTitle('Prayer Time', context),
                    SizedBox(height: 8),
                    Obx(
                      () => _buildDropdown(
                        value: controller.selectedWhatsappPrayerTime.value,
                        items: controller.prayerTimeOptions,
                        onChanged: (value) {
                          controller.setSelectedWhatsappPrayerTime(value!);
                        },
                        prefixIcon: Icons.access_time,
                        context: context,
                      ),
                    ),

                    0.02.ph(context),

                    // Burial Location
                    _buildSectionTitle('Burial Location', context),
                    SizedBox(height: 8),
                    Obx(
                      () => _buildDropdown(
                        value: controller.selectedWhatsappBurialLocation.value,
                        items: controller.burialLocationOptions,
                        onChanged: (value) {
                          controller.setSelectedWhatsappBurialLocation(value!);
                        },
                        prefixIcon: Icons.location_on,
                        context: context,
                      ),
                    ),

                    0.02.ph(context),

                    // Optional Note
                    _buildSectionTitle('Optional Note', context),
                    SizedBox(height: 8),
                    _buildTextField(
                      controller: controller.whatsappOptionalNoteController,
                      hintText: 'Additional information...',
                      maxLines: 3,
                      prefixIcon: Icons.note,
                      context: context,
                    ),

                    0.02.ph(context),

                    // WhatsApp Group Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.group, color: Colors.green.shade600),
                              0.01.pw(context),
                              Text(
                                'Dubai Funerals Group',
                                style: TextStyle(
                                  fontSize: context.mh * 0.018,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                          0.01.ph(context),
                          Text(
                            'https://chat.whatsapp.com/EHuMmj5BN',
                            style: TextStyle(
                              color: Colors.green.shade600,
                              fontSize: context.mh * 0.013,
                            ),
                          ),
                        ],
                      ),
                    ),
                    0.02.ph(context),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.grey.shade600,
                              side: BorderSide(color: Colors.grey.shade300),
                              padding: EdgeInsets.symmetric(
                                  vertical: context.mh * 0.012),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: context.mh * 0.012,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        0.02.pw(context),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: controller.whatsappPublishLoading.value
                              ? null
                              : () {
                                  controller.sendWhatsappAnnouncement(context);
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: context.mh * 0.012),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: controller.whatsappPublishLoading.value
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : Text(
                                  'Send Announcement',
                                  style: TextStyle(
                                    fontSize: context.mh * 0.012,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: context.mh * 0.015,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    IconData? prefixIcon,
    int? maxLines,
    required BuildContext context,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey.shade500)
            : null,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: context.mh * 0.015,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.shade500, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    IconData? prefixIcon,
    required BuildContext context,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: context.mh * 0.012,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey.shade500)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green.shade500, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
