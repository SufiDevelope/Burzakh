import 'dart:math';
import 'dart:developer' as dev;
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/additional_doc_requiremnts.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/police_admin_case_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/police_dashboard_header_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/quick_action_dialog_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/recent_case_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/schdeule_video_call_view.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/send_notification_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/status_card_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/status_tab_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/view_details_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class PoliceAdminDashboardView extends StatefulWidget {
  final String name;
  final String adminId;
  const PoliceAdminDashboardView(
      {super.key, required this.name, required this.adminId});

  @override
  State<PoliceAdminDashboardView> createState() =>
      _PoliceAdminDashboardViewState();
}

class _PoliceAdminDashboardViewState extends State<PoliceAdminDashboardView> {
  final controller = Get.put(PoliceAdminController());

  String generateUserIdWithTimestampAndRandom() {
    final Random random = Random();
    final int timestamp = DateTime.now().microsecondsSinceEpoch;

    final int randomNumber = random.nextInt(1000000);

    return '$timestamp-${randomNumber.toString().padLeft(6, '0')}';
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getCassesCountApi();
      controller.filterCassesApi();
    });
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: 1139162131,
      appSign:
          "3699c15758ff0f0903bf250a8b0de2f9911e619d4fe89b8d9ae495b4dfb58b47",
      userID: "admin_1",
      userName: widget.name,
      plugins: [ZegoUIKitSignalingPlugin()],
      notificationConfig: ZegoCallInvitationNotificationConfig(
        androidNotificationConfig:
            ZegoAndroidNotificationConfig(sound: 'zego_incoming'),
      ),
    );
    super.initState();
  }

  NotificationService notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    final List<TabItem> tabs = [
      const TabItem(title: 'All', count: 3),
      const TabItem(title: 'Pending'),
      const TabItem(title: 'Permit'),
      const TabItem(title: 'Schedule'),
      const TabItem(title: 'Approval'),
    ];

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getCassesCountApi();
          controller.filterCassesApi();
          controller.resetToFirst();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              PoliceDashboardHeaderWidget(
                title: 'Dubai Police',
                subtitle: 'Dashboard - Burzakh',
                officerName: widget.name,
                initials:
                    widget.name.split(" ").map((e) => e[0]).take(2).join(),
                email: '',
                onLogoutPressed: () async {
                  await documentCubit.logOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BurzakhEnhancedLogin(),
                    ),
                    (route) => false,
                  );
                },
                imageurl: "assets/images/jpg/dubaipolice.jpeg",
              ),
              StatusTabsWidget(tabs: tabs),
              Column(
                children: [
                  Obx(() {
                    if (controller.rxRequestStatusForAllCassesCount.value ==
                        Status.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller
                            .rxRequestStatusForAllCassesCount.value ==
                        Status.completed) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StatusCardWidget(
                              icon: Icons.access_time,
                              count: controller.model.value.pendingCases ?? 0,
                              title: 'Pending Cases',
                              iconBackgroundColor: const Color(0xFF00734B),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                            StatusCardWidget(
                              icon: Icons.video_call,
                              count:
                                  controller.model.value.scheduleCallCases ?? 0,
                              title: 'Schedule Call Cases',
                              iconBackgroundColor: const Color(0xFF00734B),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                            StatusCardWidget(
                              icon: Icons.check,
                              count:
                                  controller.model.value.approvedCasesToday ??
                                      0,
                              title: 'Approved Cases',
                              iconBackgroundColor: const Color(0xFF00734B),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                            StatusCardWidget(
                              icon: Icons.document_scanner,
                              count:
                                  controller.model.value.permitIssuedCases ?? 0,
                              title: 'Permit Issued Cases',
                              iconBackgroundColor: const Color(0xFF00734B),
                              onTap: () {
                                // Handle tap
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Text('Error');
                    }
                  }),
                  Obx(
                    () {
                      return PoliceAdminCaseWidget(
                        onSearchChanged: (value) {
                          controller
                              .filterCassesApiAccordingToSearchQuery(value);
                        },
                        onDropdownChanged: (value) {},
                        onFilterTap: () {
                          controller.filterCassesApi();
                        },
                        dropdownValue: controller.selectedFilter.value,
                      );
                    },
                  ),
                  Obx(() {
                    if (controller.rxRequestStatusForFilterCassesCount.value ==
                        Status.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller
                            .rxRequestStatusForFilterCassesCount.value ==
                        Status.completed) {
                      if (controller.filterDataForSearch.isEmpty) {
                        return Text(
                          StringTranslateExtension('No Data Found').tr(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: context.mh * 0.014,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.filterDataForSearch.length,
                            itemBuilder: (context, index) {
                              final data =
                                  controller.filterDataForSearch[index];
                              return GestureDetector(
                                onTap: () {
                                  _showDialog(data);
                                },
                                child: RecentCaseWidget(
                                  caseNumber:
                                      "BUR-${DateTime.now().year}-${data.id ?? ""}",
                                  submittedTime:
                                      DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(data.createdAt ?? ""),
                                  ),
                                  personName: "${data.nameOfDeceased ?? ""}",
                                  location: " ${data.restingPlace ?? ""}",
                                  issueDate:
                                      " ${DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(data.createdAt ?? ""),
                                  )}",
                                  status: data.caseStatus ?? "",
                                  statusColor: Colors.grey[200],
                                  onViewDetails: () {
                                    _showDialog(data);
                                  },
                                  onQuickAction: () {
                                    QuickActionsDialog.show(
                                      context,
                                      onIssueReleaseForm: () async {
                                        await controller.pickImage(
                                          widget.adminId,
                                          data.id ?? -1,
                                          data.user?.id ?? -1,
                                          context,
                                        );
                                      },
                                      onScheduleVideoCall: () async {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              ScheduleCallDialog(
                                            caseName:
                                                "${data.user?.firstName ?? ""} ${data.user?.lastName ?? ""}",
                                            caseNumber: "#2024-001",
                                            onScheduleCall: (selectedDate,
                                                selectedTime, meetingId) async {
                                              final receiverUserID =
                                                  data.user?.id.toString() ??
                                                      "user123";
                                              dev.log(
                                                  "Call Id when the admin invites the user ${meetingId}");
                                              notificationService
                                                  .sendNotification(
                                                "Incoming Video Call",
                                                "You have a video call scheduled",
                                                data.user?.deviceToken ?? "",
                                                callID: meetingId,
                                                userName: widget.name,
                                                receiverID: receiverUserID,
                                              )
                                                  .then((value) {
                                                Navigator.pop(context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CallPage(
                                                        callID: meetingId,
                                                        userName: widget.name,
                                                        isCaller: true,
                                                        receiverID:
                                                            receiverUserID,
                                                      ),
                                                    ));
                                              });
                                            },
                                          ),
                                        );
                                      },
                                      onRequestDocuments: () async {
                                        Navigator.pop(context);
                                        AdditionalDocsRequirementsDialog.show(
                                          context,
                                          caseNumber: data.id.toString(),
                                          personName:
                                              "${data.user?.firstName ?? ""} ${data.user?.lastName ?? ""}",
                                          onSubmit: (requirements) {
                                            dev.log(requirements.toString());
                                            notificationService
                                                .sendNotification(
                                              "Burzakh Notification",
                                              "Additional Documents Required",
                                              data.user?.deviceToken ?? "",
                                            )
                                                .then((value) {
                                              controller.policeQuickActionApi(
                                                widget.adminId,
                                                data.user?.id,
                                                data.id,
                                                "Additional Documents Required",
                                                requirements,
                                                context,
                                                null,
                                              );
                                            }).onError((error, stackTrace) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text(error.toString()),
                                                  backgroundColor: Colors.red,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      },
                                      onAssignToOfficer: () async {
                                        Navigator.pop(context);
                                        SendNotificationDialog.show(
                                          context,
                                          onSend: (title, body) async {
                                            dev.log(body);
                                            await notificationService
                                                .sendNotification(
                                              "Burzakh Notification",
                                              body,
                                              data.user?.deviceToken ?? "",
                                            )
                                                .then((value) {
                                              controller.policeQuickActionApi(
                                                widget.adminId,
                                                data.user?.id,
                                                data.id,
                                                body,
                                                null,
                                                context,
                                                null,
                                              );
                                            }).onError((error, stackTrace) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content:
                                                      Text(error.toString()),
                                                  backgroundColor: Colors.red,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            });
                      }
                    } else {
                      return const Text('Error');
                    }
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  var documentCubit = DiContainer().sl<HomeCubit>();

  // Show dialog
  void _showDialog(data) {
    showDialog(
      context: context,
      builder: (context) => CaseDetailsDialog(
        submittedBy:
            "${data.user?.firstName ?? ""} ${data.user?.lastName ?? ""}",
        relationship: "Authorized Officer",
        contactNumber: data.user?.phoneNumber ?? "",
        email: data.user?.email ?? "",
        deceasedName: data.nameOfDeceased ?? "",
        dateOfDeath: DateFormat('dd/MM/yyyy').format(
            (data.dateOfDeath is DateTime ? data.createdAt : DateTime.now())
                as DateTime),
        causeOfDeath: data.causeOfDeath ?? "",
        location: data.location ?? "",
        submittedDocuments: [
          data.passportOrEmirateIdFront != null &&
                  data.passportOrEmirateIdBack != null
              ? "Emirates ID Front"
              : "",
          data.passportOrEmirateIdBack != null ? "Emirates ID Back" : "",
          data.deathNotificationFile != null ? "Death Notification" : "",
          data.hospitalCertificate != null ? "Hospital Report" : "",
          data.user.passportCopy != null ? "Passport Copy" : "",
        ],
        onClose: () {
          Navigator.pop(context);
        },
        onApprove: () {
          controller.pickImageApproved(data.id, data.user?.id, context);
        },
        status: data.caseStatus ?? "",
        additionalDocument: data.additionalDocument,
        additionalDocumentUrl: data.additionalDocumentUploadUser,
        emiratesIdImageUrl: data.passportOrEmirateIdFront,
        documentUrls: {
          "Emirates ID Back": data.passportOrEmirateIdBack,
          "Death Notification": data.deathNotificationFile,
          "Hospital Report": data.hospitalCertificate,
          "Passport Copy": data.user.passportCopy,
        },
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String callID;
  final String userName;
  final bool isCaller;
  final String receiverID;

  const CallPage({
    Key? key,
    required this.callID,
    required this.userName,
    required this.isCaller,
    required this.receiverID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String adminID = "admin_1";
    final String currentUserID = isCaller ? adminID : receiverID;
    return ZegoUIKitPrebuiltCall(
      appID: 1139162131,
      appSign:
          "3699c15758ff0f0903bf250a8b0de2f9911e619d4fe89b8d9ae495b4dfb58b47",
      userID: currentUserID,
      userName: userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
