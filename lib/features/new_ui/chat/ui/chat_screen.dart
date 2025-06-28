// // ignore_for_file: must_be_immutable
// import 'dart:developer';
// import 'package:burzakh/Extenshion/extenshion.dart';
// import 'package:burzakh/core/theme/AppColor.dart';
// import 'package:burzakh/data/Response/status.dart';
// import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
// import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
// import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
// import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
// import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
// import 'package:burzakh/features/new_ui/chat/widget/chat_top_bar.dart';
// import 'package:burzakh/features/new_ui/chat/widget/other_user_chat.dart';
// import 'package:burzakh/features/new_ui/chat/widget/send_message_field.dart';
// import 'package:burzakh/features/new_ui/chat/widget/user_chat.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../core/app/di_container.dart';
// import '../cubit/chat_cubit.dart';

// class ChatScreen extends StatefulWidget {
//   ChatScreen(
//       {super.key,
//       required this.name,
//       required this.image,
//       required this.id,
//       required this.adminType});
//   String image;
//   String name;
//   String id;
//   String adminType;
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final rtacontroller = Get.put(RtaController());
//   final cdacontroller = Get.put(CdaController());

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       UserShareprefController pref = UserShareprefController();
//       UserModel? model = await pref.getData();
//       log(widget.adminType);
//       log(model?.id.toString() ?? "");
//       if (widget.adminType == "rta") {
//         rtacontroller.getRtaChatApi(model?.id);
//       } else if (widget.adminType == "cda") {
//         cdacontroller.getCdaChatApi(model?.id);
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: [
//           ChatTopBar(
//             name: StringTranslateExtension(widget.name).tr(),
//             image: widget.image,
//           ),
//           if (widget.adminType == "rta")
//             Obx(() {
//               final status = rtacontroller.rxRequestStatusForRtaChat.value;

//               if (status == Status.loading) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (status == Status.error) {
//                 return Center(child: Text("Error"));
//               } else if (status == Status.completed) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: rtacontroller.rtaChatList.length,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemBuilder: (context, index) {
//                       return rtacontroller.rtaChatList[index].role == "rta"
//                           ? OtherUserChat(
//                               message:
//                                   rtacontroller.rtaChatList[index].message ??
//                                       '',
//                               time: DateTime.parse(
//                                 rtacontroller.rtaChatList[index].createdAt
//                                     .toString(),
//                               ),
//                             )
//                           : UserContainerChat(
//                               message:
//                                   rtacontroller.rtaChatList[index].message ??
//                                       '',
//                               time: DateTime.parse(
//                                 rtacontroller.rtaChatList[index].createdAt
//                                     .toString(),
//                               ),
//                             );
//                     },
//                   ),
//                 );
//               } else {
//                 return SizedBox.shrink();
//               }
//             })
//           else if (widget.adminType == "cda")
//             Expanded(
//               child: Obx(() {
//                 final status = cdacontroller.rxRequestStatusForCdaChat.value;
//                 if (status == Status.loading) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (status == Status.error) {
//                   return Center(child: Text("Error"));
//                 } else if (status == Status.completed) {
//                   return ListView.builder(
//                     itemCount: cdacontroller.cdaChatList.length,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemBuilder: (context, index) {
//                       return cdacontroller.cdaChatList[index].role == "cda"
//                           ? OtherUserChat(
//                               message:
//                                   cdacontroller.cdaChatList[index].message ??
//                                       '',
//                               time: DateTime.parse(
//                                 cdacontroller.cdaChatList[index].createdAt
//                                     .toString(),
//                               ),
//                             )
//                           : UserContainerChat(
//                               message:
//                                   cdacontroller.cdaChatList[index].message ??
//                                       '',
//                               time: DateTime.parse(
//                                 cdacontroller.cdaChatList[index].createdAt
//                                     .toString(),
//                               ),
//                             );
//                     },
//                   );
//                 } else {
//                   return SizedBox.shrink();
//                 }
//               }),
//             )
//           else
//             SizedBox(
//               height: context.mh * 0.72,
//             ),
//           // Spacer(),
//         ],
//       ),
//       bottomNavigationBar:
//           RiderSendChatField(id: widget.id, adminType: widget.adminType),
//     );
//   }
// }

// var chatCubit = DiContainer().sl<ChatCubit>();
// var authCubit = DiContainer().sl<AuthenticationCubit>();
// ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable
import 'dart:developer';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/chat/widget/chat_top_bar.dart';
import 'package:burzakh/features/new_ui/chat/widget/other_user_chat.dart';
import 'package:burzakh/features/new_ui/chat/widget/send_message_field.dart';
import 'package:burzakh/features/new_ui/chat/widget/user_chat.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/app/di_container.dart';
import '../cubit/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
    super.key,
    required this.name,
    required this.image,
    required this.id,
    required this.adminType,
  });

  String image;
  String name;
  String id;
  String adminType;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final rtacontroller = Get.put(RtaController());
  final cdacontroller = Get.put(CdaController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      UserShareprefController pref = UserShareprefController();
      UserModel? model = await pref.getData();
      log(widget.adminType);
      log(model?.id.toString() ?? "");

      if (widget.adminType == "rta") {
        rtacontroller.getRtaChatApi(model?.id);
      } else if (widget.adminType == "cda") {
        cdacontroller.getCdaChatApi(model?.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildTopBar(screenWidth),
      body: Column(
        children: [
          // Chat Messages Area
          Expanded(
            child: _buildChatContent(screenWidth, screenHeight),
          ),

          // Bottom Input Field
          _buildBottomInputArea(screenWidth),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildTopBar(double screenWidth) {
    return PreferredSize(
      preferredSize: Size.fromHeight(screenWidth * 0.18),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenWidth * 0.03,
        ),
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  size: screenWidth * 0.06,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              CircleAvatar(
                radius: screenWidth * 0.05,
                backgroundImage:
                    widget.image.isNotEmpty ? AssetImage(widget.image) : null,
                backgroundColor: Colors.grey[300],
                child: widget.image.isEmpty
                    ? Icon(
                        Icons.person,
                        size: screenWidth * 0.05,
                        color: Colors.grey[600],
                      )
                    : null,
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringTranslateExtension(widget.name).tr(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.adminType.toUpperCase(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.026,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatContent(double screenWidth, double screenHeight) {
    if (widget.adminType == "rta") {
      return _buildRtaChatContent(screenWidth, screenHeight);
    } else if (widget.adminType == "cda") {
      return _buildCdaChatContent(screenWidth, screenHeight);
    } else {
      return _buildEmptyState(screenWidth, screenHeight);
    }
  }

  Widget _buildRtaChatContent(double screenWidth, double screenHeight) {
    return Obx(() {
      final status = rtacontroller.rxRequestStatusForRtaChat.value;

      if (status == Status.loading) {
        return _buildLoadingState(screenWidth);
      } else if (status == Status.error) {
        return _buildErrorState(screenWidth);
      } else if (status == Status.completed) {
        if (rtacontroller.rtaChatList.isEmpty) {
          return _buildEmptyState(screenWidth, screenHeight);
        }

        return ListView.builder(
          itemCount: rtacontroller.rtaChatList.length,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.02,
          ),
          itemBuilder: (context, index) {
            final isRta = rtacontroller.rtaChatList[index].role == "rta";
            return Container(
              margin: EdgeInsets.only(bottom: screenWidth * 0.02),
              child: isRta
                  ? OtherUserChat(
                      message: rtacontroller.rtaChatList[index].message ?? '',
                      time: DateTime.parse(
                        rtacontroller.rtaChatList[index].createdAt.toString(),
                      ),
                    )
                  : UserContainerChat(
                      message: rtacontroller.rtaChatList[index].message ?? '',
                      time: DateTime.parse(
                        rtacontroller.rtaChatList[index].createdAt.toString(),
                      ),
                    ),
            );
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _buildCdaChatContent(double screenWidth, double screenHeight) {
    return Obx(() {
      final status = cdacontroller.rxRequestStatusForCdaChat.value;

      if (status == Status.loading) {
        return _buildLoadingState(screenWidth);
      } else if (status == Status.error) {
        return _buildErrorState(screenWidth);
      } else if (status == Status.completed) {
        if (cdacontroller.cdaChatList.isEmpty) {
          return _buildEmptyState(screenWidth, screenHeight);
        }

        return ListView.builder(
          itemCount: cdacontroller.cdaChatList.length,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.02,
          ),
          itemBuilder: (context, index) {
            final isCda = cdacontroller.cdaChatList[index].role == "cda";
            return Container(
              margin: EdgeInsets.only(bottom: screenWidth * 0.02),
              child: isCda
                  ? OtherUserChat(
                      message: cdacontroller.cdaChatList[index].message ?? '',
                      time: DateTime.parse(
                        cdacontroller.cdaChatList[index].createdAt.toString(),
                      ),
                    )
                  : UserContainerChat(
                      message: cdacontroller.cdaChatList[index].message ?? '',
                      time: DateTime.parse(
                        cdacontroller.cdaChatList[index].createdAt.toString(),
                      ),
                    ),
            );
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _buildLoadingState(double screenWidth) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: screenWidth * 0.04),
          Text(
            "Loading messages...",
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(double screenWidth) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: screenWidth * 0.15,
            color: Colors.grey[400],
          ),
          SizedBox(height: screenWidth * 0.04),
          Text(
            "Something went wrong",
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            "Please try again later",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: screenWidth * 0.15,
            color: Colors.grey[400],
          ),
          SizedBox(height: screenWidth * 0.04),
          Text(
            "No messages yet",
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            "Start a conversation",
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInputArea(double screenWidth) {
    return RiderSendChatField(
      id: widget.id,
      adminType: widget.adminType,
    );
  }
}

var chatCubit = DiContainer().sl<ChatCubit>();
var authCubit = DiContainer().sl<AuthenticationCubit>();
