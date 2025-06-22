import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Controller/rta_controller.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/rta_chat_widget.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/rta_header_widget.dart';
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
        backgroundColor: Color(0xFFa4313d),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getRtaRequestDetailsApi(widget.requestId);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Obx(() {
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
                  return Column(
                    children: [
                      SizedBox(
                        height: context.mh * 0.8,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.rtaDetailsModel.value.data?.length,
                            itemBuilder: (context, index) {
                              var data =
                                  controller.rtaDetailsModel.value.data?[index];
                              return RtaRequestDetailsWidget(
                                name:
                                    "${data?.user?.firstName} ${data?.user?.lastName}",
                                caseId: 'CASE Id: ${data?.id}',
                                submittedDate: DateFormat('MM dd, yyyy')
                                    .format((data?.createdAt is DateTime ? data?.createdAt as DateTime : DateTime.now())),
                                statusBadgeText: data?.status ?? '',
                                signText: data?.customTextForSign ?? '',
                                location: data?.locationOfHouse ?? '',
                                signCount: data?.signsRequired ?? "",
                                onApprove: () {
                                  controller.updateRtaRequestStatusApi(
                                      widget.requestId, "approve", context);
                                },
                                onReject: () {
                                  controller.updateRtaRequestStatusApi(
                                      widget.requestId, "reject", context);
                                },
                                onEdit: () {},
                                onOpenChat: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RtaChatView(
                                          userId: data?.user?.id ?? -1,
                                        ),
                                      ));
                                },
                                onMapTap: () {
                                  Uri url = Uri.parse(
                                      "https://www.google.com/maps/search/?api=1&query=${data?.locationOfHouse}");
                                  launchUrl(url);
                                },
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text("No Data"));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
