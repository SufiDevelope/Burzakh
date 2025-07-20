import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/features/home/data/model/case_model.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_button.dart';

class TodayPiorityWidget extends StatelessWidget {
  final homeCubit;
  final CaseModel caseModel;
  const TodayPiorityWidget(
      {super.key, required this.homeCubit, required this.caseModel});

  // Function to download files
  Future<void> _downloadFile(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PoliceAdminController());

    bool hasReleaseForm = caseModel.releaseForm.isNotEmpty;

    bool hasPoliceClearance = caseModel.police_clearance.isNotEmpty;

    bool hasAdditionalDocRequired = caseModel.additional_document.isNotEmpty;

    log(hasAdditionalDocRequired.toString());

    if (!hasReleaseForm && !hasAdditionalDocRequired && !hasPoliceClearance) {
      return Container(
        alignment: Alignment.topLeft,
        width: mdWidth(context) * 1,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            AppText(
              text:
                  "You have no pending actions today.\nYour priorities will appear here after you register a case.",
              fontSize: context.mh * 0.015,
              color: AppColor.greyLight(),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                child: Icon(
                  hasReleaseForm || hasPoliceClearance
                      ? Icons.download_outlined
                      : Icons.upload_file_outlined,
                  color: Color(0xffad8443),
                ),
                backgroundColor: Color(0xfff7f1e8),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                          text: hasReleaseForm
                              ? 'Release Form Available'
                              : hasPoliceClearance
                                  ? 'Police Clearance Available'
                                  : 'Additional Document Required',
                          fontWeight: FontWeight.bold,
                          fontSize: context.mh * 0.016,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: hasReleaseForm || hasPoliceClearance
                          ? 'Ready for download'
                          : 'Upload required document',
                      color: Color(0xff6a655d),
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Description
          if (hasReleaseForm)
            AppText(
              text:
                  'Your release form is ready for download. Please download and keep it safe.',
              fontSize: context.mh * 0.013,
              color: Color(0xff6a655d),
            ),
          if (hasPoliceClearance)
            AppText(
              text:
                  'Your Police Clearance Certificate is ready for download. Please save a copy for future reference.',
              fontSize: context.mh * 0.013,
              color: Color(0xff6a655d),
            ),
          if (!hasReleaseForm &&
              !hasPoliceClearance &&
              hasAdditionalDocRequired)
            Row(
              children: [
                AppText(
                  text: 'Admin has requested an additional document',
                  fontSize: context.mh * 0.014,
                  color: Color(0xff6a655d),
                ),
                AppText(
                  text: ': ${caseModel.additional_document}',
                  fontSize: context.mh * 0.013,
                  maxLines: 3,
                  color: Color(0xff6a655d),
                ),
              ],
            ),

          const SizedBox(height: 12),

          // Buttons
          if (hasReleaseForm)
            CustomElevatedButton(
              fontSize: context.mh * 0.016,
              text: 'Download Release Form',
              bgColor: Color(0xffc29118),
              onPressed: () {
                _downloadFile(caseModel.releaseForm);
              },
            ),
          if (hasPoliceClearance)
            CustomElevatedButton(
              fontSize: context.mh * 0.016,
              text: 'Download Police Clearance',
              bgColor: Color(0xffc29118),
              onPressed: () {
                _downloadFile(caseModel.police_clearance!);
              },
            ),
          0.01.ph(context),
          caseModel.burial_submission_status == "Pending"
              ? AppText(
                  text: 'Please Continue With The Burial Process.',
                  fontSize: context.mh * 0.015,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffad8443),
                )
              : Text(""),
          if (!hasReleaseForm &&
              !hasPoliceClearance &&
              hasAdditionalDocRequired)
            CustomElevatedButton(
              fontSize: context.mh * 0.016,
              text: 'Upload Document',
              bgColor: Color(0xffc29118),
              onPressed: () {
                controller.pickImageUploadUser(
                    caseModel.id, caseModel.userId, context);
                homeCubit.getUserCases();
              },
            ),
        ],
      ),
    );
  }
}
