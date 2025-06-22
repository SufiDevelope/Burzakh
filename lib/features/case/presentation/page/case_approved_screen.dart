// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/case/presentation/page/information_for_supervisor_1.dart';
import 'package:burzakh/features/case/presentation/page/track_progress_screen.dart';
import 'package:burzakh/features/case/presentation/widgets/document_for_graveyard_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/document_for_police_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/get_graveyard_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/is_completed_case_row.dart';
import 'package:burzakh/features/home/data/model/case_model.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di_container.dart';
import '../../../home/presentation/controller/cubit.dart';
import '../widgets/case_detail_shimmer.dart';

class CaseApprovedScreen extends StatefulWidget {
   CaseApprovedScreen({super.key,required this.caseModel});
CaseModel caseModel;
  @override
  State<CaseApprovedScreen> createState() => _CaseApprovedScreenState();
}

class _CaseApprovedScreenState extends State<CaseApprovedScreen> {
  bool isCompleted=false;
  int caseNumber=0;
  @override
  void initState() {
    isCompleted=widget.caseModel.caseStatus!="pending";
    caseNumber=widget.caseModel.caseName;
    _homeCubit.getCaseDetails(widget.caseModel.id.toString());
    _homeCubit.getCaseGraveyardDetails(widget.caseModel.id.toString());
    super.initState();
  }

  @override
  void dispose() {
    _homeCubit.caseDetailModel=null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPrimary(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
            child: BlocBuilder(
              bloc: _homeCubit,
              builder: (context,state) {
                return Column(
                  children: [
                    CustomTopBar(text: "${"Case".tr()} $caseNumber"),
                    SizedBox(height: commonTopMargin,),
                    IsCompletedCaseRow(caseNumber: caseNumber,isCompleted: isCompleted,),
                    _homeCubit.isFetchingCaseDetail && _homeCubit.caseDetailModel==null?CaseDetailShimmer():DocumentForPoliceApproval(model:_homeCubit.caseDetailModel! ,),
                    // DocumentForGraveyardApproval(),
                    _homeCubit.isFetchingCaseGraveyardDetail?CaseDetailShimmer(): _homeCubit.graveyardCaseProcessModel!=null?  DocumentForGraveyardApproval(model: _homeCubit.graveyardCaseProcessModel!):GetGraveyardApproval(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InformationForSupervisor1(),));
                      },
                    ),
                    SizedBox(height: commonHeightL,),
                    CustomElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TrackProgressScreen(),));
                    }, text: "Track progress",width: 190,radius: 50,showBorder: true,bgColor: AppColor.white(),textColor: AppColor.primary(),),
                    SizedBox(height: commonTopMargin,),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
var _homeCubit=DiContainer().sl<HomeCubit>();
