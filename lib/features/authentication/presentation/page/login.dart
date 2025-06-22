import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/features/admin_dashboard/presentation/page/admin_dashboard.dart';
import 'package:burzakh/features/authentication/presentation/page/login_with_uae.dart';
import 'package:burzakh/features/authentication/presentation/page/sign_up.dart';
import 'package:burzakh/features/authentication/presentation/page/signup_with_uae.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/media_query.dart';
import '../../../../core/app/di_container.dart';
import '../../../../core/extensions/show_message.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../dashboard/presentation/page/dashboard.dart';
import '../controller/cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController passport=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController email=TextEditingController();
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
                  AppText(text: 'Continue the process for funeral permit.',textAlign: TextAlign.center,fontWeight: FontWeight.w400,fontFamily: 'nr',fontSize: heading2,),
                  SizedBox(height: commonHeightM1,),
                  CustomTextFormField(controller: passport, subTitle: 'Email *'),
                  SizedBox(height: commonHeightS,),
                  CustomTextFormField(controller: password, subTitle: 'Password *'),
                  // CustomTextFormField(readOnly: true, onTap: () {},controller: passport,subTitle: 'Passport copy *',textInputAction: TextInputAction.done,sufixIcon: AppAssets.uploadIcon,),
                  SizedBox(height: commonHeightS,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard(),));
                        },
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: AppText(text: "Forgot password?",decoration: TextDecoration.underline,color: AppColor.primary(),fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'ns',)),
                    ],
                  ),
                  SizedBox(height: commonHeightM,),
                  BlocBuilder(
                    bloc: authCubit,
                    builder: (_,state) {
                      return CustomElevatedButton(onPressed: () async {
                        if(password.text.isEmpty || passport.text.isEmpty){
                          showMessage("Please Enter required fields",isError: true);
                        }else{
                        await  authCubit.login(email: passport.text, password: password.text, context: context);
                        }
                      },isLoading: authCubit.isLoginLoading, text: 'LOGIN',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,);
                    }
                  ),
                  // SizedBox(height: commonHeightS,),
                  // CustomElevatedButton(onPressed: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenWithUae(),));
                  // }, text: 'SIGN UP WITH UAE PASS',bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,textColor: AppColor.primary(),fontFamily: 'nb',),
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

var authCubit=DiContainer().sl<AuthenticationCubit>();
