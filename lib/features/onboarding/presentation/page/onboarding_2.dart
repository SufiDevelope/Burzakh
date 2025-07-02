import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/boarding_button_text.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/container.dart';
import 'package:flutter/material.dart';

import '../../../../constants/media_query.dart';
import 'onboarding_3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

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
                  BoardingButtonText(buttonText: 'BACK', heading: 'Ways We Are Here to Support You', subHeading: 'Barzakh brings every essential service together, guiding you through each step with simplicity.', onTapBack: () {Navigator.pop(context);}, onTapNext: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding3(),));
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
