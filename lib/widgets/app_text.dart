// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class AppText extends StatelessWidget {
   AppText(
      {super.key,
        required this.text,
         this.letterSpacing,
      this.color,
        this.fontSize,
        this.decoration,
      this.fontFamily,
      this.fontStyle,
      this.fontWeight, this.overflow, this.textAlign, this.height, this.maxLines});
  final String text;
 final double? height;
  final Color? color;
  final  TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
   double? letterSpacing;
   FontStyle? fontStyle;
   int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text".tr(),overflow: overflow,
      textAlign:textAlign ,
      maxLines: maxLines,
      style: TextStyle(fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        decorationColor:AppColor.primary(),
          decoration: decoration,
          color: color ?? AppColor.black(),
          height:height ,
          fontSize: fontSize ?? 14,
          fontFamily: fontFamily ?? "nr",
          fontWeight: fontWeight ?? FontWeight.w400
      ),
    );
  }
}