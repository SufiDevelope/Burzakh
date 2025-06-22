// ignore_for_file: must_be_immutable

import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/emirati_svcs/data/model/rta_get_model.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di_container.dart';
import '../../../emirati_svcs/data/model/cda_get_model.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';

class RequestDetailWidget extends StatelessWidget {
   RequestDetailWidget({super.key,required this.isApproved, this.cdaGetModel, this.rtaGetModel});
int isApproved;
CdaGetModel? cdaGetModel;
RtaGetModel? rtaGetModel;
  @override
  Widget build(BuildContext context) {
    String date;
    if(cdaGetModel!=null){
      isApproved=cdaGetModel!.status=="Pending"?0:cdaGetModel!.status=="Rejected"?2:1;
      date=DateFormat('MM dd, yyyy').format(cdaGetModel!.mourningStartDate);
    }else{
      isApproved=rtaGetModel!.status=="Pending"?0:rtaGetModel!.status=="Rejected"?2:1;
      date=DateFormat('MM dd, yyyy').format(rtaGetModel!.mourningStartDate);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: BlocBuilder(
        bloc: _emirateCubit,
        builder: (context,state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                       alignment: Alignment.topLeft,
                       child: AppText(
                         text:
                        "Mourning Tent Request",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black(),
                        fontFamily: 'ns',
                                       ),
                     ),
                    const SizedBox(height: 4),
                    Container(
                      alignment: Alignment.topLeft,
                      child: AppText(
                        text:
                        "${"Reference Number:".tr()} ${rtaGetModel==null?"CDA".tr():"RTA".tr()}-${rtaGetModel==null?cdaGetModel!.id:rtaGetModel!.id}",
                          fontSize: 14,
                          color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[100],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text:
                      "Details",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.black(),
                      fontFamily: 'nm',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow("Name:", "${_authCubit.userModel!.firstName} ${_authCubit.userModel!.lastName}"),
                    const SizedBox(height: 12),
                    _buildDetailRow("Location:",cdaGetModel!=null? cdaGetModel!.locationOfTent:rtaGetModel!.locationOfHouse),
                    const SizedBox(height: 12),
                    _buildDetailRow("Date:", "${date}"),
                    const SizedBox(height: 12),
                    _buildDetailRow("Time:",cdaGetModel!=null?  cdaGetModel!.time:rtaGetModel!.time),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 112,
                          child: AppText(
                            text:
                            "Status:",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            fontFamily: 'nm',
                          ),
                        ),
                        Expanded(
                          child: AppText(
                            text:
                            isApproved==1
                                ? 'Approved'
                                : isApproved==2
                                ? 'Rejected'
                                : 'Pending',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isApproved==1
                                  ? const Color(0xFF2E7D32)
                                  : isApproved==2
                                  ? const Color(0xFFC62828)
                                  : const Color(0xFFB38000),
                            fontFamily: 'ns',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppText(
                      text:
                      "Your request is being processed. You will be notified once it's approved.",
                        fontSize: 13,
                        color: Colors.grey[500],
                    ),
                    const SizedBox(height: 16),
                    if (isApproved==0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed:_emirateCubit.isCancelCda || _emirateCubit.isCancelRta? (){}:() async{
                              if(cdaGetModel!=null){
                             var respo=await   _emirateCubit.cancelCda();
                             if(respo=="200"){
                               Navigator.pop(context);
                             }
                              }else{
                                var respo=await  _emirateCubit.cancelRta();
                                if(respo=="200"){
                                  Navigator.pop(context);
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red[600],
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.red[400]!),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: _emirateCubit.isCancelCda || _emirateCubit.isCancelRta?Container(margin: EdgeInsets.symmetric(horizontal: 30),height: 20,width: 20,child: CircularProgressIndicator(color: Colors.red,)) :AppText(
                              text:
                              "Cancel Request",
                                fontSize: 14,
                                color:Colors.red ,
                                fontWeight: FontWeight.w500,
                              fontFamily: 'ns',
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.buttonColor,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child:  AppText(text:
                              "Done",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white(),
                              fontFamily: 'ns',
                            ),
                          ),
                        ],
                      )
                    else
                      ElevatedButton(
                        onPressed: () { },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.buttonColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:  AppText(text:
                          "Back to Services",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white(),
                          fontFamily: 'ns',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 112,
          child: AppText(
            text:
            label,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500],
            fontFamily: 'nm',
          ),
        ),
        Expanded(
          child: AppText(
            text:
            value,
              fontSize: 14,
              color: AppColor.black(),
            fontFamily: 'nm',
          ),
        ),
      ],
    );
  }
}


var _authCubit=DiContainer().sl<AuthenticationCubit>();
var _emirateCubit=DiContainer().sl<EmirateSvcsCubit>();
