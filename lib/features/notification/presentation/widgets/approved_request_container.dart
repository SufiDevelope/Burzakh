import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_widgets_size.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_button.dart';

class ApprovedRequestContainer extends StatelessWidget {
  final String title;
  final String description;
  const ApprovedRequestContainer({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenPaddingHori),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.lightBlueColor()
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppAssets.tickIcon),
              SizedBox(width: 4,),
              AppText(text: "$title",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: description,fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          SizedBox(height: commonTopMargin,),
          // Row(
          //   children: [
          //     Expanded(child: AppText(text: "Thank you for your patience during this sacred process.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
          //   ],
          // ),
          // SizedBox(height: commonHeightS,),

        ],
      ),
    );
  }
}
