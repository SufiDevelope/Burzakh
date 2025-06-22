// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/case/presentation/page/information_for_supervisor_2.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_drop_down.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_text_form.dart';

class InformationForSupervisor1 extends StatefulWidget {
  const InformationForSupervisor1({super.key});

  @override
  State<InformationForSupervisor1> createState() => _InformationForSupervisor1State();
}

class _InformationForSupervisor1State extends State<InformationForSupervisor1> {
  TextEditingController burialTiming=TextEditingController();
  TextEditingController commentary=TextEditingController();
  TextEditingController citizen=TextEditingController();
  List<String> burialTime=[
    'Dhuhr',
    'Asr',
    'Magrib',
    'Isha'
  ];

  List<String> preferredCom=[
    'Al Qusais Cemetery',
    'Al Quoz Cemetery',
    'Al Hayl Cemetery (Hatta)',
    'Waab Al Aqar Cemetery(Hatta)'
  ];

  List<String> lovedCitizan=[
    'Yes',
    'No'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgPrimary(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
            child: BlocBuilder(
              bloc: _caseCubit,
              builder: (context,state) {
                return Column(
                  children: [
                    CustomTopBar(text: "Information for supervisor"),
                    SizedBox(height: commonTopMargin,),
                    AppText(text: "This step helps the Graveyard Supervisor approve the burial request.",fontSize: heading3,color: AppColor.grey(),fontFamily: 'nr',),
                    SizedBox(height: commonTopMargin,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4,color: AppColor.primary())
                          ),
                        ),
                        Expanded(child: Divider(thickness: 2,color: AppColor.greyLight(),)),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4,color: AppColor.greyLight())
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: commonTopMargin,),
                    CustomDropDown(hintSize: 14,text:_caseCubit.burialTime!=null? "${_caseCubit.burialTime}":"Burial timing", menus: burialTime,onSelected: (p0) {
                      log("328947 //$p0");
                      _caseCubit.getBurialTime(burialTime[p0]);
                    },),
                    SizedBox(height: commonHeightS,),
                    CustomDropDown(hintSize: 14,text:_caseCubit.preferredComm!=null? "${_caseCubit.preferredComm}":'Preferred commentary', menus:preferredCom,onSelected: (p0) {
                      _caseCubit.getPreferredComm(preferredCom[p0]);
                    }, ),
                    SizedBox(height: commonHeightS,),
                    CustomDropDown(hintSize: 14,text:_caseCubit.lovedCitizan!=null?"${ _caseCubit.lovedCitizan}":'Was your loved one an Emirati citizen?', menus:lovedCitizan,onSelected: (p0) {
                      _caseCubit.getLovedCitizan(lovedCitizan[p0]);
                    }, ),
                    SizedBox(height: commonHeightM1,),
                    CustomElevatedButton(onPressed: (){
                      if(_caseCubit.burialTime==null || _caseCubit.preferredComm==null|| _caseCubit.lovedCitizan==null){
                        showMessage("Please fill all fields",isError: true);
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InformationForSupervisor2(),));
                      }
                    }, text: 'NEXT',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,),
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


var _caseCubit=DiContainer().sl<HomeCubit>();