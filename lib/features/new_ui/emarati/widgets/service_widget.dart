// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

class ServiceWidget extends StatelessWidget {
  ServiceWidget({
    super.key,
    required this.iconData,
    required this.text1,
    this.onTap,
    required this.text2,
    required this.text3,
  });
  String text1;
  String text2;
  String text3;
  VoidCallback? onTap;
  String iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: context.mw * 0.12,
                    height: context.mw * 0.12,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image(
                        image: AssetImage(
                          iconData,
                        ),
                        fit: BoxFit.contain)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: text1,
                        fontSize: context.mh * 0.015,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'ns',
                        // color: AppColors.textPrimary,
                      ),
                      const SizedBox(height: 4),
                      AppText(
                        text: text2,
                        fontSize: context.mh * 0.012,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        text: text3,
                        fontSize: context.mh * 0.014,
                        color: Color(0xFF666666),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              color: AppColor.whiteLight1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onTap ?? () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: AppText(
                    text: "Request Service",
                    fontSize: context.mh * 0.015,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'nm',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
