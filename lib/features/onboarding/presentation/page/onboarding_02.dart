import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_2.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/boarding_button_text.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/container.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/support_you_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/media_query.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_button.dart';
import 'onboarding_03.dart';

class Onboarding02 extends StatelessWidget {
  const Onboarding02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: mdHeight(context)*1,
        width: mdWidth(context)*1,
        decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage(AppAssets.bgImage),fit: BoxFit.fitHeight)
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: commonHeightM,),
                  Image.asset(AppAssets.appLogo,width: logoWidthBoarding,height:logoWidthBoarding,),
                  SizedBox(height: commonHeightM,),
                  AppText(text: 'Ways We Are Here to Support You',fontSize: 28,fontFamily: 'nm',textAlign: TextAlign.center,fontWeight: FontWeight.w500,),
                  SizedBox(height: commonHeightM,),
                  AppText(text: 'Barzakh brings every essential service together, guiding you through each step with simplicity.',textAlign: TextAlign.center,fontSize:16 ,fontFamily: 'nr',),
                  SizedBox(height: commonHeightM,),
                  Row(
                    children: [
                      Expanded(child:
                      SupportYouWidgets(text: 'Step-by-step Guidance',icon: AppAssets.guidanceIcon,)
                      ),
                      SizedBox(width: 10,),
                      Expanded(child:
                      SupportYouWidgets(text: 'Document Management',icon: AppAssets.documentGreenIcon,)
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(child:
                      SupportYouWidgets(text: 'Burial arrangement',icon: AppAssets.burialArrangementIcon,)
                      ),
                      SizedBox(width: 10,),
                      Expanded(child:
                      SupportYouWidgets(text: 'Religious guidance',icon: AppAssets.moonStarIcon,)
                      ),
                    ],
                  ),

                  SizedBox(height: commonHeightM,),
                  BoardingButtonText(buttonText: 'BACK', isShowHeadingText: false,heading: '', subHeading: '', onTapBack: () {
                    Navigator.pop(context);
                  }, onTapNext: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding03(),));
                  }),
                  SizedBox(height: commonHeightM,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
