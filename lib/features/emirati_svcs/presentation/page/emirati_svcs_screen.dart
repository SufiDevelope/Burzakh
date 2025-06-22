// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/documnets/presentation/widgets/docoment_download_widget.dart';
import 'package:burzakh/features/emirati_svcs/presentation/widgets/request_svc_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/di_container.dart';
import '../../../authentication/presentation/controller/cubit.dart';
import '../../../home/presentation/widgets/select_resting_sheet.dart';
import '../widgets/sign_age_sheet.dart';
import '../widgets/tent_request_sheet.dart';

class EmiratiSvcsScreen extends StatelessWidget {
  const EmiratiSvcsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPrimary(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: "Support for Emirati Families",fontSize: 15,fontFamily: 'ns',),
                    InkWell(
                      onTap: () async{
                        var authCubit=DiContainer().sl<AuthenticationCubit>();
                        await authCubit.makeUserNull();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1,color: AppColor.grey())
                          ),
                          child:Image.asset(AppAssets.logoutIconPng,color: AppColor.grey(),height: 15,width: 15,)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: commonHeightS,),
                AppText(text: "As part of the UAE's commitment to its citizens, Emirati families are offered additional support during times of loss. Through Barzakh, you can request government-provided services such as mourning tent setups and road signage to guide visitors. These services are facilitated in collaboration with the Community Development Authority (CDA) and the Roads and Transport Authority (RTA), ensuring a dignified and organized mourning process.",color: AppColor.grey(),fontSize: text1,fontFamily: 'nr',),
                SizedBox(height: commonTopMargin,),
                RequestSvcWidget(onTap: () {
                  showModalBottomSheet(context: context, backgroundColor: Colors.transparent,barrierColor: AppColor.blurWhiteColor(),builder: (context) => TentRequestSheet(),);

                },text: "Request mourning tent setup", image: AppAssets.requestMourningTentSetup),
                SizedBox(height: commonTopMargin,),
                RequestSvcWidget(onTap: () {
                  showModalBottomSheet(context: context,isScrollControlled: true,constraints: BoxConstraints(maxHeight: mdHeight(context)*1), backgroundColor: Colors.transparent,barrierColor: AppColor.blurWhiteColor(),builder: (context) => SignAgeSheet(),);
                },text: "Request for road signage", image: AppAssets.requestForRoadSignage),
                SizedBox(height: commonTopMargin,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
