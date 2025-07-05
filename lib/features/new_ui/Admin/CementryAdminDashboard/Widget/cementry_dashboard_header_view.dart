import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

class CementryDashboardHeaderWidget extends StatelessWidget {
  const CementryDashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.mw,
      margin: EdgeInsets.all(context.mw * 0.025),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(context.mw * 0.04),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: context.mw * 0.03,
            offset: Offset(0, context.mh * 0.005),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.04,
          vertical: context.mh * 0.02,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFF4F46E5),
                        Color(0xFF7C3AED),
                        Color(0xFF059669)
                      ],
                    ).createShader(bounds),
                    child: Text(
                      "Cemetery\nAdmin\nDashboard",
                      style: TextStyle(
                        fontSize: context.mh * 0.022,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            0.05.pw(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.mw * 0.015,
                    vertical: context.mh * 0.008,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981),
                    borderRadius: BorderRadius.circular(context.mw * 0.02),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.3),
                        blurRadius: context.mw * 0.01,
                        offset: Offset(0, context.mh * 0.003),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: context.mh * 0.016,
                        color: Colors.white,
                      ),
                      SizedBox(width: context.mw * 0.008),
                      Flexible(
                        child: Text(
                          'Create Visitor Alert',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.012,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                0.01.ph(context),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.015,
                        vertical: context.mh * 0.008,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7C3AED),
                        borderRadius: BorderRadius.circular(context.mw * 0.02),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF7C3AED).withOpacity(0.3),
                            blurRadius: context.mw * 0.01,
                            offset: Offset(0, context.mh * 0.003),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: context.mh * 0.016,
                            color: Colors.white,
                          ),
                          SizedBox(width: context.mw * 0.008),
                          Flexible(
                            child: Text(
                              'View Visitor Portal',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.mh * 0.012,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                0.01.ph(context),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.015,
                      vertical: context.mh * 0.008,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF64748B),
                      borderRadius: BorderRadius.circular(context.mw * 0.02),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF64748B).withOpacity(0.3),
                          blurRadius: context.mw * 0.01,
                          offset: Offset(0, context.mh * 0.003),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.language,
                          size: context.mh * 0.016,
                          color: Colors.white,
                        ),
                        SizedBox(width: context.mw * 0.008),
                        Text(
                          'العربية',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.mh * 0.012,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
