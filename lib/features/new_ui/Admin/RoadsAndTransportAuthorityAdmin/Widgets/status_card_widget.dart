import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GenericStatusCardWidget extends StatelessWidget {
  final String title;
  final String count;
  final String statusText;
  final String lastUpdated;
  final IconData icon;
  final Color? primaryColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final List<Color>? progressColors;
  final double progressValue;
  final double? size;
  final double? containerheight;
  final double? containerwidth;
  final double? borderRadius;
  final bool? isDubaiAdmin;

  const GenericStatusCardWidget({
    super.key,
    required this.title,
    required this.count,
    required this.statusText,
    required this.lastUpdated,
    required this.icon,
    this.primaryColor,
    this.backgroundColor,
    this.onTap,
    this.progressColors,
    this.progressValue = 0.6,
    this.size,
    this.containerheight,
    this.containerwidth,
    this.borderRadius,
    this.isDubaiAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = primaryColor ?? const Color(0xFF8B4A5C);
    final Color bgColor = backgroundColor ?? Colors.grey[50]!;
    // final List<Color> progColors = progressColors ??
    //     [
    //       Colors.grey[200]!,
    //       Colors.grey[300]!,
    //       Colors.grey[400]!,
    //       Colors.grey[500]!,
    //       Colors.grey[600]!,
    //       Colors.grey[700]!,
    //       mainColor,
    //     ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.mw * 0.7,
        padding: EdgeInsets.symmetric(
            horizontal: isDubaiAdmin == true ? 0.00 : context.mw * 0.03,
            vertical: isDubaiAdmin == true ? 0.00 : context.mh * 0.02),
        margin: EdgeInsets.only(left: context.mw * 0.03),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDubaiAdmin == true)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: context.mh * 0.008,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: dashboardcolor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(""),
                    ),
                  )
                ],
              ),
            Padding(
              padding: isDubaiAdmin == true
                  ?  EdgeInsets.all(8.0) : EdgeInsets.zero,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: containerwidth ?? context.mw * 0.08,
                        height: containerheight ?? context.mw * 0.08,
                        decoration: BoxDecoration(
                          color: mainColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(borderRadius ?? 8),
                        ),
                        child: Icon(
                          icon,
                          color: mainColor,
                          size: size ?? context.mh * 0.02,
                        ),
                      ),
                      0.03.pw(context),
                      Expanded(
                        child: Text(
                          title.tr(),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Count and status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        count,
                        style: TextStyle(
                          color: mainColor,
                          fontSize: context.mh * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      0.02.pw(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              statusText.tr(),
                              style: TextStyle(
                                color: mainColor,
                                fontSize: context.mh * 0.014,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            0.01.ph(context),
                            // // Progress indicators
                            // Row(
                            //   children: List.generate(
                            //     progColors.length,
                            //     (index) => Container(
                            //       width: context.mw * 0.025,
                            //       height: context.mh * 0.008,
                            //       margin: EdgeInsets.only(
                            //         right: context.mw * 0.01,
                            //       ),
                            //       decoration: BoxDecoration(
                            //         color: index < (progColors.length * progressValue)
                            //             ? progColors[index]
                            //             : Colors.grey[200],
                            //         borderRadius: BorderRadius.circular(2),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
              
                  0.025.ph(context),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 0.5,
                  ),
              
                  // Footer with last updated and view button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lastUpdated,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: context.mh * 0.012,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            0.02.ph(context),
          ],
        ),
      ),
    );
  }
}
