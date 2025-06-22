import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_widgets_size.dart';
import '../../../../core/app/di_container.dart';
import '../../../../widgets/custom_top_bar.dart';
import '../controller/cubit.dart';
import '../widgets/password_info_dialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  TextEditingController? _passwordController;
  TextEditingController? _confirmPasswordController;
  GlobalKey<FormState>? _formKeyReset;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1), // Start from bottom
      end: Offset.zero,    // End at normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start animation on first build
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controller
    super.dispose();
  }

  int checkPasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) strength++;
    return strength;
  }

  String getPasswordStrengthText(String value) {
    switch (checkPasswordStrength(value)) {
      case 0:
        return 'Password is very Weak';
      case 1:
        return 'Password is Weak';
      case 2:
        return 'Password is Fair';
      case 3:
        return 'Password is Good';
      case 4:
        return '';
      default:
        return '';
    }
  }


  void resetPassword() async {
    String password = _passwordController!.text.trim();
    String confirmPassword = _confirmPasswordController!.text.trim();

    if (password.isEmpty) {
      showMessage("Please enter new password",isError: true);
    } else if (confirmPassword.isEmpty) {
      showMessage("Please enter confirm password",isError: true);
    }else if (password != confirmPassword) {
      showMessage("Password does not matched",isError: true);
    } else {
      if(checkPasswordStrength(password)<4){
        showMessage("Your password is not Strong",isError: true);
      }else{
        _authCubit.resetPassword(password: password, confirmPassword: confirmPassword);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            gradient: AppColor.bgGradient
        ),
        child: SlideTransition(
          position: _animation,
          child: SafeArea(
            child: Form(key: _formKeyReset,
              child: ListView(padding:  EdgeInsets.symmetric(horizontal: screenPaddingHori), children: [
                SizedBox(height: 10,),
                CustomTopBar(text: "Reset Password"),
                Padding(padding: const EdgeInsets.all(10),
                  child: Image.asset(AppAssets.appLogo, width: 170.0,height: 170,),),

                SizedBox(height: commonHeightM,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     AppText(text: "Reset Password",fontSize: 16,fontFamily: 'nb',),
                //   ],
                // ),


                SizedBox(height: 16,),
                CustomTextFormField(
                  borderColor: AppColor.fieldYellowBorder(),
                  controller: _passwordController!, subTitle: "new password",onSuffixTap: () {
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => PasswordInfoDialog(),);
                },sufixIcon: AppAssets.infoIcon,),
                SizedBox(height: 16,),
                CustomTextFormField(
                  borderColor: AppColor.fieldYellowBorder(),
                  controller: _confirmPasswordController!, subTitle: "confirm password",onSuffixTap: () {
                  showDialog(context: context,barrierColor: AppColor.blurWhiteColor(),builder: (context) => PasswordInfoDialog(),);
                },sufixIcon: AppAssets.infoIcon,),
                SizedBox(height: 16,),

               BlocBuilder(
                 bloc: _authCubit,
                 builder: (context,state) {
                   return CustomElevatedButton(onPressed: resetPassword,isLoading: _authCubit.isResetPassword, text: "Save",textColor: AppColor.white(),);
                 }
               ),
                 SizedBox(height: commonTopMargin),

              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
var _authCubit=DiContainer().sl<AuthenticationCubit>();
