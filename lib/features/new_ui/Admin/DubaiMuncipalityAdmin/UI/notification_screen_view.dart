import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/notification/presentation/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MuncipalityNotificationScreen extends StatefulWidget {
  const MuncipalityNotificationScreen({super.key});

  @override
  State<MuncipalityNotificationScreen> createState() =>
      _MuncipalityNotificationScreenState();
}

class _MuncipalityNotificationScreenState
    extends State<MuncipalityNotificationScreen> {
  final controller = Get.put(NotificationController());

  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllNotifs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff596e84),
                Color(0xff617890),
                Color(0xff2d4159),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff596e84),
                Color(0xff617890),
                Color(0xff2d4159),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Obx(() {
            switch (controller.rxRequestForAllNotifs.value) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());

              case Status.completed:
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount:
                      controller.modelNotifs.value.notifications?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12.0),
                      color: Colors.white.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Municipality Notification',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              controller.modelNotifs.value.notifications?[index]
                                      .notificationMessage ??
                                  '',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  DateTime.parse(controller
                                              .modelNotifs
                                              .value
                                              .notifications?[index]
                                              .createdAt ??
                                          '')
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              case Status.error:
                return Center(child: Text('Error'));
              default:
                return const Center(child: Text('Error'));
            }
          })),
    );
  }
}
