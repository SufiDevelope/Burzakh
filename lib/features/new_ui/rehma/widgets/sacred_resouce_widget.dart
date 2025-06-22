import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

Widget buildResourceCard({
  required IconData icon,
  required String title,
  required String subtitle,
  required Color bgColor,
  required Color iconColor,
  required String buttonLabel,
  required Color buttonColor,
  required Color buttonBgColor,
   VoidCallback? onTap,
  required BuildContext context,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
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
            children: [
              Container(
                width: context.mw * 0.12,
                height: context.mw * 0.12,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: context.mh * 0.024,
                  color: iconColor,
                ),
              ),
              0.02.pw(context),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text:
                      title,
                        fontSize:  context.mh * 0.016,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      fontFamily: 'ns',
                    ),
                    0.004.ph(context),
                    AppText(
                      text:
                      subtitle,
                        fontSize: context.mh * 0.014,
                        color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[100]!,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed:onTap?? () {},
                style: TextButton.styleFrom(
                  foregroundColor:buttonColor,
                  backgroundColor: buttonBgColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: AppText(text:
                  buttonLabel,
                    fontSize: context.mh * 0.016,
                    fontWeight: FontWeight.w500,
                    color: buttonColor,
                  fontFamily: 'ns',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}