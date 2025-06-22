// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/admin_graveyard_approval/presentation/widgets/docment_drop_down.dart';
import 'package:burzakh/features/admin_graveyard_approval/presentation/widgets/resubmit_reason_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class DocumentUploadedWidget extends StatelessWidget {
  DocumentUploadedWidget({super.key,});

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
              AppText(text: "Documents uploaded",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: AppText(text: "Death Notification",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',)),
              DocumentDropDown(onSelected: (p0) {
                log("62438 //${p0}");
                if(p0=="Resubmit"){
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => ResubmitReasonDialog(),);

                }
              },),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: AppText(text: "Hospital Certificate",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',)),
              DocumentDropDown(onSelected: (p0) {
                log("62438 //${p0}");
                if(p0=="Resubmit"){
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => ResubmitReasonDialog(),);

                }
              },),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: AppText(text: "Passport or Emirates ID of Deceased",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',)),

              DocumentDropDown(onSelected: (p0) {
                log("62438 //${p0}");
                if(p0=="Resubmit"){
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => ResubmitReasonDialog(),);

                }
              },),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: AppText(text: "Police Clearance Document",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',)),
              DocumentDropDown(onSelected: (p0) {
                log("62438 //${p0}");
                if(p0=="Resubmit"){
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => ResubmitReasonDialog(),);

                }
              },),


            ],
          ),
        ],
      ),
    );
  }
}
