

// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/di_container.dart';
import '../controller/cubit.dart';
import 'burial_request_dialog.dart';

class CallDialog extends StatelessWidget {
   CallDialog({super.key,this.isCall=false});
bool? isCall;
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
              Center(child: AppText(text: "Please Call Dubai Police",fontSize: heading2,fontWeight: FontWeight.w600,color: AppColor.black(),fontFamily: 'ns',)),
              SizedBox(height: commonHeightS,),
              AppText(text: "Since your loved one is resting at home, kindly call Dubai Police on 999.",fontSize: text1,color: AppColor.grey(),fontFamily: 'nr',),
              SizedBox(height: commonHeightS,),
              AppText(text: "${"When speaking with them:".tr()}",fontSize: text1,textAlign: TextAlign.left,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "${"• Share your location clearly".tr()}",fontSize: text1,textAlign: TextAlign.left,color: AppColor.grey(),fontFamily: 'nr',),
              AppText(text: "${"• Let them know if you need an ambulance".tr()}",fontSize: text1,textAlign: TextAlign.left,color: AppColor.grey(),fontFamily: 'nr',),
              SizedBox(height: commonHeightS,),
              AppText(text: "They will guide you on the next steps with care.",fontSize: text1,textAlign: TextAlign.left,color: AppColor.grey(),fontFamily: 'nr',),
              SizedBox(height: commonHeightM,),
              CustomElevatedButton(onPressed:()async{

                if(isCall==true){
                  var _homeCubit=DiContainer().sl<HomeCubit>();
               await   _homeCubit.openDialPad('999');
                }else{
                  Navigator.pop(context);
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => BurialRequestDialog(),);
                }
              }, text: 'CALL 999',textColor: AppColor.white(),),
              SizedBox(height: commonHeight,),

            ],
          ),
       ),
      ),
    );
  }
}
