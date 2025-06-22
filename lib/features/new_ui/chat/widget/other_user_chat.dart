import 'package:flutter/material.dart';
import '../../../../constants/encrypt_data.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class UserContainerChat extends StatelessWidget {
  final String message;
  UserContainerChat({super.key, required this.message});
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(maxWidth: 250),
                decoration: BoxDecoration(
                  color: Color(0xff515862),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(13),
                    bottomRight: Radius.circular(13),
                    bottomLeft: Radius.circular(13),
                  ),
                ),
                child: AppText(
                  text: message,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
