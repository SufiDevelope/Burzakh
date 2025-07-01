import 'package:flutter/material.dart';
import 'package:burzakh/Extenshion/extenshion.dart';

class BurialCardWidget extends StatelessWidget {
  final String name;
  final String relative;
  final String location;
  final String date;
  final String time;
  final String status;
  final String caseId;
  final int messageCount;
  final VoidCallback? onTap;
  final VoidCallback? onMessageTap;
  final List<String> documents;

  const BurialCardWidget({
    super.key,
    required this.name,
    required this.relative,
    required this.location,
    required this.date,
    required this.time,
    required this.status,
    required this.caseId,
    required this.messageCount,
    this.onTap,
    this.onMessageTap,
    required this.documents,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02,
          vertical: context.mh * 0.01,
        ),
        padding: EdgeInsets.all(context.mw * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name + Badges
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: context.mh * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Row(
                  children: [
                    _buildBadge(context, status, Colors.blue.shade100,
                        Color(0xff243b53),
                        isId: false),
                    0.01.pw(context),
                    _buildBadge(
                        context, caseId, Colors.grey.shade200, Colors.black87,
                        isId: true),
                  ],
                ),
              ],
            ),

            0.005.ph(context),
            Text(
              relative,
              style: TextStyle(
                color: Colors.black54,
                fontSize: context.mh * 0.016,
              ),
            ),

            0.02.ph(context),

            /// Location
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: context.mh * 0.018, color: Colors.grey),
                0.01.pw(context),
                Text(
                  location,
                  style: TextStyle(
                      fontSize: context.mh * 0.015, color: Colors.black54),
                ),
              ],
            ),

            0.01.ph(context),

            /// Date and Time
            Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: context.mh * 0.018, color: Colors.grey),
                0.01.pw(context),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: context.mh * 0.015, color: Colors.black54),
                ),
              ],
            ),
            0.01.ph(context),
            Row(
              children: [
                Icon(Icons.access_time,
                    size: context.mh * 0.018, color: Colors.grey),
                0.01.pw(context),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: context.mh * 0.015, color: Colors.black54),
                ),
              ],
            ),

            0.02.ph(context),

            /// Document Status
            Wrap(
              spacing: context.mw * 0.02,
              runSpacing: context.mh * 0.01,
              children: [
                ...documents.map((document) => _DocumentChip(label: document)),
              ],
            ),

            0.02.ph(context),

            /// Message Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onMessageTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.04,
                      vertical: context.mh * 0.012,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Messages ($messageCount)',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: context.mh * 0.014,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _circleButton(
                        Icons.add, Colors.blue.shade100, Colors.blue, context,
                        isGradient: true),
                    0.02.pw(context),
                    _circleButton(Icons.chevron_right, Colors.grey.shade200,
                        Colors.grey, context,
                        isGradient: false),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(
      BuildContext context, String text, Color bg, Color textColor,
      {bool isId = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.025, vertical: context.mh * 0.005),
      decoration: BoxDecoration(
        gradient: isId == false
            ? LinearGradient(colors: [
                Color(0xffd9e2ec),
                Color(0xffbcccdc),
              ])
            : null,
        borderRadius: BorderRadius.circular(8),
        color: isId == false ? null : bg,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.mh * 0.013,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _circleButton(
    IconData icon,
    Color bgColor,
    Color iconColor,
    BuildContext context, {
    bool isGradient = false,
  }) {
    return Container(
      padding: EdgeInsets.all(context.mw * 0.02),
      decoration: BoxDecoration(
        color: isGradient == false ? bgColor : null,
        gradient: isGradient == false
            ? null
            : LinearGradient(colors: [
                Color(0xffe0f2fe),
                Color(0xffbae6fd),
              ]),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Color(0xff0369a1),
          width: 0.1,
        ),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: context.mh * 0.018,
      ),
    );
  }
}

class _DocumentChip extends StatelessWidget {
  final String label;

  const _DocumentChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.025,
        vertical: context.mh * 0.006,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, color: Colors.green, size: context.mh * 0.015),
          0.01.pw(context),
          Text(
            label,
            style: TextStyle(
              color: Colors.green,
              fontSize: context.mh * 0.014,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
