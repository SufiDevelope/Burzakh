import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/features/onboarding/presentation/page/onboarding_02.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/boarding_button_text.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/container.dart';
import 'package:burzakh/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';

import '../../../../constants/media_query.dart';
import '../../../../widgets/app_text.dart';
import '../../../authentication/presentation/page/sign_up.dart';

class Onboarding01 extends StatelessWidget {
  const Onboarding01({super.key});

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
                  AppText(text: 'Farewell, guided with gentle care',fontSize: 28,fontFamily: 'nm',textAlign: TextAlign.center,fontWeight: FontWeight.w500,),
                  SizedBox(height: commonHeightM,),
                  AppText(text: 'We walk with you through every official step, through end-of-life arrangements with calm and dignity.',textAlign: TextAlign.center,fontSize:16 ,fontFamily: 'nr',),
                  BoardingContainer(widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomListTile(text: "Hospital",prefixIcon: AppAssets.hospitalIcon,),
                      SizedBox(height: 8,),
                      CustomListTile(text: "Police authorities",prefixIcon: AppAssets.policeIcon,),
                      SizedBox(height: 8,),
                      CustomListTile(text: "Graveyard Supervisors",prefixIcon: AppAssets.personsInCircleIcon,),
                      SizedBox(height: 8,),
                      CustomListTile(text: "Burial request completed",prefixIcon: AppAssets.approvedTickIcon,),
                    ],
                  ),),

                  SizedBox(height: commonHeightM,),
                  BoardingButtonText(buttonText: 'SKIP',isShowHeadingText: false,heading: '', subHeading: '', onTapBack: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                  }, onTapNext: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding02(),));
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
