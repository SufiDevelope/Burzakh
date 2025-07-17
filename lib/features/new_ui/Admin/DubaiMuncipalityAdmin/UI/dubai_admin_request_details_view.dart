import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_chat_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/assign_grave_dialog_widget.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Widget/dubai_request_details_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../Controller/dubai_controller.dart';

class DubaiAdminRequestDetailsView extends StatelessWidget {
  final DubaiMuncipalityReqestData model;
  const DubaiAdminRequestDetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DubaiController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: dashboardcolor,
        title: Text(
          'Request Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.mh * 0.02,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            DubaiRequestDetailWidget(
              name:
                  "${model.user?.firstName ?? ""} ${model.user?.lastName ?? ""}",
              relative: '',
              caseId: 'BUR-${DateTime.now().year}-${model.id ?? ""}',
              status: model.status ?? "",
              burialDate: DateFormat('yyyy-MM-dd').format(
                DateTime.parse(
                  model.createdAt ?? DateTime.now().toIso8601String(),
                ),
              ),
              prayerTime: model.burialTiming ?? "",
              cemetery: model.preferredCemetery ?? "",
              requesterName:
                  '${model.user?.firstName ?? ""} ${model.user?.lastName ?? ""}',
              phoneNo: model.user?.phoneNumber ?? "",
              onAssignGrave: () {
                showAssignGraveDialog(
                  context,
                  cemetery: model.preferredCemetery ?? "",
                  onAssign: (graveNumber) {
                    log(graveNumber);
                    controller.assignGraveApi(
                        model.id ?? -1, graveNumber, context, false);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                );
              },
              onOpenChat: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DubaiChatView(
                      userId: model.user?.id ?? -1,
                      deviceToken: model.user?.deviceToken ?? '',
                    ),
                  ),
                );
              },
              deathNotificationFileUrl:
                  model.caseDetails?.first.deathNotificationFile == null
                      ? null
                      : model.caseDetails?.first.deathNotificationFile ?? '',
              policeClassificationUrl:
                  model.caseDetails?.first.policeClearance == null
                      ? null
                      : model.caseDetails?.first.policeClearance ?? '',
              hospitalCertificateUrl:
                  model.caseDetails?.first.hospitalCertificate == null
                      ? null
                      : model.caseDetails?.first.hospitalCertificate ?? '',
              passportOrEmirateIdFrontUrl:
                  model.caseDetails?.first.passportOrEmirateIdFront == null
                      ? null
                      : model.caseDetails?.first.passportOrEmirateIdFront ?? '',
              passportOrEmirateIdBackUrl:
                  model.caseDetails?.first.passportOrEmirateIdBack == null
                      ? null
                      : model.caseDetails?.first.passportOrEmirateIdBack ?? '',
              releaseFormUrl: model.caseDetails?.first.releaseForm == null
                  ? null
                  : model.caseDetails?.first.releaseForm ?? '',
              onApprove: () {
                controller.approveGraveApi(model.id ?? -1, context, true);
              },
            ),
            0.02.ph(context),
          ],
        ),
      ),
    );
  }
}
