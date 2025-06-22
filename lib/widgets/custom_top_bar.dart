// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTopBar extends StatelessWidget {
   CustomTopBar({super.key,required this.text,this.isSmallWorld,this.text1});
String text;
String? text1;
bool? isSmallWorld;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1,color: AppColor.grey()),
            ),
            child: SvgPicture.asset(AppAssets.backBracketIcon),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(text: text,color: AppColor.black(),fontSize: heading3,fontFamily: 'ns',),
            AppText(text:text1!=null?"$text1":"",color: AppColor.black(),fontSize: heading3,fontFamily: 'ns',),
          ],
        ),
        SizedBox(width: 20,),
      ],
    );
  }
}
