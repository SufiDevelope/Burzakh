import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'call_dialog.dart';

class VideoCallRequiredWidget extends StatelessWidget {
  const VideoCallRequiredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.lightBlueColor()
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: "Initiate voice Call",fontSize: text1,color: AppColor.black(),fontFamily: 'ns',),
                SizedBox(height: 7,),
                Row(
                  children: [
                    Expanded(child: AppText(text: "Tap the button to view the scheduled call. A police officer will connect with you shortly.",fontSize: text2,color: AppColor.grey(),fontFamily: 'nr',)),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => CallDialog(isCall:true,),);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 6),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 1,color: AppColor.primary())),
              child:
              AppText(text: "VIEW",fontSize: text1,color: AppColor.primary(),fontFamily: 'ns',),

            ),
          )
        ],
      ),
    );
  }
}
