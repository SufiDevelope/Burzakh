import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/AppColor.dart';

class OtherUserChat extends StatelessWidget {
  final String message;
  final DateTime time; // New time field

  OtherUserChat({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('hh:mm a').format(time); // Format: 03:45 PM

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 60, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xff515862),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                ),
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
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.white(),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColor.white().withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
