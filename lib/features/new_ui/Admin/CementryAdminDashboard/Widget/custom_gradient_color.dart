import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final Color? primaryColor;
  final IconData? icon;
  final VoidCallback? onTap;
  const CustomGradientButton(
      {super.key,
      required this.text,
      this.primaryColor,
      this.icon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.mh * 0.04,
        width: context.mw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              primaryColor?.withOpacity(0.43) ?? Colors.blue,
              primaryColor ?? Colors.blue,
            ],
          ),
        ),
        child: Row(
          children: [
            icon != null ? 0.02.pw(context) : 0.pw(context),
            Icon(icon, color: Colors.white),
            0.02.pw(context),
            Text(
              StringTranslateExtension(text).tr(),
              style: TextStyle(
                color:  primaryColor == Colors.white70 ? Colors.black : Colors.white,
                fontSize: context.mh * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
