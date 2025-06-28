// // ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/app_text.dart';

// class ChatTopBar extends StatelessWidget {
//   ChatTopBar({super.key,required this.name,required this.image,});
//   String image;
//   String name;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 25),
//         decoration:  BoxDecoration(
//             color: AppColor.buttonColor,
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(12),
//                 bottomRight: Radius.circular(12))),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),

//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {Navigator.pop(context);},
//                   child: Container(
//                     height: 36,
//                     width: 36,
//                     decoration: BoxDecoration(
//                         color: AppColor.white(),
//                         shape: BoxShape.circle),
//                     child:  Icon(
//                       Icons.arrow_back,
//                       color: AppColor.buttonColor,
//                       size: 19,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 // Container(
//                 //   height: 60,
//                 //   width: 60,
//                 //   padding: const EdgeInsets.all(4),
//                 //   decoration: BoxDecoration(
//                 //       border: Border.all(
//                 //           color: AppColor.primary(), width: 1),
//                 //       color: AppColor.buttonColor.withOpacity(0.17),
//                 //       shape: BoxShape.circle),
//                 //   child: CircleAvatar(
//                 //     backgroundColor:
//                 //     AppColor.buttonColor,
//                 //     backgroundImage: NetworkImage(
//                 //       image,
//                 //     ),
//                 //     radius: 26,
//                 //   ),
//                 // ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AppText(
//                         text: name,
//                         fontSize: 17,
//                         color: AppColor.white(),
//                         fontFamily: 'ns',
//                         fontWeight: FontWeight.w500),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     //  Row(
//                     //   crossAxisAlignment: CrossAxisAlignment.start,
//                     //   children: [
//                     //     AppText(
//                     //         text: "Active",
//                     //         fontSize: 11,
//                     //         color: AppColor.whiteLight1,
//                     //         fontWeight: FontWeight.w500),
//                     //     CircleAvatar(
//                     //       radius: 2,
//                     //       backgroundColor: AppColor.green1,
//                     //     ),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ));
//   }
// }

class ChatTopBar extends StatelessWidget {
  ChatTopBar({super.key, required this.name, required this.image});
  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.buttonColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Back Button
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColor.buttonColor,
                    size: 19,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            
            // Profile Info
            Expanded(
              child: Row(
                children: [
                  // Avatar (commented out as in original)
                  // Container(
                  //   height: 45,
                  //   width: 45,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Colors.white.withOpacity(0.3),
                  //         Colors.white.withOpacity(0.1),
                  //       ],
                  //     ),
                  //     border: Border.all(
                  //       color: Colors.white.withOpacity(0.4),
                  //       width: 2,
                  //     ),
                  //   ),
                  //   child: ClipOval(
                  //     child: Image.network(
                  //       image,
                  //       fit: BoxFit.cover,
                  //       errorBuilder: (context, error, stackTrace) => 
                  //         Icon(Icons.person, color: Colors.white, size: 24),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(width: 12),
                  
                  // Name and Status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white(),
                            fontFamily: 'ns',
                          ),
                        ),
                        SizedBox(height: 8),
                        // Row(
                        //   children: [
                        //     Container(
                        //       width: 8,
                        //       height: 8,
                        //       decoration: BoxDecoration(
                        //         color: Color(0xFF4CAF50),
                        //         shape: BoxShape.circle,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Color(0xFF4CAF50).withOpacity(0.5),
                        //             blurRadius: 4,
                        //             spreadRadius: 1,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(width: 6),
                        //     Text(
                        //       'Online',
                        //       style: TextStyle(
                        //         fontSize: 13,
                        //         color: Colors.white.withOpacity(0.9),
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // More Options (commented out as in original)
            // Container(
            //   height: 40,
            //   width: 40,
            //   decoration: BoxDecoration(
            //     color: Colors.white.withOpacity(0.2),
            //     borderRadius: BorderRadius.circular(12),
            //     border: Border.all(
            //       color: Colors.white.withOpacity(0.3),
            //       width: 1,
            //     ),
            //   ),
            //   child: Material(
            //     color: Colors.transparent,
            //     child: InkWell(
            //       borderRadius: BorderRadius.circular(12),
            //       onTap: () {},
            //       child: Icon(
            //         Icons.more_vert,
            //         color: Colors.white,
            //         size: 18,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
