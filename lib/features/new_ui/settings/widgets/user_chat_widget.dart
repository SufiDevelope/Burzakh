// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/chat/ui/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';

class UserChatWidget extends StatelessWidget {
   UserChatWidget({super.key,required this.id,required this.adminType,required this.name,required this.time,required this.image,required this.lastMessage,});
String image;
String name;
String lastMessage;
String time;
   String id;String adminType;
   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(id: id,adminType: adminType,name: name, image: image,),)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: context.mw * 0.1,
              height: context.mw * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  image,
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text:
                      name,
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black(),
                        fontFamily: 'nm',
                      ),
                      // AppText(text:
                      // time,
                      //   fontSize: 12,
                      //   color: Colors.grey[500],
                      // ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  AppText(text:
                  lastMessage,
                    fontSize: context.mh * 0.014,
                    color: Colors.grey[500],
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
