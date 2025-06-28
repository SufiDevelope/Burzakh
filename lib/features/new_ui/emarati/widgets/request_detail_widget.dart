import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/emirati_svcs/data/model/rta_get_model.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/rtaUpdateSignageDialog.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/update_cda_request_dialog.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di_container.dart';
import '../../../emirati_svcs/data/model/cda_get_model.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';

class RequestDetailWidget extends StatelessWidget {
  RequestDetailWidget({
    super.key,
    required this.isApproved,
    this.cdaGetModel,
    this.rtaGetModel,
    required this.id,
  });

  int isApproved;
  CdaGetModel? cdaGetModel;
  RtaGetModel? rtaGetModel;
  final String id;

  @override
  Widget build(BuildContext context) {
    String startDate;
    String endDate;

    if (cdaGetModel != null) {
      isApproved = cdaGetModel?.status == "Pending"
          ? 0
          : cdaGetModel!.status == "Rejected"
              ? 2
              : 1;
      startDate = DateFormat('MM dd, yyyy')
          .format(cdaGetModel?.mourningStartDate ?? DateTime.now());
      endDate = DateFormat('MM dd, yyyy')
          .format(cdaGetModel?.mourningEndDate ?? DateTime.now());
    } else {
      isApproved = rtaGetModel?.status == "Pending"
          ? 0
          : rtaGetModel!.status == "Rejected"
              ? 2
              : 1;
      startDate =
          DateFormat('MM dd, yyyy').format(rtaGetModel!.mourningStartDate);
      endDate = DateFormat('MM dd, yyyy')
          .format(rtaGetModel?.mourningEndDate ?? DateTime.now());
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: BlocBuilder(
        bloc: _emirateCubit,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: AppText(
                        text: "Mourning Tent Request",
                        fontSize: context.mh * 0.017,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black(),
                        fontFamily: 'ns',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      alignment: Alignment.topLeft,
                      child: AppText(
                        text:
                            "Case ID: BUR-${DateTime.now().year}-${cdaGetModel?.id ?? rtaGetModel?.id}",
                        fontSize: context.mh * 0.015,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[100],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Details",
                      fontSize: context.mh * 0.017,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black(),
                      fontFamily: 'nm',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      "Name:",
                      "${_authCubit.userModel!.firstName} ${_authCubit.userModel!.lastName}",
                      context,
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      "Location:",
                      cdaGetModel != null
                          ? cdaGetModel!.locationOfTent
                          : rtaGetModel!.locationOfHouse,
                      context,
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow("Start Date:", startDate, context),
                    const SizedBox(height: 12),
                    _buildDetailRow("End Date:", endDate, context),
                    const SizedBox(height: 12),
                    Visibility(
                      visible: cdaGetModel == null ? true : false,
                      child: _buildDetailRow(
                        "Time:",
                        cdaGetModel != null
                            ? cdaGetModel!.time
                            : rtaGetModel!.time,
                        context,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 112,
                          child: AppText(
                            text: "Status:",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500],
                            fontFamily: 'nm',
                          ),
                        ),
                        Expanded(
                          child: AppText(
                            text: isApproved == 1
                                ? 'Approved'
                                : isApproved == 2
                                    ? 'Rejected'
                                    : 'Pending',
                            fontSize: context.mh * 0.015,
                            fontWeight: FontWeight.w500,
                            color: isApproved == 1
                                ? const Color(0xFF2E7D32)
                                : isApproved == 2
                                    ? const Color(0xFFC62828)
                                    : const Color(0xFFB38000),
                            fontFamily: 'ns',
                          ),
                        ),
                      ],
                    ),
                    if (isApproved == 2) ...[
                      const SizedBox(height: 12),
                      _buildDetailRow(
                        "Rejection Reason:",
                        id == "CDA"
                            ? (cdaGetModel?.rejectedReason ?? "No Data")
                            : (rtaGetModel?.rejectedReason ?? ""),
                        context,
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppText(
                      text:
                          "Your request is being processed. You will be notified once it's approved.",
                      fontSize: 13,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(height: 16),
                    if (isApproved == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.buttonColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: AppText(
                              text: "Done",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white(),
                              fontFamily: 'ns',
                            ),
                          ),
                        ],
                      )
                    else if (isApproved == 2)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (cdaGetModel != null) {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  constraints: BoxConstraints(
                                      maxHeight: mdHeight(context) * 1),
                                  backgroundColor: Colors.transparent,
                                  barrierColor: AppColor.blurWhiteColor(),
                                  builder: (context) =>
                                      UpdateTentRequestSheet(),
                                );
                              } else {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  constraints: BoxConstraints(
                                      maxHeight: mdHeight(context) * 1),
                                  backgroundColor: Colors.transparent,
                                  barrierColor: AppColor.blurWhiteColor(),
                                  builder: (context) => UpdateSignAgeSheet(),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[700],
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: AppText(
                              text: "Update Service",
                              fontSize: context.mh * 0.015,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'ns',
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.buttonColor,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: AppText(
                              text: "Back to Services",
                              fontSize: context.mh * 0.015,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white(),
                              fontFamily: 'ns',
                            ),
                          ),
                        ],
                      )
                    else
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.buttonColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: AppText(
                          text: "Back to Services",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white(),
                          fontFamily: 'ns',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 112,
          child: AppText(
            text: label,
            fontSize: context.mh * 0.015,
            fontWeight: FontWeight.w500,
            color: Colors.grey[500],
            fontFamily: 'nm',
          ),
        ),
        Expanded(
          child: AppText(
            text: value,
            fontSize: context.mh * 0.015,
            color: AppColor.black(),
            fontFamily: 'nm',
          ),
        ),
      ],
    );
  }
}

// Injected cubits
var _authCubit = DiContainer().sl<AuthenticationCubit>();
var _emirateCubit = DiContainer().sl<EmirateSvcsCubit>();
