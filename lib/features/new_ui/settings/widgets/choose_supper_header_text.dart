import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class ChooseSupperHeaderText extends StatelessWidget {
  const ChooseSupperHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text:
          "Connect with the appropriate department",
            fontSize: 14,
            color: Color(0xFF666666),
        ),

        const SizedBox(height: 16),
        AppText(text:
          "Select the department that best matches your inquiry. Our support team is here to assist you through every step of the process.",
            fontSize: 14,
            color: Colors.grey[500],
        ),
      ],
    );
  }
}
