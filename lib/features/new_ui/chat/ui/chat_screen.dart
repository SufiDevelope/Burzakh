// ignore_for_file: must_be_immutable
import 'dart:developer';
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
  ChatScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.id,
      required this.adminType});
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColor.bgGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            ChatTopBar(
              name: StringTranslateExtension(widget.name).tr(),
              image: widget.image,
            ),
            if (widget.adminType == "rta")
              Obx(() {
                final status = rtacontroller.rxRequestStatusForRtaChat.value;

                if (status == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (status == Status.error) {
                  return Center(child: Text("Error"));
                } else if (status == Status.completed) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: rtacontroller.rtaChatList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return rtacontroller.rtaChatList[index].role == "rta"
                            ? UserContainerChat(
                                message:
                                    rtacontroller.rtaChatList[index].message ??
                                        '',
                              )
                            : OtherUserChat(
                                message:
                                    rtacontroller.rtaChatList[index].message ??
                                        '');
                      },
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              })
            else if (widget.adminType == "cda")
              Obx(() {
                final status = cdacontroller.rxRequestStatusForCdaChat.value;
                if (status == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (status == Status.error) {
                  return Center(child: Text("Error"));
                } else if (status == Status.completed) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cdacontroller.cdaChatList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return cdacontroller.cdaChatList[index].role == "cda"
                            ? UserContainerChat(
                                message:
                                    cdacontroller.cdaChatList[index].message ??
                                        '',
                              )
                            : OtherUserChat(
                                message:
                                    cdacontroller.cdaChatList[index].message ??
                                        '');
                      },
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              })
            else
              SizedBox.shrink(),
            // Spacer(),
            RiderSendChatField(id: widget.id, adminType: widget.adminType),
          ],
        ),
      ),
    );
  }
}

var chatCubit = DiContainer().sl<ChatCubit>();
var authCubit = DiContainer().sl<AuthenticationCubit>();
