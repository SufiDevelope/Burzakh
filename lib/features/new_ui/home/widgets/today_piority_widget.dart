// import 'package:burzakh/Extenshion/extenshion.dart';
// import 'package:burzakh/features/home/data/model/case_model.dart';
// import 'package:burzakh/widgets/under_construction_dialog.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/theme/AppColor.dart';
// import '../../../../widgets/app_text.dart';
// import '../../../../widgets/custom_button.dart';
// import '../ui/video_call_notification.dart';

// class TodayPiorityWidget extends StatelessWidget {
//   final homeCubit;
//   final CaseModel caseModel;
//   const TodayPiorityWidget({super.key, required this.homeCubit, required this.caseModel});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColor.white(),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(child: Icon(Icons.video_call_outlined,color: AppColor.darkBlue,),backgroundColor: AppColor.lightBlue,),

//               const SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     text: caseModel.additional_document,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                   const SizedBox(height: 4),
//                   AppText(
//                     text: 'Today at 4:30 PM',
//                     color: AppColor.greyLight(),
//                     fontSize: 12,
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 4, horizontal: 8),
//                 decoration: BoxDecoration(
//                   color: AppColor.lightOrange,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: AppText(
//                   text: 'Required',
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: AppColor.orange,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),
//           AppText(
//             text:
//             'Video verification with Dubai Police is required to complete your burial permit.',
//             fontSize: 13,
//             color: AppColor.greyLight(),
//           ),
//           const SizedBox(height: 12),
//           CustomElevatedButton(
//             fontSize: context.mh * 0.016,
//             text: 'Join Video Call',
//             bgColor: AppColor.buttonColor,
//             onPressed: () {
//               showDialog(context: context, builder: (context) => UnderConstructionDialog(),);
//               // Navigator.push(context, MaterialPageRoute(builder: (context) => VideoCallNotificationScreen(),));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/features/home/data/model/case_model.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Controller/police_admin_provider.dart';
import 'package:burzakh/widgets/under_construction_dialog.dart';
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
                  color: AppColor.white(),
                ),
                backgroundColor: AppColor.buttonColor,
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
                      color: AppColor.greyLight(),
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
              color: AppColor.greyLight(),
            ),
          if (hasPoliceClearance)
            AppText(
              text:
                  'Your Police Clearance Certificate is ready for download. Please save a copy for future reference.',
              fontSize: context.mh * 0.013,
              color: AppColor.greyLight(),
            ),
          if (!hasReleaseForm &&
              !hasPoliceClearance &&
              hasAdditionalDocRequired)
            Row(
              children: [
                AppText(
                  text:
                      'Admin has requested an additional document',
                  fontSize: context.mh * 0.014,
                  color: AppColor.greyLight(),
                ),
                AppText(
                  text:
                      ': ${caseModel.additional_document}',
                  fontSize: context.mh * 0.013,
                  maxLines: 3,
                  color: AppColor.greyLight(),
                ),
              ],
            ),

          const SizedBox(height: 12),

          // Buttons
          if (hasReleaseForm)
            CustomElevatedButton(
              fontSize: context.mh * 0.016,
              text: 'Download Release Form',
              bgColor: AppColor.buttonColor,
              onPressed: () {
                _downloadFile(caseModel.releaseForm);
              },
            ),
          if (hasPoliceClearance)
            CustomElevatedButton(
              fontSize: context.mh * 0.016,
              text: 'Download Police Clearance',
              bgColor: AppColor.buttonColor,
              onPressed: () {
                _downloadFile(caseModel.police_clearance!);
              },
            ),
          if (!hasReleaseForm &&
              !hasPoliceClearance &&
              hasAdditionalDocRequired)
            CustomElevatedButton(
              fontSize: context.mh * 0.016,
              text: 'Upload Document',
              bgColor: AppColor.buttonColor,
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
