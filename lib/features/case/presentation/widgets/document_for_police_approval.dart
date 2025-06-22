// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/home/data/model/case_detail_model.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class DocumentForPoliceApproval extends StatelessWidget {
   DocumentForPoliceApproval({super.key,required this.model});
CaseDetailModel model;
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
          AppText(text: "Documents for Police Approval",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "Death notification",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text:model.deathNotificationFileStatus=='pending'? "Pending":"Approved",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: AppText(text: "Hospital certificate",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',)),
              AppText(text: model.hospitalCertificateStatus=='pending'? "Pending":"Approved",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),

            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: AppText(text: "Passport/EID of deceased back",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',)),
              AppText(text: model.passportOrEmirateIdFrontStatus=='pending' || model.passportOrEmirateIdBackStatus=='pending'? "Pending":"Approved",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),

            ],
          ),
          SizedBox(height: commonHeightS,),
        ],
      ),
    );
  }
}
