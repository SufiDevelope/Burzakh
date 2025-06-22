import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../widgets/app_text.dart';
import '../../data/model/case_model.dart';

// ignore: must_be_immutable
class CaseWidget extends StatelessWidget {
   CaseWidget({super.key,required this.model,this.onTap});

   CaseModel model;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    String formatted = DateFormat('MMMM d, y, h:mm a').format(model.createdAt);
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.lightBlueColor()
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(text: "Case",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
                  AppText(text: " ${model.caseName}",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
                ],
              ),
              model.caseStatus!="pending"?  AppText(text: "Completed",fontSize: text1,color: AppColor.green(),fontFamily: 'ns',):SizedBox(),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: "${"Created".tr()} $formatted",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          SizedBox(height: commonHeightS,),
          model.caseStatus!="pending"? CustomElevatedButton(onPressed: onTap??(){}, text: 'VIEW'):Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(onPressed: (){}, text: 'CANCEL',width: 118,bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,fontSize: 14,height: 45,textColor: AppColor.primary(),fontFamily: 'nb',),
              CustomElevatedButton(onPressed: onTap??(){}, text: 'VIEW',width: 118,bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,fontSize: 14,height: 45,),
            ],
          ),
        ],
      ),
    );
  }
}
