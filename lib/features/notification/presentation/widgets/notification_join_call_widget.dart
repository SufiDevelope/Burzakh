import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/call_dialog.dart';

class NotificationJoinCallWidget extends StatelessWidget {
  const NotificationJoinCallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              AppText(text: "Voice Call with Dubai Police",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
            ],
          ),
          SizedBox(height: commonHeightS,),
          Row(
            children: [
              Expanded(child: AppText(text: "Begin the call when you feel ready.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
            ],
          ),
          SizedBox(height: commonHeightS,),
          CustomElevatedButton(onPressed: (){
            showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => CallDialog(isCall:true,),);

          }, text: 'Call',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,fontSize: 14,height: 45,),

        ],
      ),
    );
  }
}
