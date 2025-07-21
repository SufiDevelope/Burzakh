// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/new_ui/home/ui/burrial_process_detail.dart';
import 'package:flutter/material.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app/di_container.dart';
import '../../../home/presentation/controller/cubit.dart';

class DocumnetProgressCaseDetails extends StatefulWidget {
  DocumnetProgressCaseDetails({super.key, required this.caseId});
  String caseId;
  @override
  State<DocumnetProgressCaseDetails> createState() =>
      _DocumnetProgressCaseDetailsState();
}

class _DocumnetProgressCaseDetailsState
    extends State<DocumnetProgressCaseDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeCubit.getCaseDetails(widget.caseId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    return Container(
      decoration: BoxDecoration(gradient: AppColor.bgGradient),
      child: BlocBuilder(
          bloc: _homeCubit,
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                title: AppText(
                  text: "Documents & Progress",
                  fontWeight: FontWeight.bold,
                  fontSize: context.mh * 0.020,
                  color: AppColor.black(),
                ),
              ),
              body: _homeCubit.isFetchingCaseDetail
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColor.buttonColor,
                      ),
                    )
                  : Container(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          return _homeCubit.getCaseDetails(widget.caseId);
                        },
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white(),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      )
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "Required Documents",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: AppColor.black(),
                                      ),
                                      const SizedBox(height: 20),
                                      _documentItem(
                                        "Death Notification",
                                        _homeCubit.caseDetailModel?.caseStatus
                                                .toString() ??
                                            "",
                                        Icons.description,
                                        _homeCubit.caseDetailModel
                                                    ?.deathNotificationFileStatus ==
                                                "completed"
                                            ? AppColor.lightGreen1
                                            : AppColor.lightOrange1,
                                        _homeCubit.caseDetailModel
                                                    ?.deathNotificationFileStatus ==
                                                "completed"
                                            ? AppColor.green()
                                            : AppColor.orange,
                                      ),
                                      const SizedBox(height: 12),
                                      _documentItem(
                                        "Hospital Report",
                                        _homeCubit.caseDetailModel?.caseStatus
                                                .toString() ??
                                            "",
                                        Icons.local_hospital,
                                        _homeCubit.caseDetailModel
                                                    ?.hospitalCertificateStatus ==
                                                "completed"
                                            ? AppColor.lightGreen1
                                            : AppColor.lightOrange1,
                                        _homeCubit.caseDetailModel
                                                    ?.hospitalCertificateStatus ==
                                                "completed"
                                            ? AppColor.green()
                                            : AppColor.orange,
                                      ),
                                      const SizedBox(height: 12),
                                      _documentItem(
                                        "EID & Passport",
                                        _homeCubit.caseDetailModel?.caseStatus
                                                .toString() ??
                                            "",
                                        Icons.badge,
                                        (_homeCubit.caseDetailModel
                                                        ?.passportOrEmirateIdFrontStatus ==
                                                    "completed" &&
                                                _homeCubit.caseDetailModel
                                                        ?.passportOrEmirateIdBackStatus ==
                                                    "completed")
                                            ? AppColor.lightGreen1
                                            : AppColor.lightOrange1,
                                        (_homeCubit.caseDetailModel
                                                        ?.passportOrEmirateIdFrontStatus ==
                                                    "completed" &&
                                                _homeCubit.caseDetailModel
                                                        ?.passportOrEmirateIdBackStatus ==
                                                    "completed")
                                            ? AppColor.green()
                                            : AppColor.orange,
                                      ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   children: [
                                      //     SvgPicture.asset(AppAssets.uploadIcon,color: AppColor.blue,),
                                      //     SizedBox(width: 5,),
                                      //     AppText(
                                      //       text: "Emirates ID",
                                      //       color: AppColor.blue,
                                      //       fontSize: 13,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //
                                      //     Container(margin: EdgeInsets.symmetric(horizontal: 10),width: .5,height: 30,color: AppColor.greyLight1(),),
                                      //     SvgPicture.asset(AppAssets.uploadIcon,color: AppColor.blue,),
                                      //     SizedBox(width: 5,),
                                      //     AppText(
                                      //       text: "Passport",
                                      //       color: AppColor.blue,
                                      //       fontSize: 13,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ],
                                      // ),
                                      const SizedBox(height: 12),
                                      _documentItem(
                                          "Police Clearance",
                                          _homeCubit.caseDetailModel?.caseStatus
                                                  .toString() ??
                                              "",
                                          Icons.security,
                                          AppColor.lightOrange1,
                                          AppColor.orange,
                                          subtitle: "Dubai Police"),
                                      const SizedBox(height: 6),
                                      Visibility(
                                        visible: _homeCubit
                                                    .caseDetailModel?.caseStatus
                                                    .toString() ==
                                                "approved"
                                            ? true
                                            : false,
                                        child: InkWell(
                                          onTap: () {
                                            _downloadFile(_homeCubit
                                                    .caseDetailModel
                                                    ?.policeClearance ??
                                                "");
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.download_outlined,
                                                  color: AppColor.blue),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              AppText(
                                                text:
                                                    "Download Police Clearance",
                                                color: AppColor.blue,
                                                fontSize: context.mh * 0.011,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      _documentItem(
                                        "Burial Permit",
                                        _homeCubit.caseDetailModel?.caseStatus
                                                    .toString() ==
                                                "approved"
                                            ? _homeCubit.caseDetailModel
                                                    ?.burial_submission_status
                                                    .toString() ??
                                                ""
                                            : "Not Started",
                                        _homeCubit.caseDetailModel?.caseStatus
                                                    .toString() ==
                                                "approved"
                                            ? Icons.check_circle
                                            : Icons.lock,
                                        _homeCubit.caseDetailModel?.caseStatus
                                                    .toString() ==
                                                "approved"
                                            ? AppColor.lightGreen1
                                            : AppColor.grey().withOpacity(0.1),
                                        _homeCubit.caseDetailModel?.caseStatus
                                                    .toString() ==
                                                "approved"
                                            ? AppColor.green()
                                            : AppColor.grey(),
                                        subtitle: "Dubai Municipality",
                                      ),
                                      0.01.ph(context),
                                      Visibility(
                                        visible: _homeCubit.caseDetailModel
                                                        ?.burial_submission_status ==
                                                    "Pending" &&
                                                _homeCubit.caseDetailModel
                                                        ?.caseStatus ==
                                                    "approved"
                                            ? true
                                            : false,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BurrialProcessDetail(
                                                  caseName: _homeCubit
                                                          .caseDetailModel
                                                          ?.name_of_deceased
                                                          .toString() ??
                                                      "",
                                                  userid: _homeCubit
                                                          .caseDetailModel
                                                          ?.user_id
                                                          .toString() ??
                                                      "",
                                                  caseid: widget.caseId,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: context.mh * 0.05,
                                            width: context.mw,
                                            decoration: BoxDecoration(
                                              color: AppColor.buttonColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: AppText(
                                                text:
                                                    "+ Start Burial Permit Process",
                                                color: AppColor.white(),
                                                fontSize: context.mh * 0.014,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.white(),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      )
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// Header Row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            text: "Case Process",
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: AppColor.grey()
                                                  .withOpacity(.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: AppText(
                                              text: _homeCubit.caseDetailModel
                                                      ?.caseStatus
                                                      .toString() ??
                                                  "",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.grey(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),

                                      /// Step 1 - Death Notification
                                      _buildStepItem(
                                        // icon: Icons.check_circle,
                                        // iconColor: AppColor.darkGreen,
                                        icon: Icons.error_outline,
                                        iconColor: AppColor.yellow(),
                                        title: "Death Notification",
                                        subtitle:
                                            "Document verified and approved by authorities",
                                        statusText: _homeCubit.caseDetailModel
                                                ?.deathNotificationFileStatus
                                                .toString() ??
                                            "",
                                        statusTextColor: AppColor.grey(),
                                        statusColor:
                                            AppColor.grey().withOpacity(.1),
                                      ),

                                      /// Step 2 - Hospital Report
                                      _buildStepItem(
                                        icon: Icons.error_outline,
                                        iconColor: AppColor.yellow(),
                                        title: "Hospital Report",
                                        subtitle:
                                            "Medical documentation verified",
                                        statusText: _homeCubit.caseDetailModel
                                                ?.hospitalCertificateStatus
                                                .toString() ??
                                            "",
                                        statusTextColor: AppColor.grey(),
                                        statusColor:
                                            AppColor.grey().withOpacity(.1),
                                      ),

                                      /// Step 3 - EID & Passport
                                      _buildStepItem(
                                        icon: Icons.error_outline,
                                        iconColor: AppColor.yellow(),
                                        title: "EID & Passport",
                                        subtitle:
                                            "Required for identity verification",
                                        statusText: _homeCubit.caseDetailModel
                                                ?.passportOrEmirateIdFrontStatus
                                                .toString() ??
                                            "",
                                        statusTextColor: AppColor.grey(),
                                        statusColor:
                                            AppColor.grey().withOpacity(.1),
                                      ),

                                      /// Step 4 - Police Verification
                                      _buildStepItem(
                                        icon: Icons.error_outline,
                                        iconColor: AppColor.yellow(),
                                        title: "Police Verification",
                                        subtitle:
                                            "Required video call with Dubai Police officer",
                                        statusText: _homeCubit.caseDetailModel
                                                ?.passportOrEmirateIdFrontStatus
                                                .toString() ??
                                            "",
                                        statusTextColor: AppColor.grey(),
                                        statusColor:
                                            AppColor.grey().withOpacity(.1),
                                      ),

                                      /// Step 5 - Burial Permit
                                      _buildStepItem(
                                        iconColor: AppColor.greyLight(),
                                        title: "Burial Permit",
                                        burialPermitText: '5',
                                        subtitle:
                                            "Issued after police verification is complete",
                                        statusText: _homeCubit.caseDetailModel
                                                ?.burial_submission_status ??
                                            '',
                                        statusTextColor: AppColor.grey(),
                                        statusColor:
                                            AppColor.grey().withOpacity(.1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: AppColor.white(),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      AppText(
                                        text:
                                            "\"O reassured soul, return to your Lord,\nwell-pleased and pleasing [to Him]. Enter among My servants, and enter My\n Paradise.\"",
                                        textAlign: TextAlign.center,
                                        color: AppColor.grey(),
                                        fontFamily: 'ni',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      AppText(
                                        text: "— Surah Al-Fajr 89:27-30",
                                        textAlign: TextAlign.center,
                                        color: AppColor.greyLight1(),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          }),
    );
  }

  /// Reusable Document Item
  Widget _documentItem(String title, String status, IconData icon,
      Color bgColor, Color statusColor,
      {String? subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: statusColor.withOpacity(0.1)),
              child: Icon(icon, color: statusColor.withOpacity(.5))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black(),
                ),
                if (subtitle != null)
                  AppText(
                    text: subtitle,
                    fontSize: 12,
                    color: AppColor.grey(),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(7),
            ),
            child: AppText(
              text: status,
              fontSize: 12,
              color: statusColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStepItem({
    IconData? icon,
    String? burialPermitText,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String statusText,
    required Color statusTextColor,
    required Color statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Icon and line
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: burialPermitText != null
                            ? iconColor.withOpacity(.2)
                            : iconColor,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: burialPermitText != null ? 1.5 : 0,
                            color: burialPermitText != null
                                ? iconColor
                                : Colors.white)),
                    width: 40,
                    alignment: Alignment.center,
                    height: 30,
                    child: icon != null
                        ? Icon(icon, color: Colors.white, size: 20)
                        : AppText(text: burialPermitText ?? "")),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    child: Column(
                      children: [],
                    ),
                    color: AppColor.greyLight1(),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),

            /// Text content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: title,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: subtitle,
                    fontSize: 13,
                    color: AppColor.grey(),
                  ),
                  if (statusText.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: AppText(
                        text: statusText,
                        fontSize: 12,
                        color: statusTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var _homeCubit = DiContainer().sl<HomeCubit>();
