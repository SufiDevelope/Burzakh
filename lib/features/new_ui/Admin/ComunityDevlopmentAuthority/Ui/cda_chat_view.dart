import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Widgets/cda_chat_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class CdaChatView extends StatefulWidget {
  final int userId;
  final String deviceToken;
  const CdaChatView(
      {super.key, required this.userId, required this.deviceToken});

  @override
  State<CdaChatView> createState() => _CdaChatViewState();
}

class _CdaChatViewState extends State<CdaChatView> {
  final controller = Get.put(CdaController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCdaChatApi(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final Color primaryColor = const Color(0xFF1e40af);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          StringTranslateExtension("CDA Chat").tr(),
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
                  if (controller.rxRequestStatusForCdaChat.value ==
                      Status.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.rxRequestStatusForCdaChat.value ==
                      Status.error) {
                    return Center(
                      child: Text("Error"),
                    );
                  } else if (controller.rxRequestStatusForCdaChat.value ==
                      Status.completed) {
                    return ListView.builder(
                      itemCount: controller.cdafilterChatList.length,
                      itemBuilder: (context, index) {
                        var data = controller.cdafilterChatList[index];
                        return CdaChatWidget(
                          message: data.message ?? "No message found",
                          timestamp: DateFormat('yyyy-MM-dd').format(
                            DateTime.parse(
                              data.createdAt ??
                                  DateTime.now().toIso8601String(),
                            ),
                          ),
                          isCurrentUser: data.role == "cda" ? true : false,
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
                          hintText:
                              StringTranslateExtension("Type your message...")
                                  .tr(),
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
                            controller.sendChatMessageApi(
                                widget.userId,
                                messageController.text.trim(),
                                widget.deviceToken);
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
