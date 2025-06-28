import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/rta_chat_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RtaChatView extends StatefulWidget {
  final int userId;
  final String deviceToken;
  const RtaChatView(
      {super.key, required this.userId, required this.deviceToken});

  @override
  State<RtaChatView> createState() => _RtaChatViewState();
}

class _RtaChatViewState extends State<RtaChatView> {
  final controller = Get.put(RtaController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getRtaChatApi(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final Color primaryColor = const Color(0xFF8B4A5C);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "RTA Chat",
          style: TextStyle(
            color: Colors.white,
            fontSize: context.mh * 0.018,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: context.mh * 0.025,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                color: Colors.grey[50],
                child: Obx(() {
                  if (controller.rxRequestStatusForRtaChat.value ==
                      Status.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.rxRequestStatusForRtaChat.value ==
                      Status.error) {
                    return Center(
                      child: Text("Error"),
                    );
                  } else if (controller.rxRequestStatusForRtaChat.value ==
                      Status.completed) {
                    return ListView.builder(
                      itemCount: controller.rtafilterChatList.length,
                      itemBuilder: (context, index) {
                        var data = controller.rtafilterChatList[index];
                        return RtaChatWidget(
                          message: data.message ?? "No message found",
                          timestamp: DateFormat('dd MMM, hh:mm a')
                              .format(DateTime.parse(data.createdAt ?? "")),
                          isCurrentUser: data.role == "rta" ? true : false,
                          onTap: () {},
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("No Chat Found"),
                    );
                  }
                })),
          ),

          // Message Input Area
          Container(
            padding: EdgeInsets.all(context.mw * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      child: TextFormField(
                        controller: messageController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: context.mw * 0.04,
                            vertical: context.mh * 0.015,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: context.mh * 0.016,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  0.03.pw(context),
                  Obx(() {
                    return Container(
                      width: context.mw * 0.12,
                      height: context.mw * 0.12,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (messageController.text.trim().isNotEmpty) {
                            controller.sendChatMessageApi(
                                  widget.userId, messageController.text.trim(), widget.deviceToken);
                              messageController.clear();
                            
                          }
                        },
                        icon: controller.loading == true
                            ? CircularProgressIndicator()
                            : Icon(
                                Icons.send,
                                color: Colors.white,
                                size: context.mh * 0.022,
                              ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
