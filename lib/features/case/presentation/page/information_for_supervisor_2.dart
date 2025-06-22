// ignore_for_file: must_be_immutable

import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/case/presentation/widgets/document_for_graveyard_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/document_for_police_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/get_graveyard_approval.dart';
import 'package:burzakh/features/case/presentation/widgets/is_completed_case_row.dart';
import 'package:burzakh/features/case/presentation/widgets/submission_recieved_dialog.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app/di_container.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../../home/presentation/controller/cubit.dart';

class InformationForSupervisor2 extends StatefulWidget {
  const InformationForSupervisor2({super.key});

  @override
  State<InformationForSupervisor2> createState() => _InformationForSupervisor2State();
}

class _InformationForSupervisor2State extends State<InformationForSupervisor2> {
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
                              color: AppColor.primary(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppAssets.tick,width: 7,height: 7,),
                            ],
                          ),
                        ),
                        Expanded(child: Divider(thickness: 2,color: AppColor.primary(),)),
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4,color: AppColor.primary())
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: commonTopMargin,),
                    CustomTextFormField(readOnly: true, onTap: () {},controller: burialTiming,subTitle: 'Death Notification *',bgColor: AppColor.greyLight1(),textInputAction: TextInputAction.done,sufixIcon: AppAssets.tickIcon,),
                    SizedBox(height: commonHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(text: "PDF, JPG or PNG. Max 10MB",fontSize:text1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                      ],
                    ),
                    SizedBox(height: commonHeightS,),
                    CustomTextFormField(readOnly: true, onTap: () {},controller: commentary,subTitle: 'Hospital Certificate *',bgColor: AppColor.greyLight1(),textInputAction: TextInputAction.done,sufixIcon: AppAssets.tickIcon,),
                    SizedBox(height: commonHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(text: "PDF, JPG or PNG. Max 10MB",fontSize:text1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                      ],
                    ),
                    SizedBox(height: commonHeightS,),
                    CustomTextFormField(readOnly: true, onTap: () {},controller: citizen,subTitle: 'Passport or Emirates ID of Deceased *',bgColor: AppColor.greyLight1(),textInputAction: TextInputAction.done,sufixIcon: AppAssets.tickIcon,),
                    SizedBox(height: commonHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(text: "A combination of Front and back",fontSize: text1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                      ],
                    ),
                    SizedBox(height: commonHeightS,),
                    CustomTextFormField(readOnly: true, onTap: () {
                      _caseCubit.pickPoliceClearance();
                    },controller: citizen,subTitle: 'Police Clearance Document *',textInputAction: TextInputAction.done,sufixIcon:_caseCubit.policeClearance!=null? AppAssets.tickIcon:AppAssets.uploadIcon,),
                    SizedBox(height: commonHeight,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppText(text: "This was issued by the police",fontSize: text1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                      ],
                    ),
                    SizedBox(height: commonHeightM1,),
                    CustomElevatedButton(onPressed: ()async{
                   var response=await   _caseCubit.uploadGraveyardSupervisorDoc();
                   if(response=="200"){
                     showDialog(context: context,barrierColor: AppColor.blurWhiteColor(), builder: (context) => SubmissionRecievedDialog(),);
                   }
                    }, isLoading: _caseCubit.isGraveyardDocUpload,text: 'SUBMIT',bgColor:AppColor.primary() ,textColor: AppColor.white(),fontWeight: FontWeight.w600,),
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
