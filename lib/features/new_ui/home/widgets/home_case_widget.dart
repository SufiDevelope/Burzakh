// ignore_for_file: must_be_immutable

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/features/home/data/model/case_model.dart';
import 'package:burzakh/features/new_ui/home/ui/documnet_progress_case_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_assets.dart';
import '../../../../core/app/di_container.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_button.dart';
import '../../../authentication/presentation/controller/cubit.dart';

class HomeCaseWidget extends StatefulWidget {
  HomeCaseWidget({super.key, required this.caseModel});
  CaseModel caseModel;

  @override
  State<HomeCaseWidget> createState() => _HomeCaseWidgetState();
}

class _HomeCaseWidgetState extends State<HomeCaseWidget> {
  int step = 0;
  @override
  void initState() {
    if (widget.caseModel.passportOrEmirateIdFrontStatus == "completed" &&
        widget.caseModel.passportOrEmirateIdBackStatus == "completed") {
      step = step + 1;
    }
    if (widget.caseModel.hospitalCertificateStatus == "completed") {
      step = step + 1;
    }
    if (widget.caseModel.deathNotificationFileStatus == "completed") {
      step = step + 1;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.file_present,
                size: 25,
                color: AppColor.grey(),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text:
                        '${'Case:'.tr()} ${widget.caseModel.name_of_deceased}',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  AppText(
                    text: 'Case in process',
                    color: Color(0xff6a655d),
                  ),
                ],
              ),
            ],
          ),
          0.012.ph(context),
          Row(
            children: [
              AppText(
                text: 'Case Progress',
                fontSize: 12,
                color: Color(0xff6a655d),
              ),
              const Spacer(),
              AppText(
                text:
                    '${(double.tryParse(widget.caseModel.ratio)!.clamp(0, 1) * 5).round()} ${'of'.tr()} 5',
                fontSize: 12,
                color: Color(0xffaf8646),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: double.parse(widget.caseModel.ratio),
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.grey[300],
            color: Color(0xffaf8646),
          ),
          const SizedBox(height: 12),
          CustomElevatedButton(
            fontSize: context.mh * 0.016,
            text: 'Follow up Service',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumnetProgressCaseDetails(
                        caseId: widget.caseModel.id.toString()),
                  ));
            },
            iconColor: Colors.white,
            icon: AppAssets.clockIcon,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

var authCubit = DiContainer().sl<AuthenticationCubit>();
