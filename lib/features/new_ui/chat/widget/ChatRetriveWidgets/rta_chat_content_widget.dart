import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/chat/widget/other_user_chat.dart';
import 'package:burzakh/features/new_ui/chat/widget/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RtaChatContentWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final RtaController rtacontroller;

  const RtaChatContentWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.rtacontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final status = rtacontroller.rxRequestStatusForRtaChat.value;

      if (status == Status.loading) {
        return _buildLoadingState();
      } else if (status == Status.error) {
        return _buildErrorState();
      } else if (status == Status.completed) {
        if (rtacontroller.rtaChatList.isEmpty) {
          return _buildEmptyState();
        }

        return ListView.builder(
          itemCount: rtacontroller.rtaChatList.length,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.02,
          ),
          itemBuilder: (context, index) {
            final chat = rtacontroller.rtaChatList[index];
            final isRta = chat.role == "rta";
            final message = chat.message ?? '';
            final time = DateTime.parse(chat.createdAt.toString());

            return Container(
              margin: EdgeInsets.only(bottom: screenWidth * 0.02),
              child: isRta
                  ? OtherUserChat(message: message, time: time)
                  : UserContainerChat(message: message, time: time),
            );
          },
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Text(
        'Something went wrong. Please try again.',
        style: TextStyle(fontSize: screenWidth * 0.04),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No chat messages found.',
        style: TextStyle(fontSize: screenWidth * 0.04),
      ),
    );
  }
}
