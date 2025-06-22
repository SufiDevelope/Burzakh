// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants/app_widgets_size.dart';
import '../../../../constants/media_query.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_top_bar.dart';
import '../controller/cubit.dart';


class VerifyOtpForResetpassword extends StatefulWidget {
   VerifyOtpForResetpassword({super.key});

  @override
  State<VerifyOtpForResetpassword> createState() => _VerifyOtpForResetpasswordState();
}

class _VerifyOtpForResetpasswordState extends State<VerifyOtpForResetpassword> with SingleTickerProviderStateMixin {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:BlocBuilder(
        bloc: _authCubit,
        builder: (context,state) {
          return Container(
            decoration: BoxDecoration(
                gradient: AppColor.bgGradient
            ),
            child: SlideTransition(
              position: _animation,
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      CustomTopBar(text: "OTP"),
                      Padding(padding: const EdgeInsets.all(10),
                        child: Image.asset(AppAssets.appLogo, width: 170.0,height: 170,),),
                      SizedBox(height: 20,),
                      AppText(text: "Enter the Code",fontFamily: 'nb',fontSize: heading3,),
                      SizedBox(height: 20,),
                      Container(
                        margin:EdgeInsets.symmetric(horizontal: 16),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: AppText(textAlign: TextAlign.center,text: "${'We sent you a verification code'.tr()} ${'to your email'.tr()} ${_authCubit.forgotEmail}")),

                          ],
                        ),
                      ),


                      Padding(padding:  EdgeInsets.symmetric(horizontal:mdWidth(context)<650? 25:mdWidth(context)<700? 40:mdWidth(context)*.25, vertical: 15),
                        child: PinCodeTextField(
                          length: 4,
                          appContext: context,
                          obscureText: false,readOnly: _authCubit.isVerifyOtp,
                          showCursor: true,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 56,
                            fieldWidth: 65,
                            borderWidth: 1,
                            borderRadius: BorderRadius.circular(8),
                            selectedColor: AppColor.black(),
                            selectedFillColor: Colors.white,
                            inactiveFillColor: AppColor.white(),
                            inactiveColor: AppColor.grey(),
                            activeColor: AppColor.primary(),
                            activeFillColor: AppColor.white(),
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          onChanged:  (String value){
                           _authCubit.getOtp(value);
                          },
                          onCompleted: (value)async{
                           await _authCubit.verifyOtp();
                            // authProvider.verifyForgotPasswordEmail(widget.userInput.toString(),code,context);
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                      ),

                    _authCubit.isVerifyOtp? CircularProgressIndicator(color: AppColor.primary(),):SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}


var _authCubit=DiContainer().sl<AuthenticationCubit>();