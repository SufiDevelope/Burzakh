import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this if not already imported
import '../../../../core/theme/AppColor.dart';

class UserContainerChat extends StatelessWidget {
  final String message;
  final DateTime time; // New time field

  UserContainerChat({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('hh:mm a').format(time); // e.g., 03:45 PM

    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColor.buttonColor,
                border: Border.all(
                  color: AppColor.darkGreen.withOpacity(0.5),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.buttonColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.white().withOpacity(0.9),
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
