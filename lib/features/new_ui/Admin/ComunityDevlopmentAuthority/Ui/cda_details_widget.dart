import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Controller/cda_controller.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Ui/cda_chat_view.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Widgets/cda_admin_header_widget.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Widgets/cda_details_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CdaRequestDetailView extends StatefulWidget {
  final int requestId;
  const CdaRequestDetailView({super.key, required this.requestId});

  @override
  State<CdaRequestDetailView> createState() => _CdaRequestDetailViewState();
}

class _CdaRequestDetailViewState extends State<CdaRequestDetailView> {
  final controller = Get.put(CdaController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCdaRequestDetailsApi(
        widget.requestId,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request Details',
          style: TextStyle(
            fontSize: context.mh * 0.018,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF1e40af),
      ),
      body: SingleChildScrollView(
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
              } else if (controller.rxRequestStatusForRtaRequestDetails.value ==
                  Status.error) {
                return const Center(child: Text("Error"));
              } else if (controller.rxRequestStatusForRtaRequestDetails.value ==
                  Status.completed) {
                return Column(
                  children: [
                    SizedBox(
                      height: context.mh * 0.8,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              controller.cdaDetailsModel.value.data?.length,
                          itemBuilder: (context, index) {
                            var data =
                                controller.cdaDetailsModel.value.data?[index];
                            return CdaRequestDetailsWidget(
                              name:
                                  "${data?.user?.firstName} ${data?.user?.lastName}",
                              caseId: 'CASE Id: ${data?.id}',
                              submittedDate: DateFormat('yyyy-MM-dd').format(
                                  DateTime.parse(data?.createdAt ??
                                      DateTime.now().toIso8601String())),
                              statusBadgeText: data?.status ?? '',
                              onApprove: () {
                                controller.updateCdaRequestStatusApi(
                                    widget.requestId, "approve", context);
                              },
                              onReject: () {
                                controller.updateCdaRequestStatusApi(
                                    widget.requestId, "reject", context);
                              },
                              onEdit: () {},
                              onOpenChat: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CdaChatView(
                                        userId: data?.user?.id ?? -1,
                                      ),
                                    ));
                              },
                              onMapTap: () {
                                Uri url = Uri.parse(
                                    "https://www.google.com/maps/search/?api=1&query=${data?.locationOfTent}");
                                launchUrl(url);
                              },
                              signText: '',
                              location: data?.locationOfTent ?? '',
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
    );
  }

  var documentCubit = DiContainer().sl<HomeCubit>();
}
