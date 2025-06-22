import 'package:burzakh/core/theme/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_text.dart';

Widget buildSupportCard({
  required IconData icon,
  required String title,
  required String subtitle,
  required bool isAvailable,
  required String responseTime,
  required Color iconBgColor,
  required Color iconColor,
   VoidCallback? onTap,
   String availableText="",
  bool isLast = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: isLast ? 32 : 16),
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
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap:onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text:
                      title,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F2937),
                      fontFamily: 'ns',
                    ),
                    const SizedBox(height: 4),
                    AppText(text:
                      subtitle,
                        fontSize: 12,
                        color: Colors.grey[500],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isAvailable ? AppColor.green1 : Colors.amber[500],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: AppText(text:
                            isAvailable ? "${"Available".tr()} ${availableText!=""?availableText:"now".tr()}" : "Limited availability".tr(),
                              fontSize: 12,
                              color: isAvailable ? AppColor.green1 : Colors.amber[500],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppText(text:
                            "${"Response time".tr()} ${responseTime.tr()}",
                              fontSize: 12,
                              color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 16,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}