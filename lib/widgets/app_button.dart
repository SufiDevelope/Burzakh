// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';


class AppButton extends StatelessWidget {
  AppButton(
      {required this.onPressed,
      required this.text,
      this.textColor,
      this.bgColor,
        this.icon,
        this.widget,
      this.borderColor,
      this.radius,
      this.textStyle,
      this.height,
      this.width,
      super.key});
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final Color? borderColor;
  String? icon;
  double? radius;
  TextStyle? textStyle;
  double? height;
  double? width;
  double? borderRadius;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width??mdWidth(context)*1,
      height:height ??50,
      decoration: BoxDecoration(
        color: bgColor??AppColor.primary(),
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
          border: Border.all(width: 1, color: borderColor ??AppColor.primary())),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget??SizedBox(),
          AppText(
            text: text,
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
