
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/page/forgot_otp_screen.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/AppColor.dart';



class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

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
  TextEditingController _userInputController= TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _key = GlobalKey();
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Container(
        decoration: BoxDecoration(
            gradient: AppColor.bgGradient
        ),
        child: SlideTransition(
          position: _animation,
          child: SafeArea(
            child: Form(
              key: forgetFormKey,
              child: ListView(padding: EdgeInsets.symmetric(horizontal:16), children: [
                SizedBox(height: 10,),
                CustomTopBar(text: "Recover Password"),
                Center(child: Padding(padding: const EdgeInsets.only(right:50,bottom: 50,left:50),
                    child: Image.asset(AppAssets.appLogo, height: 150, width: 150))),
                AppText(text: "Recover Password",),
                Row(children: [
                  Expanded(flex: 1, child: Divider(thickness: 1,
                      color: Theme.of(context).primaryColor)),
                  Expanded(flex: 2, child: Divider(thickness: 0.2,
                      color: Theme.of(context).primaryColor))]),
                AppText(text: "Enter your email address you are using for your account bellow and we will send you a password reset link"),
                const SizedBox(height: 40),
                CustomTextFormField(
                  subTitle: "email",
                  borderColor: AppColor.fieldYellowBorder(),
                  controller: _userInputController!,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 100),
                BlocBuilder(
                  bloc: _authCubit,
                  builder: (context,state) {
                    return CustomElevatedButton(
                      textColor:AppColor.white(),
                      isLoading: _authCubit.isSendOtp,
                      text: 'SEND',
                      bgColor: AppColor.buttonColor,
                      onPressed:_authCubit.isSendOtp? (){}:() async {
                        if (forgetFormKey.currentState?.validate() ?? false) {
                          String userInput = _userInputController?.text.toString() ?? "";

                          // Check if the input field is empty
                          if (userInput.isEmpty) {
                            showMessage("Enter email",isError: true);
                            return;
                          }

                          // Check for valid email format
                          bool isValidEmail = RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(userInput);

                          if (!isValidEmail) {
                            showMessage("Invalid email format");
                            return;
                          }

                          _authCubit.sendOtp(email: _userInputController?.text??"");
                          // Proceed with the forget password logic
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtpForResetpassword(email: _userInputController?.text??""),));

                        }
                      },
                    );
                  }
                )

              ]),
            ),
          ),
        ),
      ),
    );
  }
}


final _authCubit=DiContainer().sl<AuthenticationCubit>();
