import 'package:burzakh/features/new_ui/rehma/widgets/frequent_questions.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/di_container.dart';
import '../../../../core/theme/AppColor.dart';
import '../../../home/presentation/controller/cubit.dart';

class FrequentlyAskedQuestion extends StatelessWidget {
  const FrequentlyAskedQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .5, color: AppColor.darkYellow())),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(text: "Frequently Asked Questions",fontFamily: 'ns',color: AppColor.darkGreen,fontSize: 16,),
            ],
          ),
          SizedBox(height: 13,),
          Divider(height: 1,color: AppColor.yellowDark,),
          SizedBox(height: 13,),
          FrequentQuestions(show:homeCubit.showTQuestion==1,onTap: () {
            homeCubit.getShowTQuestion(1);
          },text1: 'Can women attend and participate in Janazah prayers?', text2: 'Yes, women can attend and participate in Janazah prayers. While some cultural practices may discourage women\'s attendance, there is no prohibition in Islam. In fact, there are numerous narrations of women companions participating in funeral prayers during the Prophet\'s ﷺ time. However, local customs and facilities may vary, so it\'s advisable to check with the local mosque or funeral organizers.'),
          SizedBox(height: 13,),
          Divider(height: 1,color: AppColor.yellowDark,),
          SizedBox(height: 13,),
          FrequentQuestions(show:homeCubit.showTQuestion==2,onTap: () {
            homeCubit.getShowTQuestion(2);
          },text1: 'What if I join the Janazah prayer late and miss some takbirs?', text2:'If you join late, continue with the congregation from whichever takbir they are on. After the imam completes the prayer with tasleem, you should complete the takbirs you missed. For each missed takbir, recite "Allahu Akbar" and perform the corresponding action (recite Al-Fatihah for the first takbir, salawat for the second, etc.). There\'s no need to recite Al-Fatihah again if you\'ve already recited it with the congregation'),
        SizedBox(height: 13,),
          Divider(height: 1,color: AppColor.yellowDark,),
          SizedBox(height: 13,),
          FrequentQuestions(show:homeCubit.showTQuestion==3,onTap: () {
            homeCubit.getShowTQuestion(3);
          },text1: 'Is it necessary to perform wudu (ablution) before Janazah prayer?', text2:'Yes, wudu (ablution) is required for Janazah prayer as it is for any other prayer. Being in a state of ritual purity is a prerequisite for all prayers in Islam. If someone doesn\'t have wudu and cannot perform it in time, they should make tayammum (dry ablution) if possible, rather than missing the prayer.',),
          SizedBox(height: 13,),
          Divider(height: 1,color: AppColor.yellowDark,),
          SizedBox(height: 13,),
          FrequentQuestions(show:homeCubit.showTQuestion==4,onTap: () {
            homeCubit.getShowTQuestion(4);
          },text1: 'Can Janazah prayer be performed at any time of day?', text2:'Unlike regular prayers, Janazah prayer can generally be performed at any time of day, including times when regular prayers are not performed (such as sunrise, when the sun is at its zenith, and sunset). This flexibility exists because the Janazah prayer is a response to the event of death and should not be unnecessarily delayed. However, some scholars recommend avoiding the three specifically disliked times for prayer if possible',),

          SizedBox(height: 13,),
          Divider(height: 1,color: AppColor.yellowDark,),
          SizedBox(height: 13,),
          FrequentQuestions(show:homeCubit.showTQuestion==5,onTap: () {
            homeCubit.getShowTQuestion(5);
          },text1: 'What is the ruling on performing Janazah prayer for someone who has already been buried?', text2:'It is permissible to perform Janazah prayer for someone who has already been buried, especially if they were buried without Janazah prayer being performed. This is known as Salat al-Gha\'ib (prayer for the absent) or prayer at the grave. According to most scholars, this can be done up to one month after burial, while some allow it for longer periods. The Prophet ﷺ himself prayed over graves on several occasions',),

        ],
      ),
    );
  }
}


var homeCubit=DiContainer().sl<HomeCubit>();

