// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_text_style.dart';

class CustomDropDown extends StatelessWidget {
   CustomDropDown({super.key,this.hintSize,required this.text,required this.menus,this.onSelected});
String text;
double? hintSize;
List<String> menus;
   void Function(int)? onSelected;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      offset: Offset(0, 50),
      borderRadius: BorderRadius.circular(10),
      splashRadius: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColor.greyLight(), width: 1),
        ),
      constraints: BoxConstraints(maxWidth: mdWidth(context)*1,minWidth: mdWidth(context)*.9),

      menuPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      itemBuilder: (context) => [
        ...List.generate(menus.length, (index) => PopupMenuItem(value: index,child:AppText(text: "${menus[index]}")),)
      ],
      onSelected:onSelected,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 1,color: AppColor.grey())),
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("$text".tr(),style: AppTextStyle.hintTextStyle(fontSize: hintSize),)),
              SvgPicture.asset(AppAssets.downBracketIcon,height: 10,width: 10,)
            ],
          )),
    );
  }
}
