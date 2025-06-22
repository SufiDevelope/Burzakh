import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/features/authentication/presentation/page/sign_up.dart';
import 'package:burzakh/features/authentication/presentation/page/signup_with_uae.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/media_query.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../dashboard/presentation/page/dashboard.dart';
import 'login.dart';

class LoginScreenWithUae extends StatefulWidget {
  const LoginScreenWithUae({super.key});

  @override
  State<LoginScreenWithUae> createState() => _LoginScreenWithUaeState();
}

class _LoginScreenWithUaeState extends State<LoginScreenWithUae> {
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController passport=TextEditingController();
  TextEditingController marsoom=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        height: mdHeight(context)*1,
        width: mdWidth(context)*1,
        // decoration: BoxDecoration(
        //     image:DecorationImage(image: AssetImage(AppAssets.bgImage),fit: BoxFit.fitHeight)
        // ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.appLogo,width: logoWidthBoarding,height: logoHeightBoarding,),
                  SizedBox(height: commonHeightM,),
                  AppText(text: 'Login to your account',fontFamily: 'ns',fontWeight: FontWeight.w600,fontSize: heading1,),
                  SizedBox(height: commonHeight,),
                  AppText(text: 'Continue the process for funeral permit.',textAlign: TextAlign.center,fontFamily: 'nr',fontSize: heading2,fontWeight: FontWeight.w400,),
                  SizedBox(height: commonHeightM1,),
                  CustomTextFormField(controller: password, subTitle: 'Password *'),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(readOnly: true, onTap: () {},controller: passport,subTitle: 'UAE pass *',textInputAction: TextInputAction.done,sufixIcon: AppAssets.uploadIcon,),
                  SizedBox(height: commonHeightS,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(text: "Forgot password?",decoration: TextDecoration.underline,color: AppColor.primary(),fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'ns',),
                    ],
                  ),
                  SizedBox(height: commonHeightM,),
                  CustomElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
                  }, text: 'LOGIN',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,),
                  SizedBox(height: commonHeightS,),
                  CustomElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }, text: 'SIGN UP WITH PASSWORD',bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,textColor: AppColor.primary(),fontFamily: 'nb',),
                  SizedBox(height: commonHeightS,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: "You don’t have an account? ",color: AppColor.primary(),fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'ns',),
                        AppText(text: "Create one",decoration: TextDecoration.underline,color: AppColor.primary(),fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'ns',),
                      ],
                    ),
                  ),
                  SizedBox(height: appBottomMargin,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
