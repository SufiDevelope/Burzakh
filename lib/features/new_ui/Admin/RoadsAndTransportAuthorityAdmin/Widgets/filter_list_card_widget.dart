import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FilterListCardWidget extends StatelessWidget {
  final String name;
  final String caseId;
  final String location;
  final String signCount;
  final int messageCount;
  final VoidCallback? onTap;
  final VoidCallback? onMessageTap;
  final Color? primaryColor;
  final Color? backgroundColor;
  final String rta;

  const FilterListCardWidget({
    super.key,
    required this.name,
    required this.caseId,
    required this.location,
    required this.signCount,
    this.messageCount = 0,
    this.onTap,
    this.onMessageTap,
    this.primaryColor,
    this.backgroundColor, required this.rta,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = primaryColor ?? const Color(0xFF8B4A5C);
    final Color bgColor = backgroundColor ?? Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(context.mw * 0.04),
        margin: EdgeInsets.only(
            bottom: context.mh * 0.015,
            left: context.mw * 0.02,
            right: context.mw * 0.02),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with name and case ID
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Case ID:".tr(),
                      style: TextStyle(
                        color: mainColor,
                        fontSize: context.mh * 0.014,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      caseId,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: context.mh * 0.014,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            0.015.ph(context),

            // Location
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[600],
                  size: context.mh * 0.018,
                ),
                0.01.pw(context),
                Expanded(
                  child: Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: context.mh * 0.014,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            0.015.ph(context),

            // Sign Count
            Visibility(
              visible: rta == 'cda' ? false : true,
              child: Row(
                children: [
                  Icon(
                    Icons.edit_document,
                    color: Colors.grey[600],
                    size: context.mh * 0.018,
                  ),
                  0.01.pw(context),
                  Row(
                    children: [
                      Text(
                        'Sign Count: '.tr(),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '$signCount',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            0.02.ph(context),
            // Messages Section
             GestureDetector(
                onTap: onMessageTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.025,
                    vertical: context.mh * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: primaryColor!.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.message,
                        color: primaryColor,
                        size: context.mh * 0.016,
                      ),
                      0.015.pw(context),
                      Text(
                        'Messages'.tr(),
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: context.mh * 0.014,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      0.01.pw(context),
                      Icon(
                        Icons.chevron_right,
                        color: primaryColor,
                        size: context.mh * 0.018,
                      ),
                    ],
                  ),
                ),
              ), 
          ],
        ),
      ),
    );
  }
}
