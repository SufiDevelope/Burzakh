// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_widgets_size.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class TrackStepsWidget extends StatelessWidget {
   TrackStepsWidget({super.key,required this.heading,required this.subheading,this.isCompleted,this.isLast});
String heading;
String subheading;
bool? isCompleted;
bool? isLast;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: commonHeightL,
              width: commonHeightL,
              decoration: BoxDecoration(
                border: Border.all(color:isCompleted==false?AppColor.grey(): AppColor.primary(),width: isCompleted==false?5:0),
                  shape: BoxShape.circle,
                  color:isCompleted==false?AppColor.white(): AppColor.primary()
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppAssets.tick,height: 11,width: 16,color: isCompleted==false?AppColor.black():AppColor.white(),),
                ],
              ),
            ),
            isLast==true? SizedBox():Container(margin: EdgeInsets.only(top: 4,bottom: 4),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.primary(),
            ),width: 3,height: 48,)
          ],
        ),
        SizedBox(width: commonHeightM,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: mdWidth(context)*.7,
                    child: AppText(text: "$heading",color: AppColor.black(),fontFamily: 'ns',fontSize: heading3,)),
              ],
            ),
            AppText(text: "$subheading",color: AppColor.grey(),fontFamily: 'nr',fontSize: text2,),
          ],
        )
      ],
    );
  }
}
