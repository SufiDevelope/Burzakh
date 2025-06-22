import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/page/sign_up.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/boarding_button_text.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/container.dart';
import 'package:flutter/material.dart';

import '../../../../constants/media_query.dart';
import '../../../authentication/presentation/page/login.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                  BoardingButtonText(buttonText: 'LOGIN',isLastPage: true, heading: 'Languages, provided for your ease', subHeading: 'To make your journey easier and more comforting, Barzakh offers support in many languages.', onTapBack: () {                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));}, onTapNext: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
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
