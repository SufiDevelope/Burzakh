// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../widgets/app_text.dart';

class SupportYouWidgets extends StatelessWidget {
   SupportYouWidgets({super.key,required this.text,required this.icon});
String text;
String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      decoration: BoxDecoration(
        color: AppColor.whiteLight(),
        border: Border.all(width: 1,color: AppColor.greyLight1()),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(icon,height: 40,),
          ),
          SizedBox(height: 10,),
          AppText(text: text,fontSize: 16,fontFamily: 'ns',color: AppColor.primary(),textAlign: TextAlign.center,fontWeight: FontWeight.w500,),
        ],
      ),
    );
  }
}
