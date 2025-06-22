// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HadeesSection extends StatelessWidget {
   HadeesSection({super.key,this.text1,this.text3,this.text2});
String? text1;
String? text2;
String? text3;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.darkYellow().withOpacity(.15),
        // color: AppColor.bgPrimary(),
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: AppColor.darkYellow(),width: 2))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: text1??"",fontFamily: 'nm', fontSize: context.mh * 0.015,),
          AppText(text: text2??"",fontFamily: 'n',fontWeight: FontWeight.w300,fontStyle: FontStyle.italic, fontSize: context.mh * 0.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(text: text3??"",fontFamily: 'n',fontWeight: FontWeight.w300,color: AppColor.grey(),fontStyle: FontStyle.italic, fontSize: context.mh * 0.014,),
            ],
          ),

        ],
      ),
    );
  }
}
