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

class JanazaStep5 extends StatefulWidget {
  JanazaStep5({super.key, required this.isSelected, required this.isCompleted});
  bool isSelected;
  bool isCompleted;

  @override
  State<JanazaStep5> createState() => _JanazaStep5State();
}

class _JanazaStep5State extends State<JanazaStep5> {
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
              homeCubit.getShowTab(5);
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
                          text: '5',
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
                        text: 'Fourth Takbir & Tasleem',
                        color: AppColor.darkGreen,
                        fontFamily: 'ns',
                        fontSize: context.mh * 0.016,
                      ),
                      AppText(
                        text: 'التكبيرة الرابعة والتسليم',
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
                                  text: "Raise your hands saying".tr(),
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
                                  text: " ".tr(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text:
                                  "After the fourth takbir, you should recite this brief dua:".tr(),
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
                            AppText(text: "اللَّهُمَّ لَا تَحْرِمْنَا أَجْرَهُ وَلَا تَفْتِنَّا بَعْدَهُ وَاغْفِرْ لَنَا وَلَهُ",color: AppColor.darkGreen,fontSize: 16,textAlign: TextAlign.right,),
                            SizedBox(height: 10,),
                            AppText(text: "\"O Allah, do not deprive us of his/her reward, do not put us to trial after him/her, and forgive us and him/her.\"",fontFamily: 'n',fontWeight: FontWeight.w200,fontStyle: FontStyle.italic,color: AppColor.black(),fontSize: 14,)
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Then turn your face to the right saying".tr(),
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
                                  text: "Assalamu alaikum wa rahmatullah (السلام عليكم ورحمة الله)".tr(),
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
                                  "while turning your face to the right. Some scholars also recommend turning to the left and repeating the same, but a single tasleem to the right is sufficient according to most scholars.".tr(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColor.bgPrimary().withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              child: Image.asset(homeCubit.selectedTakbirImage == 0?AppAssets.appLogo:homeCubit.selectedTakbirImage == 1?AppAssets.appLogo:AppAssets.appLogo),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  homeCubit.getTakbirImage(0);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            width: 2,
                                            color: homeCubit.selectedTakbirImage == 0
                                                ? AppColor.darkGreen
                                                : AppColor.darkYellow(),
                                          ))),
                                  child: AppText(
                                    text: "Standing",
                                    color: homeCubit.selectedTakbirImage  == 0
                                        ? AppColor.darkGreen
                                        : Colors.grey,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  homeCubit.getTakbirImage(1);

                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            width: 2,
                                            color: homeCubit.selectedTakbirImage  == 1
                                                ? AppColor.darkGreen
                                                :AppColor.darkYellow(),
                                          ))),
                                  child: AppText(
                                    text: "Raising Hands",
                                    color: homeCubit.selectedTakbirImage  == 1
                                        ? AppColor.darkGreen
                                        : Colors.grey,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: () {
                                  homeCubit.getTakbirImage(2);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            width: 2,
                                            color: homeCubit.selectedTakbirImage  == 2
                                                ? AppColor.darkGreen
                                                : AppColor.darkYellow(),
                                          ))),
                                  child: AppText(
                                    text: "Hands Folded",
                                    color: homeCubit.selectedTakbirImage  == 2
                                        ? AppColor.darkGreen
                                        : Colors.grey,
                                  ),
                                ),
                              )),
                        ],
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
                              homeCubit.getCompletedJanazaSteps(5);
                              homeCubit.getShowTab(6);
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
