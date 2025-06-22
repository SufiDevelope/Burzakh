import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PoliceCallNotificationWidget extends StatelessWidget {
  const PoliceCallNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: commonTopMargin),
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
              AppText(text: "! ",fontSize: text1,color: AppColor.red(),fontFamily: 'ns',),
              AppText(text: "Police needs to speak with you",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: "A representative from Dubai police will initiate a voice call shortly to complete this step.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          Row(
            children: [
              AppText(text: "Time:",fontSize: text2,color: AppColor.black(),fontFamily: 'ns',),
              Expanded(child: AppText(text: " Today at 2:30 PM",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: "Please stay in a quiet space with stable internet to ensure a smooth call.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
        ],
      ),
    );
  }
}
