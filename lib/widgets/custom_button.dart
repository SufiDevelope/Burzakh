import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_widgets_size.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? bgColor;
  String? icon;
  double? radius;
  double? height;
  double? iconHeight;
  double? width;
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  final String? fontFamily;
  bool? showBorder;
  Color? borderColor;
  double? borderWidth;
  double? loaderSize;
  bool? isLoading;
  Color? iconColor;
  IconData? iconData;

  CustomElevatedButton(
      {required this.onPressed,
      required this.text,
      this.textColor,
      this.showBorder,
      this.iconHeight,
      this.isLoading,
      this.borderColor,
      this.iconColor,
      this.borderWidth,
      this.fontFamily,
      this.fontWeight,
      this.loaderSize,
      this.fontSize,
      this.bgColor,
      this.iconData,
      this.icon,
      this.radius,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? buttonSize,
      width: width ?? mdWidth(context),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColor.buttonColor,
          shape: RoundedRectangleBorder(
            side: showBorder == true
                ? BorderSide(
                    width: borderWidth ?? 1, color: borderColor ?? Colors.black)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(radius ?? buttonRadius),
          ),
        ),
        onPressed: onPressed,
        icon: icon != null
            ? SvgPicture.asset(
                icon ?? '',
                color: iconColor ?? textColor,
              )
            : SizedBox(),
        label: isLoading == true
            ? SizedBox(
                height: loaderSize,
                width: loaderSize,
                child: CircularProgressIndicator(
                  color: AppColor.white(),
                ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconData != null
                      ? Icon(
                          iconData,
                          color: iconColor ?? textColor,
                          size: iconHeight,
                        )
                      : SizedBox(),
                  SizedBox(
                    width: iconData != null ? 5 : 0,
                  ),
                  AppText(
                    text: text,
                    fontWeight: fontWeight,
                    fontSize: fontSize ?? buttonText,
                    fontFamily: fontFamily ?? 'ns',
                    color: textColor ?? AppColor.white(),
                  ),
                ],
              ),
      ),
    );
  }
}
