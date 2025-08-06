import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StatusCardWidget extends StatelessWidget {
  final IconData icon;
  final int count;
  final String title;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const StatusCardWidget({
    super.key,
    required this.icon,
    required this.count,
    required this.title,
    this.iconBackgroundColor,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.mw * 0.65,
        height: context.mh * 0.21,
        padding: EdgeInsets.all(context.mw * 0.045),
        margin: EdgeInsets.symmetric(
            horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
        decoration: BoxDecoration(
          // Modern gradient background
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey[50]!,
            ],
          ),
          borderRadius: BorderRadius.circular(10), // More rounded corners
          border: Border.all(
            color: Colors.grey[100]!,
            width: 1.5,
          ),
          boxShadow: [
            // Multiple shadows for depth
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section with icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Enhanced icon container
                Container(
                  width: context.mw * 0.08,
                  height: context.mw * 0.08,
                  decoration: BoxDecoration(
                    // Gradient background for icon
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        iconBackgroundColor ?? const Color(0xFF4A7C59),
                        (iconBackgroundColor ?? const Color(0xFF4A7C59))
                            .withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: (iconBackgroundColor ?? const Color(0xFF4A7C59))
                            .withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? Colors.white,
                    size: context.mh * 0.025,
                  ),
                ),
                // Optional: Add a small trend indicator
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.02,
                    vertical: context.mh * 0.005,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.trending_up,
                    color: Colors.green[600],
                    size: context.mh * 0.018,
                  ),
                ),
              ],
            ),
            0.01.ph(context),
            // Count with better typography
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: context.mh * 0.025,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1A1A1A),
                letterSpacing: -0.5,
              ),
            ),

            // SizedBox(height: context.mh * 0.008),

            // Title with improved styling
            Text(
              title.tr(),
              style: TextStyle(
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            0.02.ph(context),
          ],
        ),
      ),
    );
  }
}
