// ignore_for_file: must_be_immutable



import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_description_text_field.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';import 'dart:ui';


class ResubmitReasonDialog extends StatelessWidget {
   ResubmitReasonDialog({super.key});
TextEditingController controller = TextEditingController();
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
              Center(child: AppText(text: "Ask for a New Upload",fontSize: heading2,fontWeight: FontWeight.w600,color: AppColor.black(),fontFamily: 'ns',)),
              SizedBox(height: commonHeightS,),
              CustomDescriptionTextField(controller: controller, hintFontSize: 12,maxLines: 3,subTitle: 'Explain briefly why you’re asking for a new file (e.g., blurry photo, wrong document).'),
              SizedBox(height: commonHeightM1,),
              CustomElevatedButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, 'adminDashboard', (route) => false,);
              }, text: 'SEND',textColor: AppColor.white(),),
              SizedBox(height: commonHeight,),

            ],
          ),
        ),
      ),
    );
  }
}
