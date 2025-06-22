// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class BurialDetailWidget extends StatelessWidget {
  BurialDetailWidget({super.key,required this.citizen,required this.burialTime,required this.commentary});
  String burialTime;
  String commentary;
  String citizen;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenPaddingHori),
      padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.lightBlueColor()
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(text: "Burial details",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Burial timing",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "$burialTime",fontSize: text1,color: AppColor.black(),fontFamily: 'nm',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Preferred commentary ",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "$commentary",fontSize: text1,color: AppColor.black(),fontFamily: 'nm',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Was your loved one an Emirati citizen?",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "$citizen",fontSize: text1,color: AppColor.black(),fontFamily: 'nm',),

            ],
          ),
        ],
      ),
    );
  }
}
