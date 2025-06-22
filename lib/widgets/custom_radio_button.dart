// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../constants/app_widgets_size.dart';
import '../core/theme/AppColor.dart';
import 'app_text.dart';

class CustomRadioButton extends StatelessWidget {
   CustomRadioButton({super.key,required this.isSelected,required this.text,required this.onTap});
String text;
bool isSelected;
VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1,color: isSelected==true? AppColor.primary():AppColor.grey())
            ),
            child:  Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:isSelected==true? AppColor.primary():Colors.transparent
              ),
            ),
          ),
          SizedBox(width: commonHeightS,),
          AppText(text: text,fontSize: heading2,fontWeight: FontWeight.w600,color: AppColor.black(),fontFamily: 'ns',),
        ],
      ),
    );
  }
}
