// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/documnets/presentation/widgets/docoment_download_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

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
                  AppText(text: "Documents",fontSize: 15,fontFamily: 'ns',),
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
                AppText(text: "All your uploaded and approved documents are safely stored here.",color: AppColor.grey(),fontSize: text1,fontFamily: 'nr',),
                AppText(text: "Download or view them anytime as needed.",color: AppColor.grey(),fontSize: text1,fontFamily: 'nr',),
                SizedBox(height: commonTopMargin,),
                DocumentDownloadWidget(text: "Death notification",),
                DocumentDownloadWidget(text: "Hospital certificate",),
                SizedBox(height: commonTopMargin,),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
