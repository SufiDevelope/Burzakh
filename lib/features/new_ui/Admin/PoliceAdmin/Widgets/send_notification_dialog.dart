import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendNotificationDialog extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String title, String body) onSend;

  const SendNotificationDialog({
    super.key,
    required this.onClose,
    required this.onSend,
  });

  static void show(
    BuildContext context, {
    required Function(String title, String body) onSend,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SendNotificationDialog(
        onClose: () => Navigator.pop(context),
        onSend: onSend,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
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
                  'Send Notification',
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E3A59),
                  ),
                ),
                IconButton(
                  onPressed: onClose,
                  icon: Icon(Icons.close),
                  iconSize: context.mh * 0.024,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            0.02.ph(context),

            // Body Field
            Text(
              'Message',
              style: TextStyle(
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E3A59),
              ),
            ),
            0.01.ph(context),

            TextFormField(
              controller: bodyController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter notification message...',
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
                contentPadding: const EdgeInsets.all(12),
                filled: true,
                fillColor: Colors.white,
              ),
              style: TextStyle(
                fontSize: context.mh * 0.014,
                color: Color(0xFF2E3A59),
              ),
              textAlignVertical: TextAlignVertical.top,
            ),
            0.02.ph(context),

            // Send Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final title = titleController.text.trim();
                  final body = bodyController.text.trim();
                  if (title.isNotEmpty && body.isNotEmpty) {
                    onSend(title, body);
                    onClose();
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please fill in both title and body fields',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A7C59),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Send',
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
      ),
    );
  }
}
