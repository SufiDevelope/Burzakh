import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/rta_chat_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/reject_reason_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/rta_request_details_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RtaRequestDetailView extends StatefulWidget {
  final int requestId;
  const RtaRequestDetailView({super.key, required this.requestId});

  @override
  State<RtaRequestDetailView> createState() => _RtaRequestDetailViewState();
}

class _RtaRequestDetailViewState extends State<RtaRequestDetailView> {
  final controller = Get.put(RtaController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getRtaRequestDetailsApi(widget.requestId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request Details',
          style: TextStyle(fontSize: context.mh * 0.018, color: Colors.white),
        ),
        backgroundColor: Color(0xFFbd4753),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getRtaRequestDetailsApi(widget.requestId);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Obx(
                () {
                  if (controller.rxRequestStatusForRtaRequestDetails.value ==
                      Status.loading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        0.4.ph(context),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    );
                  } else if (controller
                          .rxRequestStatusForRtaRequestDetails.value ==
                      Status.error) {
                    return const Center(child: Text("Error"));
                  } else if (controller
                          .rxRequestStatusForRtaRequestDetails.value ==
                      Status.completed) {
                    final dataList =
                        controller.rtaDetailsModel.value.data ?? [];

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Keep outer scroll
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        var data = dataList[index];
                        log("${data.caseDetail?[index].policeClearance}");
                        return RtaRequestDetailsWidget(
                          statusBadgeText: data.status ?? "",
                          name:
                              "${data.user?.firstName} ${data.user?.lastName}",
                          caseId: "brz#${data.id ?? ""}",
                          submittedDate: DateFormat('yyyy-MM-dd').format(
                            DateTime.parse(data.createdAt ??
                                DateTime.now().toIso8601String()),
                          ),
                          email: data.user?.email ?? "",
                          phoneNumber: data.user?.phoneNumber ?? "",
                          signText: data.customTextForSign ?? "",
                          location: data.locationOfHouse ?? "",
                          onApprove: () {
                            controller.updateRtaRequestStatusApi(
                                widget.requestId, "approve", context, null);
                          },
                          onReject: () {
                            RejectReasonDialog.show(context, Color(0xFFbd4753),
                                onSend: (body) {
                              controller.updateRtaRequestStatusApi(
                                  widget.requestId, "reject", context, body);
                            });
                          },
                          onEdit: () {},
                          onOpenChat: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RtaChatView(
                                    userId: data.user?.id ?? -1,
                                    deviceToken: data.user?.token ?? "",
                                  ),
                                ));
                          },
                          onMapTap: () {
                            Uri url = Uri.parse(
                                "https://www.google.com/maps/search/?api=1&query=${data.locationOfHouse}");
                            launchUrl(url);
                          },
                          nameOfDeceased:
                              data.caseDetail?[index].nameOfDeceased ?? "",
                          dateOfDeath:
                              data.caseDetail?[index].dateOfDeath ?? "",
                          policeClassificationUrl:
                              data.caseDetail?[index].policeClearance ?? "",
                          deathNotificationFileUrl:
                              data.caseDetail?[index].deathNotificationFile ??
                                  "",
                          hospitalCertificateUrl:
                              data.caseDetail?[index].hospitalCertificate ?? "",
                          passportOrEmirateIdFrontUrl: data.caseDetail?[index]
                                  .passportOrEmirateIdFront ??
                              "",
                          passportOrEmirateIdBackUrl:
                              data.caseDetail?[index].passportOrEmirateIdBack ??
                                  "",
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text("No Data"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
