import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/frequently_asked_question.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/hadees_section.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/janaza_prayer_header.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/janaza_step_1.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/janaza_step_5.dart';
import 'package:burzakh/features/new_ui/rehma/widgets/janaza_video_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/app/di_container.dart';
import '../../../../widgets/app_text.dart';
import '../../../home/presentation/controller/cubit.dart';
import '../../islamic_education/ui/dua_screen.dart';
import '../widgets/janaza_step_2.dart';
import '../widgets/janaza_step_3.dart';
import '../widgets/janaza_step_4.dart';

class JanazaPrayerGuide extends StatelessWidget {
  const JanazaPrayerGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColor.bgGradient),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFE8F3F0),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFF1A4D3D),
                size: 20,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Janazah Prayer Guide',
                color: AppColors.primary,
                fontSize: context.mh * 0.02,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
                fontFamily: 'ns',
              ),
              AppText(
                text: 'صلاة الجنازة',
                fontSize: context.mh * 0.015,
                color: AppColors.textLight,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocBuilder(
            bloc: homeCubit,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        // value: step / 5,
                        value: homeCubit.completedJanazaSteps / 5,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.grey[300],
                        color: AppColor.darkGreen,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText(
                            text: "${homeCubit.completedJanazaSteps}/5",
                            fontSize: context.mh * 0.012,
                            fontFamily: 'ni',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      0.01.ph(context),
                      JanazaPrayerHeader(),
                       0.01.ph(context),
                      JanazaVideoSection(),
                       0.01.ph(context),
                      JanazaStep1(
                        isSelected: homeCubit.showTab == 1 ? true : false,
                        isCompleted:
                            homeCubit.completedJanazaSteps > 0 ? true : false,
                      ),
                       0.01.ph(context),
                      JanazaStep2(
                        isSelected: homeCubit.showTab == 2 ? true : false,
                        isCompleted:
                            homeCubit.completedJanazaSteps > 1 ? true : false,
                      ),
                       0.01.ph(context),
                      JanazaStep3(
                        isSelected: homeCubit.showTab == 3 ? true : false,
                        isCompleted:
                            homeCubit.completedJanazaSteps > 2 ? true : false,
                      ),
                       0.01.ph(context),
                      JanazaStep4(
                        isSelected: homeCubit.showTab == 4 ? true : false,
                        isCompleted:
                            homeCubit.completedJanazaSteps > 3 ? true : false,
                      ),
                       0.01.ph(context),
                      JanazaStep5(
                        isSelected: homeCubit.showTab == 5 ? true : false,
                        isCompleted:
                            homeCubit.completedJanazaSteps > 4 ? true : false,
                      ),
                      0.01.ph(context),
                      FrequentlyAskedQuestion(),
                       0.03.ph(context),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

var homeCubit = DiContainer().sl<HomeCubit>();
