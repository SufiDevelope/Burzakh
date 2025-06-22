// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

class RequestSvcWidget extends StatelessWidget {
   RequestSvcWidget({super.key,required this.text,required this.image,this.onTap});
String text;
String image;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap:onTap ,
      child: Column(
        children: [
          AppText(text: text,fontSize: heading3,fontFamily: 'nm',),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 85,
            width: mdWidth(context)*1,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColor.black()),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(image))
            ),
          )
        ],
      ),
    );
  }
}
