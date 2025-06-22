// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
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

class ActiveCaseScreen extends StatelessWidget {
  ActiveCaseScreen({super.key});

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
                CustomTopBar(text: "Active Cases"),
                SizedBox(height: commonTopMargin,),
                ActiveCaseDetailWidget(name: "Ahmed Al Mansoori", id: "2025-04-123456", stage: "Police Review ", status: 0),
                ActiveCaseDetailWidget(name: "Ahmed Al Mansoori", id: "2025-04-123456", stage: "Police Review ", status: 1),
                SizedBox(height: commonTopMargin,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
