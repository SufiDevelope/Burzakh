// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

class IsCompletedCaseRow extends StatelessWidget {
   IsCompletedCaseRow({super.key,this.isCompleted=false,required this.caseNumber,});
  bool? isCompleted;
  int caseNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(text: "Case",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),
            AppText(text: " ${caseNumber}",fontSize: heading3,color: AppColor.black(),fontFamily: 'ns',),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(text: "Status:",fontSize: heading3,color:isCompleted==true? AppColor.green():AppColor.yellowLight(),fontFamily: 'ns',),
            SizedBox(width: 3,),
            AppText(text: isCompleted==true?"Completed":"Pending",fontSize: heading3,color: isCompleted==true? AppColor.green():AppColor.yellowLight(),fontFamily: 'nr',),
          ],
        ),
      ],
    );
  }
}
