import 'dart:io';
import 'dart:ui';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/custom_button.dart';

class CloseAppSheet extends StatelessWidget {
  const CloseAppSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX:5,sigmaY:5 ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: screenPaddingHori),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: commonHeightM,),
            Image.asset(AppAssets.appLogo,width: 100,height: 100,),
            SizedBox(height: commonHeightM1,),
            AppText(text: "Close The App",fontSize: heading2,fontWeight: FontWeight.w600,color: AppColor.black(),fontFamily: 'ns',),
            AppText(text: "Do you want to close and exit app",fontSize: heading3,textAlign: TextAlign.center,color: AppColor.grey(),fontFamily: 'nr',),

            SizedBox(height: commonHeightM1,),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    height: context.mh * 0.04,
                    onPressed: (){
                    Navigator.pop(context);
                    }, text: "CANCEL",textColor: AppColor.white(),bgColor: AppColor.greyLight1(),fontWeight: FontWeight.w600, fontSize: context.mh * 0.016,),
                ),
                0.04.pw(context),
                Expanded(
                  child: CustomElevatedButton(
                    height: context.mh * 0.04,
                    onPressed: (){
                    exit(0);
                  }, text: "CONTINUE",textColor: AppColor.white(),fontWeight: FontWeight.w600, fontSize: context.mh * 0.016,),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

var documentCubit=DiContainer().sl<HomeCubit>();
