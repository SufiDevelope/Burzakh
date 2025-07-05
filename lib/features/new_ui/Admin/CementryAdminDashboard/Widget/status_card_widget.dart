import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class GenericStatsContainerWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color topBorderColor;
  final VoidCallback? onTap;

  const GenericStatsContainerWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBackgroundColor,
    required this.topBorderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.mw * 0.42,
        height: context.mh * 0.18,
        margin: EdgeInsets.all(context.mw * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: context.mw * 0.02,
              offset: Offset(0, context.mh * 0.004),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: context.mw * 0.02,
                right: context.mw * 0.02,
              ),
              height: context.mh * 0.004,
              decoration: BoxDecoration(
                color: topBorderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                0.03.ph(context),
                Container(
                  width: context.mw * 0.12,
                  height: context.mw * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        iconBackgroundColor,
                        iconBackgroundColor.withOpacity(0.7)
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: iconBackgroundColor.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 28),
                ),
                0.01.ph(context),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: context.mh * 0.02,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [Colors.grey[800]!, Colors.grey[600]!],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: context.mh * 0.012,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
