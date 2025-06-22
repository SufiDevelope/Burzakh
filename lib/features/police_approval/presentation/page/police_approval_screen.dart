import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/police_approval/presentation/widgets/document_recieved_dialog.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/app_text.dart';
import '../../../../widgets/custom_text_form.dart';

class PoliceApprovalScreen extends StatefulWidget {
  const PoliceApprovalScreen({super.key});

  @override
  State<PoliceApprovalScreen> createState() => _PoliceApprovalScreenState();
}

class _PoliceApprovalScreenState extends State<PoliceApprovalScreen> {
  TextEditingController deathNoti=TextEditingController();
  TextEditingController hospital=TextEditingController();
  TextEditingController passport=TextEditingController();
  TextEditingController passportBack=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.bgGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenPaddingHori,vertical: screenPaddingHori),
              child: BlocBuilder(
                bloc: documentCubit,
                builder: (_,state) {
                  return Column(
                    children: [
                      CustomTopBar(text: "Documents for Police Approval"),
                      SizedBox(height: commonTopMargin,),
                      AppText(text: "Please upload three required documents. You may take a clear photo or attach a file.",fontSize: heading3-1,textAlign: TextAlign.left,color: AppColor.grey(),fontFamily: 'nr',),
                      SizedBox(height: commonHeightL,),
                      CustomTextFormField(readOnly: true, onTap: ()async {
                        documentCubit.pickDeathNoti();
                      },controller: deathNoti,subTitle: 'Death Notification *',textInputAction: TextInputAction.done,sufixIcon:documentCubit.deathNoti!=null? AppAssets.tickIcon:AppAssets.uploadIcon,),
                      SizedBox(height: commonHeight,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(text: "PDF, JPG or PNG. Max 10MB",fontSize: heading3-1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                        ],
                      ),
                      SizedBox(height: screenPaddingHori,),
                      CustomTextFormField(readOnly: true, onTap: () {
                        documentCubit.pickHospitalCert();
                      },controller: hospital,subTitle: 'Hospital Certificate *',textInputAction: TextInputAction.done,sufixIcon:documentCubit.hospitalCerti!=null? AppAssets.tickIcon: AppAssets.uploadIcon,),
                      SizedBox(height: commonHeight,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(text: "PDF, JPG or PNG. Max 10MB",fontSize: heading3-1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                        ],
                      ),
                      SizedBox(height: screenPaddingHori,),
                      CustomTextFormField(readOnly: true, onTap: () {
                        documentCubit.pickPassportFront();
                      },controller: deathNoti,subTitle: 'Passport or Emirates ID of Deceased *',textInputAction: TextInputAction.done,sufixIcon:documentCubit.passportFront!=null? AppAssets.tickIcon: AppAssets.uploadIcon,),
                      SizedBox(height: commonHeight,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(text: "Front side",fontSize: heading3-1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                        ],
                      ),
                      SizedBox(height: screenPaddingHori,),
                      CustomTextFormField(readOnly: true, onTap: () {
                        documentCubit.pickPassportBack();
                      },controller: deathNoti,subTitle: 'Passport or Emirates ID of Deceased *',textInputAction: TextInputAction.done,sufixIcon:documentCubit.passportBack!=null? AppAssets.tickIcon: AppAssets.uploadIcon,),
                      SizedBox(height: commonHeight,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(text: "Back side",fontSize: heading3-1,textAlign: TextAlign.left,color: AppColor.greyLight(),fontFamily: 'nr',),
                        ],
                      ),
                      SizedBox(height: commonHeightM1,),
                      CustomElevatedButton(onPressed: () async {
                      //  String response=await documentCubit.uploadDocument();
                      //  if(response=="200"){
                      //    showDialog(context: context,barrierDismissible: false,barrierColor: AppColor.blurWhiteColor(),builder: (context) => DocumentRecievedDialog(),);
                      //  }

                      }, isLoading: documentCubit.isUploadingdocs,text: 'SUBMIT'),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var documentCubit=DiContainer().sl<HomeCubit>();
