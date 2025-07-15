import 'package:flutter/material.dart';
import 'package:burzakh/Extenshion/extenshion.dart';

class JanazaScheduleCardWidget extends StatelessWidget {
  final String name;
  final String arabicName;
  final String mercyText;
  final String timeLabel;
  final String description;
  final bool isToday;
  final String cemetery;
  final String time;
  final String mosque;

  const JanazaScheduleCardWidget({
    super.key,
    required this.name,
    required this.arabicName,
    required this.mercyText,
    required this.timeLabel,
    required this.description,
    this.isToday = false, required this.cemetery, required this.time, required this.mosque,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(context.mw * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Name and Dot
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // English Name
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: context.mh * 0.028,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.2,
                        ),
                      ),

                      0.01.ph(context),

                      // Mercy Text
                      Text(
                        mercyText,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          color: Color(0xFF7B68EE),
                          fontStyle: FontStyle.italic,
                          height: 1.3,
                        ),
                      ),

                      0.015.ph(context),

                      // Arabic Name
                      Text(
                        arabicName,
                        style: TextStyle(
                          fontSize: context.mh * 0.022,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),

                // Status Dot
                Container(
                  width: context.mw * 0.035,
                  height: context.mw * 0.035,
                  decoration: BoxDecoration(
                    color: Color(0xFFB8860B),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            0.025.ph(context),

            // Time Label
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.mw * 0.04,
                vertical: context.mh * 0.008,
              ),
              decoration: BoxDecoration(
                color: isToday
                    ? Color(0xFF90EE90).withOpacity(0.23)
                    : Color(0xFFE8F5E8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isToday ? Color(0xFF32CD32) : Color(0xFFB8D8B8),
                  width: 1,
                ),
              ),
              child: Text(
                timeLabel,
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  color: isToday ? Color(0xFF228B22) : Color(0xFF556B2F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            0.025.ph(context),

            // Description
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.04),
              decoration: BoxDecoration(
                color: Color(0xFFfaf5ee),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFFfaf5ee),
                  width: 1,
                ),
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),

            0.025.ph(context),

            // Cemetery Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.04),
              decoration: BoxDecoration(
                color: Color(0xFFf0f4f8),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFFe2e8f0),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: context.mw * 0.1,
                    height: context.mw * 0.1,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4b6fa5).withOpacity(0.23),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: const Color(0xFF4b6fa5),
                      size: context.mh * 0.02,
                    ),
                  ),
                  0.03.pw(context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cemetery',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            color: Color(0xFF64748b),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.005.ph(context),
                        Text(
                          cemetery,
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            0.015.ph(context),

            // Time Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.04),
              decoration: BoxDecoration(
                color: Color(0xFFf6eee7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFFede2d3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: context.mw * 0.12,
                    height: context.mw * 0.12,
                    decoration: BoxDecoration(
                      color: const Color(0xFFad8443).withOpacity(0.23),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFf1eade),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.schedule,
                      color: const Color(0xFFad8443),
                      size: context.mh * 0.025,
                    ),
                  ),
                  0.03.pw(context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            color: Color(0xFF857f76),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.005.ph(context),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            0.015.ph(context),

            // Mosque Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(context.mw * 0.04),
              decoration: BoxDecoration(
                color: Color(0xFFf6eee7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFFede2d3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: context.mw * 0.12,
                    height: context.mw * 0.12,
                    decoration: BoxDecoration(
                      color: const Color(0xFFad8443).withOpacity(0.23),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFf1eade),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.mosque,
                      color: const Color(0xFFad8443),
                      size: context.mh * 0.025,
                    ),
                  ),
                  0.03.pw(context),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mosque',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            color: Color(0xFF857f76),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.005.ph(context),
                        Text(
                          mosque,
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            0.025.ph(context),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: context.mh * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xFFe2e8f0),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFFcbd5e1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions,
                          color: Color(0xFF475569),
                          size: context.mh * 0.022,
                        ),
                        0.02.pw(context),
                        Text(
                          'Directions',
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            color: Color(0xFF475569),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                0.03.pw(context),
                Expanded(
                  child: Container(
                    height: context.mh * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xFFe2e8f0),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Color(0xFFcbd5e1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Color(0xFF475569),
                          size: context.mh * 0.022,
                        ),
                        0.02.pw(context),
                        Text(
                          'Share',
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            color: Color(0xFF475569),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
