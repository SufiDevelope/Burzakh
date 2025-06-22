// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/case/presentation/page/information_for_supervisor_2.dart';
import 'package:burzakh/features/case/presentation/widgets/track_steps_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_drop_down.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widgets/custom_text_form.dart';

class TrackProgressScreen extends StatefulWidget {
  const TrackProgressScreen({super.key});

  @override
  State<TrackProgressScreen> createState() => _TrackProgressScreenState();
}

class _TrackProgressScreenState extends State<TrackProgressScreen> {
  TextEditingController burialTiming=TextEditingController();
  TextEditingController commentary=TextEditingController();
  TextEditingController citizen=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPrimary(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
            child: Column(
              children: [
                CustomTopBar(text: "Track progress"),
                SizedBox(height: commonTopMargin,),
                TrackStepsWidget(heading: 'Document upload', subheading: '25th April, 2025'),
                TrackStepsWidget(heading: 'Police review', subheading: '25th April, 2025',isCompleted: false,),
                // TrackStepsWidget(heading: 'Video call with authorities', subheading: '25th April, 2025',isCompleted: false,),
                TrackStepsWidget(heading: 'Issued police clearance', subheading: '25th April, 2025',isCompleted: false,),
                TrackStepsWidget(heading: 'Upload police clearance graveyard supervisor', subheading: '25th April, 2025',isCompleted: false,),
                TrackStepsWidget(heading: 'Graveyard Supervisor Approval', subheading: '25th April, 2025',isCompleted: false,isLast: true),
                // TrackStepsWidget(heading: 'CDA request sent', subheading: '25th April, 2025',isCompleted: false,),
                // TrackStepsWidget(heading: 'CDA request confirmed', subheading: '25th April, 2025',isCompleted: false,),
                // TrackStepsWidget(heading: 'RTA request sent', subheading: '25th April, 2025',isCompleted: false,),
                // TrackStepsWidget(heading: 'RTA request confirmed', subheading: '25th April, 2025',isLast: true,isCompleted: false,),
                // AppText(text: "This step helps the Graveyard Supervisor approve the burial request.",fontSize: heading3,color: AppColor.grey(),fontFamily: 'nr',),
                SizedBox(height: commonTopMargin,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
