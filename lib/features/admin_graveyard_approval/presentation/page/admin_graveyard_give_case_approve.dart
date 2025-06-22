// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/admin_graveyard_approval/presentation/widgets/burial_detail_widget.dart';
import 'package:burzakh/features/admin_graveyard_approval/presentation/widgets/document_uploaded_widget.dart';
import 'package:burzakh/features/admin_home/presentation/widgets/active_case_detail_widget.dart';
import 'package:burzakh/features/case/presentation/page/information_for_supervisor_1.dart';
import 'package:burzakh/features/case/presentation/page/track_progress_screen.dart';
import 'package:burzakh/features/case/presentation/widgets/document_for_graveyard_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/document_for_police_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/get_graveyard_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/is_completed_case_row.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/graveyard_progress_widget.dart';

class AdminGraveyardGiveCaseApprove extends StatelessWidget {
  AdminGraveyardGiveCaseApprove({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
            child: Column(
              children: [
                CustomTopBar(text: "Case",text1: " #2025-04-123456",),
                SizedBox(height: commonHeight,),
                BurialDetailWidget(citizen: "No", burialTime: "Dhuhr", commentary: "Al Qusais Cemetery"),
                SizedBox(height: commonHeight,),
                DocumentUploadedWidget(),
                SizedBox(height: commonHeightM1,),
                CustomElevatedButton(onPressed: (){}, text: "APPROVE",textColor: AppColor.white(),),
                SizedBox(height: commonTopMargin,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
