// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../constants/app_widgets_size.dart';
import '../../../../constants/media_query.dart';
import '../../../../core/theme/AppColor.dart';

class BoardingContainer extends StatelessWidget {
   BoardingContainer({super.key,this.widget});
Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: commonTopMargin),
      padding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
      width: mdWidth(context)*1,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1,color: AppColor.borderColor())
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical:20,horizontal: 10),
        decoration: BoxDecoration(
            color: AppColor.white(),
            borderRadius: BorderRadius.circular(40)
        ),
        child: widget??SizedBox(),
      ),
    );
  }
}
