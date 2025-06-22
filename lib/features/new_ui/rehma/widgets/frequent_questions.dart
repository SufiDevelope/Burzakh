import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';

class FrequentQuestions extends StatelessWidget {
   FrequentQuestions({super.key,required this.text1,this.onTap,required this.text2,required this.show});
String text1;
String text2;
bool show;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: AppText(text: text1,color:  AppColor.darkGreen,fontFamily:'ns',)),
                Icon(Icons.arrow_drop_down_outlined,color: AppColor.darkGreen,),
              ],
            ),
          ),
          show?  Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 1,color: AppColor.yellowDark))
              ),
              child: AppText(text: text2,color:  AppColor.black(),fontFamily:'n',fontWeight:FontWeight.w300)):SizedBox(),
        ],
      ),
    );
  }
}
