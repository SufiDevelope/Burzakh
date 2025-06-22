// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_widgets_size.dart';

class BoardingButtonText extends StatelessWidget {
   BoardingButtonText({super.key,required this.buttonText,this.isLastPage=false,required this.heading,required this.subHeading,required this.onTapBack,required this.onTapNext,this.isShowHeadingText=true});
  String heading;
  String subHeading;
  String buttonText;
  VoidCallback onTapNext;
  VoidCallback onTapBack;
  bool? isLastPage;
  bool? isShowHeadingText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isShowHeadingText==true? SizedBox(height: commonHeightM,):SizedBox(),
        isShowHeadingText==true? AppText(text: heading,fontSize: 28,fontFamily: 'nb',fontWeight: FontWeight.w500,):SizedBox(),
        isShowHeadingText==true? SizedBox(height: commonHeightS,):SizedBox(),
        isShowHeadingText==true? AppText(text: subHeading,fontSize:14 ,fontFamily: 'nr',):SizedBox(),
        isShowHeadingText==true? SizedBox(height: commonHeightM,):SizedBox(),
        isLastPage==true?
        Column(
          children: [
            CustomElevatedButton(onPressed: onTapNext, text: 'SIGN UP',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,),
            SizedBox(height: commonHeightS,),
            CustomElevatedButton(onPressed: onTapBack, text: buttonText,bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,textColor: AppColor.primary(),fontFamily: 'nb',),
          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(onPressed: onTapBack, text: buttonText,width: 111,bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,textColor: AppColor.primary(),fontFamily: 'nb',),
            CustomElevatedButton(onPressed: onTapNext, text: 'NEXT',width: 111,bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,),
          ],
        ),
        SizedBox(height: commonHeightM,)
      ],
    );
  }
}
