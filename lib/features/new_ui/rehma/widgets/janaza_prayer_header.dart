import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/AppColor.dart';
import '../../../../widgets/app_text.dart';
import 'hadees_section.dart';

class JanazaPrayerHeader extends StatelessWidget {
  const JanazaPrayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: .5, color: AppColor.darkYellow()),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Significance of the Janazah Prayer",
            fontFamily: 'ns',
            fontSize: context.mh * 0.016,
            color: AppColor.darkGreen,
          ),
          0.01.ph(context),
          AppText(
            text:
                "The Janazah prayer (صلاة الجنازة) is a communal obligation (fard kifayah) in Islam that offers tremendous spiritual rewards. This simple yet profound prayer consists of four takbirs with no bowing or prostration.",
            fontSize: context.mh * 0.014,
            fontFamily: 'n',
            fontWeight: FontWeight.w300,
          ),
          0.01.ph(context),
          HadeesSection(
            text1: "Prophet Muhammad ﷺ said:",
            text2:
                "\"Whoever attends the funeral until the prayer is offered will receive one qirat of reward, and whoever attends until the burial is completed will receive two qirats, each qirat being like the size of Mount Uhud.\"",
            text3: "(Bukhari)",
          ),
          0.01.ph(context),
          HadeesSection(
            text1: "Ibn Abbas reported:",
            text2:
                "\"If a Muslim dies and forty men who do not associate anything with Allah offer the funeral prayer for him, Allah will accept their intercession for him.\"",
            text3: "(Muslim)",
          ),
          0.01.ph(context),
          AppText(
            text: "The original Arabic of the second hadith:",
            fontSize: context.mh * 0.014,
            fontWeight: FontWeight.w200,
            fontFamily: '',
          ),
          0.01.ph(context),
          AppText(
            text:
                "ثبت في حديث ابن عباس عن النبي ﷺ أنه قال: ما من رجل مسلم يموت فيقوم على جنازته أربعون رجلاً لا يشركون بالله شيئًا إلا شفعهم الله فيه",
            fontSize: context.mh * 0.014,
            fontWeight: FontWeight.w100,
            fontFamily: '',
          ),
        ],
      ),
    );
  }
}
