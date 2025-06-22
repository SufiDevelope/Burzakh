// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class ActiveCaseDetailWidget extends StatelessWidget {
   ActiveCaseDetailWidget({super.key,required this.name,required this.id,required this.stage,required this.status});
String name;
String stage;
String id;
int status;
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
              AppText(text: "Case",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),
              AppText(text: " #$id",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Name",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "$name",fontSize: heading3,color: AppColor.black(),fontFamily: 'nm',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Stage",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "$stage",fontSize: heading3,color: AppColor.black(),fontFamily: 'nm',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: " Status",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: status==0?"Pending":"Needs edit",fontSize: heading3,color: status==0?AppColor.yellowLight():AppColor.red1(),fontFamily: 'nm',),

            ],
          ),
        ],
      ),
    );
  }
}
