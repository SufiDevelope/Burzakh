import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';

class ChooseSupportTopbar extends StatelessWidget {
  const ChooseSupportTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: AppColor.bgPrimary(),
        border: Border(
          bottom: BorderSide(
            color: AppColor.greyLight1(),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          AppText(text:
            "Choose Support Type",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            fontFamily: 'ns',
          ),
        ],
      ),
    );
  }
}
