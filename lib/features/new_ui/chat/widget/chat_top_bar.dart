// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/app_text.dart';

class ChatTopBar extends StatelessWidget {
  ChatTopBar({super.key,required this.name,required this.image,});
  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration:  BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {Navigator.pop(context);},
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: AppColor.white(),
                        shape: BoxShape.circle),
                    child:  Icon(
                      Icons.arrow_back,
                      color: AppColor.buttonColor,
                      size: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                // Container(
                //   height: 60,
                //   width: 60,
                //   padding: const EdgeInsets.all(4),
                //   decoration: BoxDecoration(
                //       border: Border.all(
                //           color: AppColor.primary(), width: 1),
                //       color: AppColor.buttonColor.withOpacity(0.17),
                //       shape: BoxShape.circle),
                //   child: CircleAvatar(
                //     backgroundColor:
                //     AppColor.buttonColor,
                //     backgroundImage: NetworkImage(
                //       image,
                //     ),
                //     radius: 26,
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: name,
                        fontSize: 17,
                        color: AppColor.white(),
                        fontFamily: 'ns',
                        fontWeight: FontWeight.w500),
                    const SizedBox(
                      height: 8,
                    ),
                    //  Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     AppText(
                    //         text: "Active",
                    //         fontSize: 11,
                    //         color: AppColor.whiteLight1,
                    //         fontWeight: FontWeight.w500),
                    //     CircleAvatar(
                    //       radius: 2,
                    //       backgroundColor: AppColor.green1,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}

