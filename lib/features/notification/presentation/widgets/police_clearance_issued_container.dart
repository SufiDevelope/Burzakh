import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_widgets_size.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

class PoliceClearanceIssuedContainer extends StatelessWidget {
  const PoliceClearanceIssuedContainer({super.key});

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
              AppText(text: "Police clearance successfully issued",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: "${"Cleared with approval on".tr()} April 23, 2025, at 3:42 PM.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          SizedBox(height: commonTopMargin,),
          Row(
            children: [
              Expanded(child: AppText(text: "After downloading, kindly upload the police approval for the Graveyard Supervisor’s review.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          SizedBox(height: commonHeightS,),
          CustomElevatedButton(onPressed: (){}, text: 'DOWNLOAD CLEARANCE',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,fontSize: 14,height: 45,),

          SizedBox(height: commonHeightS,),

        ],
      ),
    );
  }
}
