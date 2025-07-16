import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

class RehmaHeader extends StatelessWidget {
  const RehmaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: mdWidth(context)*1,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.primary(),
            AppColor.buttonColor,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          0.04.ph(context),
          AppText(
            text:
            "Islamic Education",
              fontSize: context.mh * 0.02,
              fontWeight: FontWeight.w600,
              color: Colors.white,fontFamily: 'ns',
          ),

          0.004.ph(context),

          AppText(
            text:
            "Guidance and spiritual support during times of loss",
              fontSize: context.mh * 0.015,
              color: Colors.white.withOpacity(0.8),
          ),
          0.015.ph(context),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border(
                left: BorderSide(
                  color: Color(0xff9a7b4f),
                  width: 4,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text:
                  "\"Indeed we belong to Allah, and indeed to Him we will return.\"",
                    fontSize: context.mh * 0.015,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  fontFamily: 'ni',
                ),
                const SizedBox(height: 4),

                AppText(
                  text:
                  "— Surah Al-Baqarah 2:156",
                    fontSize: context.mh * 0.012,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w300,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
