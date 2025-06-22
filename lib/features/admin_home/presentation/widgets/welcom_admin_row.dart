import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

class WelcomeAdminRow extends StatelessWidget {
  const WelcomeAdminRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: commonHeightM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: "Good Evening, Name.",fontFamily: 'ns',fontSize: text1,color: AppColor.black(),),
          AppText(text: "April 29, 2025 ∙ 03:15 PM",fontFamily: 'nr',fontSize: text2,color: AppColor.black(),)
        ],
      ),
    );
  }
}
