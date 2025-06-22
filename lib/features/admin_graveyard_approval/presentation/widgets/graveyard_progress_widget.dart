// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class GraveyardProgressWidget extends StatelessWidget {
  GraveyardProgressWidget({super.key,required this.name,required this.onTap,required this.approvalStep,required this.id,required this.status});
  String name;
  String id;
  int status;
  int approvalStep;
  VoidCallback onTap;
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
              Spacer(),
              CustomElevatedButton(onPressed: onTap, width: 75,height: 30,bgColor: AppColor.white(),borderColor: AppColor.primary(),showBorder: true,radius: 50,text: 'VIEW',textColor: AppColor.black(),fontSize: text3,fontFamily: 'ns')
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
              AppText(text: approvalStep==0?"Police Review":"Graveyard Approval",fontSize: heading3,color: AppColor.black(),fontFamily: 'nm',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Status",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "Pending",fontSize: heading3,color: AppColor.yellowLight(),fontFamily: 'nm',),

            ],
          ),
          approvalStep==0? SizedBox():SizedBox(height: commonHeightS,),
          approvalStep==0? SizedBox():Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Status",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "Approved",fontSize: heading3,color: AppColor.green(),fontFamily: 'nm',),

            ],
          ),
        ],
      ),
    );
  }
}
