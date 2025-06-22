import 'package:burzakh/constants/app_text_style.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/emarati/ui/my_service_request_screen.dart';
import 'package:burzakh/features/new_ui/emarati/ui/service_request_confirmation_screen.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/service_request_widget.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/service_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/verse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_widgets_size.dart';
import '../../../../core/app/di_container.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_form.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';
import '../../../emirati_svcs/presentation/widgets/request_sent_dialog.dart';
import '../../../emirati_svcs/presentation/widgets/tent_request_sheet.dart';
import '../widgets/request_confirmation_topbar.dart';

class SendCdaScreen extends StatefulWidget {
  const SendCdaScreen({super.key});

  @override
  State<SendCdaScreen> createState() => _SendCdaScreenState();
}

class _SendCdaScreenState extends State<SendCdaScreen> {
  TextEditingController dateController=TextEditingController();

  TextEditingController timeController=TextEditingController();

  TextEditingController locationController=TextEditingController();

  @override
  void initState() {
    _emiratiScvCubit.getCurrentLocation();
    super.initState();
  }
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
            child: BlocBuilder(
              bloc: _emiratiScvCubit,
              builder: (context,state) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {Navigator.pop(context);},
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                size: 25,
                              ),
                            ),
                          ),
                          AppText(text:
                          'CDA' ,
                            fontSize: 18,
                            fontFamily: 'nr',
                            fontWeight: FontWeight.w600,
                            color: AppColor.black(),
                          ),
                          SizedBox(width: 40,),
                        ],
                      ),
                      SizedBox(height: commonHeightM,),
                      CustomTextFormField(hintTextStyle: AppTextStyle.fieldTextStyle(),controller: dateController,onTap: () async{
                        var value=await  showDatePicker(context: context, firstDate: DateTime(2000,0,0), lastDate: DateTime(3000,0,0),initialDate: DateTime.now(),);
                        if(value!=null){
                          _emiratiScvCubit.getMourningStartDate(value);
                        }
                      }, subTitle:_emiratiScvCubit.mourningStartDate!=null? "${_emiratiScvCubit.mourningStartDate!.year}-${_emiratiScvCubit.mourningStartDate!.month}-${_emiratiScvCubit.mourningStartDate!.day}":'Mourning start date',readOnly: true,sufixIcon:AppAssets.calenderIcon,),
                      SizedBox(height: commonHeightS,),
                      CustomTextFormField(controller: dateController,hintTextStyle: AppTextStyle.fieldTextStyle(),onTap: () async{
                        var value=await  showTimePicker(context: context, initialTime: TimeOfDay.now());
                        if(value!=null){
                          _emiratiScvCubit.getTime(value);
                        }
                      }, subTitle:_emiratiScvCubit.time!=null? "${_emiratiScvCubit.time!.hour}:${_emiratiScvCubit.time!.minute}": 'Time',readOnly: true,sufixIcon:AppAssets.clockIcon,),
                      SizedBox(height: commonHeightS,),
                      CustomTextFormField(hintTextStyle: AppTextStyle.fieldTextStyle(),controller: dateController, subTitle:_emiratiScvCubit.userLocation!=null? "${_emiratiScvCubit.userLocation}":'Precise location of the tent',readOnly: true,sufixIcon:AppAssets.locationPinIcon,),
                      SizedBox(height: commonHeightM1,),
                      CustomElevatedButton(onPressed: ()async{
                        String? response= await  _emiratiScvCubit.uploadCda();
                        if(response=="200"){
                          Navigator.pop(context);

                          showDialog(context: context,barrierColor: AppColor.blurWhiteColor(), builder: (context) => RequestSentDialog(heading: "Mourning tent request sent", subText1: "Your request has been shared with the Community Development Authority.", subText2: "You may cancel this request within 2 hours."),);

                        }
                      },isLoading: _emiratiScvCubit.isCdaLoading, text: "SUBMIT",textColor: AppColor.white(),fontWeight: FontWeight.w600,),


                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}


var _emiratiScvCubit=DiContainer().sl<EmirateSvcsCubit>();
