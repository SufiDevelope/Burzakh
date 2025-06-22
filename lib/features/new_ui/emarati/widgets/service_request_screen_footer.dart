import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';

class ServiceRequestScreenFooter extends StatelessWidget {
  const ServiceRequestScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppText(
             text:
            "What Happens Next?",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.black(),
             fontFamily: 'ns',
          ),
          const SizedBox(height: 8),
          AppText(
            text:
            "The Community Development Authority will review your request and make arrangements for the mourning tent.",
              fontSize: 14,
              color: Colors.grey[600],
          ),
          const SizedBox(height: 8),
          AppText(
            text:
            "You will receive a notification when your request is approved or if additional information is needed.",

              fontSize: 14,
              color: Colors.grey[600],

          ),
        ],
      ),
    );
  }
}
