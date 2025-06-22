// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../home/presentation/controller/cubit.dart';

class JanazaStep2 extends StatefulWidget {
  JanazaStep2({super.key, required this.isSelected, required this.isCompleted});
  bool isSelected;
  bool isCompleted;

  @override
  State<JanazaStep2> createState() => _JanazaStep2State();
}

class _JanazaStep2State extends State<JanazaStep2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .5, color:AppColor.darkYellow())),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              homeCubit.getShowTab(2);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isCompleted
                          ? AppColor.green1
                          : AppColor.darkGreen,
                    ),
                    child: Center(
                        child: AppText(
                          text: '2',
                          color: Colors.white,
                          fontFamily: 'ns',
                          fontSize: 16,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Recitation',
                        color: AppColor.darkGreen,
                        fontFamily: 'ns',
                        fontSize: context.mh * 0.016,
                      ),
                      AppText(
                        text: 'قراءة الفاتحة',
                        color: Colors.grey,
                        fontSize: context.mh * 0.014,
                      )
                    ],
                  ),
                  Spacer(),
                  widget.isSelected
                      ? Icon(
                    CupertinoIcons.arrowtriangle_up_fill,
                    size: 20,
                    color: AppColor.darkGreen,
                  )
                      : Icon(
                    CupertinoIcons.arrowtriangle_down_fill,
                    size: 20,
                    color: AppColor.darkGreen,
                  )
                ],
              ),
            ),
          ),
          !widget.isSelected? SizedBox(): Divider(height: 1,color: AppColor.darkYellow(),),
          !widget.isSelected? SizedBox():BlocBuilder(
              bloc: homeCubit,
              builder: (context,state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),

                      RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Recite Surah Al-Fatihah silently. Unlike regular prayers, there is no additional surah recited after Al-Fatihah in the Janazah prayer".tr(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: .5,color: AppColor.darkYellow()),
                            color: AppColor.bgPrimary().withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            AppText(text: "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ﴿١﴾ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ﴿٢﴾ الرَّحْمَنِ الرَّحِيمِ ﴿٣﴾ مَالِكِ يَوْمِ الدِّينِ ﴿٤﴾ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ ﴿٥﴾ اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ ﴿٦﴾ صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ ﴿٧﴾",color: AppColor.darkGreen,fontSize: 16,textAlign: TextAlign.right,),
                            SizedBox(height: 10,),
                            AppText(text: "\"In the name of Allah, the Entirely Merciful, the Especially Merciful. All praise is due to Allah, Lord of the worlds. The Entirely Merciful, the Especially Merciful. Sovereign of the Day of Recompense. It is You we worship and You we ask for help. Guide us to the straight path. The path of those upon whom You have bestowed favor, not of those who have earned [Your] anger or of those who are astray\"",fontFamily: 'n',fontWeight: FontWeight.w200,fontStyle: FontStyle.italic,color: AppColor.black(),fontSize: 14,)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Divider(height: 1,color: AppColor.darkYellow(),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColor.darkGreen.withOpacity(.08)
                            ),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.bookmark,size: 16,),
                                SizedBox(width: 4,),
                                AppText(text: "Save"),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeCubit.getCompletedJanazaSteps(2);
                              homeCubit.getShowTab(3);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.darkGreen
                              ),
                              child:
                              Row(
                                children: [
                                  Container(
                                    child: SvgPicture.asset(AppAssets.tickIcon,color: Colors.white,),
                                  ),
                                  SizedBox(width: 10,),
                                  AppText(text: "Mark as Completed",color: Colors.white,fontSize: 12,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),

                    ],
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}

var homeCubit=DiContainer().sl<HomeCubit>();
