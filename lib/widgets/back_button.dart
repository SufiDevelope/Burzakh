import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? icon;
  const BackButtonWidget({this.onTap, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // context.router.maybePop();
          },
      child: Container(
        height: 30,
        width: 60,
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child:Icon(Icons.arrow_back_rounded)
        // SvgPicture.asset(
        //   icon ?? AppAssets.backArrow,
        // ),
      ),
    );
  }
}
