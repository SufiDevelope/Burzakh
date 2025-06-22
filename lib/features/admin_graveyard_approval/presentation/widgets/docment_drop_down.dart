// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocumentDropDown extends StatelessWidget {
  final void  Function(String)? onSelected;
  DocumentDropDown({super.key,this.onSelected});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      offset: Offset(-10, 30),
      borderRadius: BorderRadius.circular(10),
      splashRadius: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColor.greyLight(), width: 1),
      ),
      constraints: BoxConstraints(maxWidth: mdWidth(context)*1,minWidth: mdWidth(context)*.4),

      menuPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      itemBuilder: (context) => [
        PopupMenuItem(value: 'Download',child:AppText(text: "Download")),
        PopupMenuItem(value: 'Resubmit',child:AppText(text: "Resubmit")),
      ],
      onSelected:onSelected,
      child: Container(
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(width: 1,color: AppColor.grey())),
          padding: EdgeInsets.only(top: 4,bottom: 4,right: 5,left: 10),
          child: SvgPicture.asset(AppAssets.verticalThreeDotsIcon,height: 15,width: 3,)),
    );
  }
}
