

import 'dart:ui';

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class UnderConstructionDialog extends StatelessWidget {
  const UnderConstructionDialog({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/animation/under_construction.gif"),
              Center(child: AppText(text: "Coming soon",fontSize: heading2,fontWeight: FontWeight.w600,color: AppColor.black(),fontFamily: 'ns',)),
              SizedBox(height: commonHeightS,),
              AppText(text: "This page is currently being developed and will be available shortly. Once the admin setup is complete, you’ll be able to access and use this feature.",fontSize: text1,textAlign: TextAlign.center,color: AppColor.grey(),fontFamily: 'nr',),
              SizedBox(height: commonHeightM1,),
              CustomElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, text: 'OK',textColor: AppColor.white(),),
              SizedBox(height: commonHeight,),

            ],
          ),
        ),
      ),
    );
  }
}
