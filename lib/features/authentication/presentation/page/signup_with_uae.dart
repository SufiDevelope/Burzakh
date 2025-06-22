import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/media_query.dart';
import '../../../../core/theme/AppColor.dart';
import 'login.dart';

class SignUpWithUae extends StatefulWidget {
  const SignUpWithUae({super.key});

  @override
  State<SignUpWithUae> createState() => _SignUpWithUaeState();
}

class _SignUpWithUaeState extends State<SignUpWithUae> {
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController uaePass=TextEditingController();
  TextEditingController marsoom=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPrimary(),
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
                  SizedBox(height: commonHeightS,),
                  AppText(text: 'Create an account',fontFamily: 'ns',fontWeight: FontWeight.w600,fontSize: heading1,),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(controller: fname, subTitle: 'First Name *'),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(controller: lname, subTitle: 'Last Name *'),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(controller: password, subTitle: 'Password *'),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(controller: phoneNumber, subTitle: 'Phone Number *'),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(controller: email, subTitle: 'Email address*',textInputAction: TextInputAction.done,),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(readOnly: true, onTap: () {},controller: uaePass,subTitle: 'UAE pass *',textInputAction: TextInputAction.done,sufixIcon: AppAssets.uploadIcon,),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(readOnly: true, onTap: () {},controller: marsoom,subTitle: 'Marsoom',textInputAction: TextInputAction.done,sufixIcon: AppAssets.uploadIcon,),
                  SizedBox(height: commonHeightM1,),
                  CustomElevatedButton(onPressed: (){}, text: 'SIGN UP',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,),
                  SizedBox(height: commonHeightS,),
                  CustomElevatedButton(onPressed: (){}, text: 'SIGN UP WITH PASSPORT',bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,textColor: AppColor.primary(),fontFamily: 'nb',),
                  SizedBox(height: commonHeightS,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },child: AppText(text: "Login",decoration: TextDecoration.underline,color: AppColor.primary(),fontSize: 17,fontWeight: FontWeight.w600,fontFamily: 'ns',)),
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
