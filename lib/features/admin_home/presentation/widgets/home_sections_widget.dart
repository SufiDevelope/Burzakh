import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/admin_home/presentation/widgets/active_case_screen.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomeSectionsWidget extends StatelessWidget {
   HomeSectionsWidget({super.key,required this.heading,required this.total,this.onTap});
String heading;
String total;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        height: 140,
        padding: EdgeInsets.symmetric(vertical: commonHeightS),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.lightBlueColor(),
          border: Border.all(width: .5,color: AppColor.greyLight1()),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.tickIcon,height: 16,width: 16,),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: "$heading",fontSize: text1,textAlign: TextAlign.center,fontFamily: 'ns',color: AppColor.black(),),
              ],
            ),
            SizedBox(height: 8,),
            AppText(text: "$total",fontSize: text1,fontFamily: 'nr',color: AppColor.black(),),
          ],
        ),
      ),
    );
  }
}
