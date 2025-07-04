import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/chat/widget/other_user_chat.dart';
import 'package:burzakh/features/new_ui/chat/widget/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DubaiMancipalityChatContent extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final DubaiController dubaiController;

  const DubaiMancipalityChatContent({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.dubaiController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final status =
          dubaiController.rxRequestStatusForAllDubaiRequestChat.value;

      if (status == Status.loading) {
        return _buildLoadingState();
      } else if (status == Status.error) {
        return _buildErrorState();
      } else if (status == Status.completed) {
        if (dubaiController.chatmodel.value.data?.isEmpty ?? true) {
          return _buildEmptyState();
        }

        return ListView.builder(
          itemCount: dubaiController.chatmodel.value.data?.length,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.02,
          ),
          itemBuilder: (context, index) {
            final chat = dubaiController.chatmodel.value.data?[index];
            final isCda = chat?.role == "mancipality";
            final message = chat?.message ?? '';
            final time = DateTime.parse(chat?.createdAt.toString() ?? '');

            return Container(
              margin: EdgeInsets.only(bottom: screenWidth * 0.02),
              child: isCda
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
    return Center(child: CircularProgressIndicator());
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
