import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_chat_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DubaiChatView extends StatefulWidget {
  final int userId;
  final String deviceToken;
  const DubaiChatView({
    super.key,
    required this.userId,
    required this.deviceToken,
  });

  @override
  State<DubaiChatView> createState() => _DubaiChatViewState();
}

class _DubaiChatViewState extends State<DubaiChatView> {
  final controller = Get.put(DubaiController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getDubaiChatApi(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final Color primaryColor = dashboardcolor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Dubai Municipality Chat",
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
                  if (controller.rxRequestStatusForAllDubaiRequestChat.value ==
                      Status.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller
                          .rxRequestStatusForAllDubaiRequestChat.value ==
                      Status.error) {
                    return Center(
                      child: Text("Error"),
                    );
                  } else if (controller
                          .rxRequestStatusForAllDubaiRequestChat.value ==
                      Status.completed) {
                    return ListView.builder(
                      itemCount: controller.chatmodel.value.data?.length,
                      itemBuilder: (context, index) {
                        var data = controller.chatmodel.value.data?[index];
                        return DubaiChatWidget(
                          message: data?.message ?? "No message found",
                          timestamp: DateFormat('yyyy-MM-dd').format(
                            DateTime.parse(
                              data?.createdAt ??
                                  DateTime.now().toIso8601String(),
                            ),
                          ),
                          isCurrentUser:
                              data?.role == "mancipality" ? true : false,
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
                        onPressed: () {
                          if (messageController.text.trim().isNotEmpty) {
                            controller.sendDubaiSupportMessage(
                              messageController.text.trim(),
                              widget.userId,
                              widget.deviceToken,
                            );
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
