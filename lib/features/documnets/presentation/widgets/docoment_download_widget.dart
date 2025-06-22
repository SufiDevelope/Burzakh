// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter_svg/svg.dart';

class DocumentDownloadWidget extends StatelessWidget {
   DocumentDownloadWidget({super.key,required this.text});
String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: screenPaddingHori-5,vertical: screenPaddingHori),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.lightBlueColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.pdfIcon),
              SizedBox(width: 10,),
              AppText(text: text,color: AppColor.black(),fontSize: heading3,fontFamily: 'nr',),
            ],
          ),
          CustomElevatedButton(onPressed: (){}, width: 109,height: 30,text: "DOWNLOAD",radius: 50,fontSize: text3,textColor: AppColor.black(),showBorder: true,bgColor: AppColor.white(),)
        ],
      ),
    );
  }
}
