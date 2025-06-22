

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/dashboard/presentation/page/dashboard.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SubmissionRecievedDialog extends StatelessWidget {
  const SubmissionRecievedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX:5,sigmaY:5 ),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(),
        shape: ShapeBorder.lerp(InputBorder.none, InputBorder.none, 10),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: commonTopMargin),
          margin: EdgeInsets.symmetric(horizontal: screenPaddingHori),
          decoration: BoxDecoration(
            color: AppColor.white(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: AppText(text: "Submission has been received.",fontSize: heading2,fontWeight: FontWeight.w600,color: AppColor.black(),fontFamily: 'ns',)),
              SizedBox(height: commonHeightS,),
              AppText(text: "Your documents have been sent to the correct authorities. You will receive a notification once everything is completed.",fontSize: text1,textAlign: TextAlign.left,color: AppColor.grey(),fontFamily: 'nr',),
               SizedBox(height: commonHeightM,),
              CustomElevatedButton(onPressed: (){
                Navigator.pop(context);
                showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => Dashboard(),);
              }, text: 'OK',textColor: AppColor.white(),),
              SizedBox(height: commonHeight,),

            ],
          ),
        ),
      ),
    );
  }
}
