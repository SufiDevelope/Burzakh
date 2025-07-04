import 'dart:developer';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/chat/widget/ChatRetriveWidgets/cda_chat_content_widget.dart';
import 'package:burzakh/features/new_ui/chat/widget/ChatRetriveWidgets/dubai_mancipality_chat_content_widget.dart';
import 'package:burzakh/features/new_ui/chat/widget/ChatRetriveWidgets/rta_chat_content_widget.dart';
import 'package:burzakh/features/new_ui/chat/widget/send_message_field.dart';
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
  final dubaiController = Get.put(DubaiController());

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
      } else if (widget.adminType == "mancipality_assistence") {
        dubaiController.getDubaiChatApi(model?.id);
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
      return RtaChatContentWidget(
        screenWidth: MediaQuery.of(context).size.width,
        screenHeight: MediaQuery.of(context).size.height,
        rtacontroller: Get.put(RtaController()),
      );
    } else if (widget.adminType == "cda") {
      return CdaChatContentWidget(
        screenWidth: MediaQuery.of(context).size.width,
        screenHeight: MediaQuery.of(context).size.height,
        cdacontroller: Get.put(CdaController()),
      );
    } else if (widget.adminType == "mancipality_assistence") {
      return DubaiMancipalityChatContent(
        screenWidth: MediaQuery.of(context).size.width,
        screenHeight: MediaQuery.of(context).size.height,
        dubaiController: Get.put(DubaiController()),
      );
    } else {
      return _buildEmptyState(screenWidth, screenHeight);
    }
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
