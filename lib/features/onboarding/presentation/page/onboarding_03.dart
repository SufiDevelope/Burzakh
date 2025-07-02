// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/page/login.dart';
import 'package:burzakh/features/authentication/presentation/page/sign_up.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/boarding_button_text.dart';
import 'package:burzakh/features/onboarding/presentation/widgets/container.dart';
import 'package:burzakh/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/media_query.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_button.dart';

class Onboarding03 extends StatefulWidget {
   Onboarding03({super.key,this.showButtons=true});
bool? showButtons;
  @override
  State<Onboarding03> createState() => _Onboarding03State();
}

class _Onboarding03State extends State<Onboarding03> {
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      var localizationController = Get.find<LocalizationGetx>();
      localizationController.selectLocal(context);

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var langController=Get.find<LocalizationGetx>();
    return Scaffold(
      backgroundColor: AppColor.bgPrimary(),
      body: Container(
        height: mdHeight(context)*1,
        width: mdWidth(context)*1,

        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori),
            child: SingleChildScrollView(
              child: GetBuilder<LocalizationGetx>(
                builder: (langController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: commonHeightM,),
                      Image.asset(AppAssets.appLogo,width: logoWidthBoarding,height:logoWidthBoarding,),
                      SizedBox(height: commonHeightM,),
                      AppText(text: 'Languages, provided for your ease',fontSize: 28,fontFamily: 'nm',textAlign: TextAlign.center,fontWeight: FontWeight.w500,),
                      SizedBox(height: commonHeightM,),
                      AppText(text: 'To make your journey easier and more comforting, Barzakh offers support in many languages.',textAlign: TextAlign.center,fontSize:16 ,fontFamily: 'nr',),
                      BoardingContainer(widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomListTile(text: "English",verticalPadding: 18,suffixIcon:langController.lang.value!=Locale('en')? null:AppAssets.tickInCircleIcon,onTap: () {
                            langController.updateUi(Locale('en'), context);
                          },),
                          SizedBox(height: 8,),
                          CustomListTile(text: "Chinese",verticalPadding: 18,suffixIcon:langController.lang.value!=Locale('zh')? null:AppAssets.tickInCircleIcon,onTap: () {
                            langController.updateUi(Locale('zh'), context);
                          },),
                          SizedBox(height: 8,),
                          CustomListTile(text: "Russian",verticalPadding: 18,suffixIcon:langController.lang.value!=Locale('ru')? null:AppAssets.tickInCircleIcon,onTap: () {
                            langController.updateUi(Locale('ru'), context);
                          },),
                          SizedBox(height: 8,),
                          CustomListTile(text: "Malayalam",verticalPadding: 18,suffixIcon:langController.lang.value!=Locale('ml')? null:AppAssets.tickInCircleIcon,onTap: () {
                            langController.updateUi(Locale('ml'), context);
                          },),
                          SizedBox(height: 8,),
                          CustomListTile(text: "العربية",subtext: 'Arabic',suffixIcon:langController.lang.value!=Locale('ar')? null:AppAssets.tickInCircleIcon,onTap: () {
                            langController.updateUi(Locale('ar'), context);
                          },),
                          SizedBox(height: 8,),
                          CustomListTile(text: "اُردُو",subtext: 'Urdu',suffixIcon:langController.lang.value!=Locale('ur')? null:AppAssets.tickInCircleIcon,onTap: () {
                            langController.updateUi(Locale('ur'), context);
                          },),
                         ],
                      ),),

                      SizedBox(height: commonHeightM,),
                    widget.showButtons==true?  BoardingButtonText(buttonText: 'LOGIN', isShowHeadingText: false,isLastPage: true,heading: '', subHeading: '', onTapBack: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                    }, onTapNext: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                      }):SizedBox(),
                      widget.showButtons==false? CustomElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, text: "DONE"):SizedBox(),
                      SizedBox(height: commonTopMargin,),

                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
