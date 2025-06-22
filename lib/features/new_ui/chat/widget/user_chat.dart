import 'package:flutter/material.dart';
import '../../../../constants/encrypt_data.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class OtherUserChat extends StatelessWidget {
  final String message;
  OtherUserChat({super.key, required this.message});
  final EncryptionHelper _encryptionHelper = EncryptionHelper("U6HYuSAgO26p32wfpDk7iRCc4oQZy3U1","16");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(maxWidth: 250),
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
                ),
                child: AppText(
                  // text: _encryptionHelper.decryptMessage(message),
                  text: message,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.white().withOpacity(0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

