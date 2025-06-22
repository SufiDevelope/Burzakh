import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_2.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/boarding_button_text.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/container.dart';
import 'package:flutter/material.dart';

import '../../../../constants/media_query.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
                  Image.asset(AppAssets.appLogo,width: logoWidthBoarding,height: logoHeightBoarding,),
                  BoardingContainer(),
                  BoardingButtonText(buttonText: 'SKIP', heading: 'Farewell, guided with gentle care', subHeading: 'We walk with you through every official step, through end-of-life arrangements with calm and dignity.', onTapBack: () {}, onTapNext: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding2(),));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
