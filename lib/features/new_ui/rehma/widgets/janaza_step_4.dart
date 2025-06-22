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

class JanazaStep4 extends StatefulWidget {
  JanazaStep4({super.key, required this.isSelected, required this.isCompleted});
  bool isSelected;
  bool isCompleted;

  @override
  State<JanazaStep4> createState() => _JanazaStep4State();
}

class _JanazaStep4State extends State<JanazaStep4> {
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
              homeCubit.getShowTab(4);
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
                          text: '4',
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
                        text: 'Third Takbir',
                        color: AppColor.darkGreen,
                        fontFamily: 'ns',
                        fontSize: context.mh * 0.016,
                      ),
                      AppText(
                        text: 'التكبيرة الثالثة',
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
                                  text: "Raise your hands again saying".tr(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "Allahu Akbar (الله أكبر)".tr(),
                                  style: TextStyle(
                                      color: AppColor.darkGreen,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text:
                                  "This is the time to make du'a for the deceased person. The following du'as are recommended.".tr(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ],
                          )),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: .5,color: AppColor.darkYellow()),
                            color: AppColor.bgPrimary().withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText(text: "For adult males:",color: AppColor.darkGreen,fontSize: 14,fontFamily: 'ns',),
                              ],
                            ),
                            SizedBox(height: 10,),
                            AppText(text: "اللَّهُمَّ اغْفِرْ لَهُ وَارْحَمْهُ، وَعَافِهِ وَاعْفُ عَنْهُ، وَأَكْرِمْ نُزُلَهُ، وَوَسِّعْ مُدْخَلَهُ، وَاغْسِلْهُ بِالْمَاءِ وَالثَّلْجِ وَالْبَرَدِ، وَنَقِّهِ مِنَ الْخَطَايَا كَمَا نَقَّيْتَ الثَّوْبَ الْأَبْيَضَ مِنَ الدَّنَسِ، وَأَبْدِلْهُ دَارًا خَيْرًا مِنْ دَارِهِ، وَأَهْلًا خَيْرًا مِنْ أَهْلِهِ، وَزَوْجًا خَيْرًا مِنْ زَوْجِهِ، وَأَدْخِلْهُ الْجَنَّةَ، وَأَعِذْهُ مِنْ عَذَابِ الْقَبْرِ، وَمِنْ عَذَابِ النَّا",color: AppColor.darkGreen,fontSize: 16,textAlign: TextAlign.right,),
                            SizedBox(height: 10,),
                            AppText(text: "\"O Allah, forgive him and have mercy on him, and give him strength and pardon him. Make his reception generous, and expand his entry. Wash him with water, snow and hail, and cleanse him of sin as a white garment is cleansed of stains. Exchange his home for a better home, and his family for a better family, and his spouse for a better spouse. Admit him into Paradise, and protect him from the punishment of the grave and the punishment of Hell-fire.\"",fontFamily: 'n',fontWeight: FontWeight.w200,fontStyle: FontStyle.italic,color: AppColor.black(),fontSize: 14,)
                          ],
                        ),
                      ),SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(width: .5,color: AppColor.darkYellow()),
                            color: AppColor.bgPrimary().withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(child: AppText(text: "For adult females (note the feminine pronouns):",color: AppColor.darkGreen,fontSize: 14,fontFamily: 'ns',)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            AppText(text: "اللَّهُمَّ اغْفِرْ لَهَا وَارْحَمْهَا، وَعَافِهَا وَاعْفُ عَنْهَا، وَأَكْرِمْ نُزُلَهَا، وَوَسِّعْ مُدْخَلَهَا، وَاغْسِلْهَا بِالْمَاءِ وَالثَّلْجِ وَالْبَرَدِ، وَنَقِّهَا مِنَ الْخَطَايَا كَمَا نَقَّيْتَ الثَّوْبَ الْأَبْيَضَ مِنَ الدَّنَسِ، وَأَبْدِلْهَا دَارًا خَيْرًا مِنْ دَارِهَا، وَأَهْلًا خَيْرًا مِنْ أَهْلِهَا، وَزَوْجًا خَيْرًا مِنْ زَوْجِهَا، وَأَدْخِلْهَا الْجَنَّةَ، وَأَعِذْهَا مِنْ عَذَابِ الْقَبْرِ، وَمِنْ عَذَابِ النَّارِ",color: AppColor.darkGreen,fontSize: 16,textAlign: TextAlign.right,),
                            SizedBox(height: 10,),
                            AppText(text: "\"O Allah, forgive her and have mercy on her, and give her strength and pardon her. Make her reception generous, and expand her entry. Wash her with water, snow and hail, and cleanse her of sin as a white garment is cleansed of stains. Exchange her home for a better home, and her family for a better family, and her spouse for a better spouse. Admit her into Paradise, and protect her from the punishment of the grave and the punishment of Hell-fire.\"",fontFamily: 'n',fontWeight: FontWeight.w200,fontStyle: FontStyle.italic,color: AppColor.black(),fontSize: 14,)
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
                              homeCubit.getCompletedJanazaSteps(4);
                              homeCubit.getShowTab(5);
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
                          ),
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
