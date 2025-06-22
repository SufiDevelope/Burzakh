import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/request_confirmation_topbar.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/request_detail_widget.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/request_submitted_green_container.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/service_request_screen_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di_container.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';

class ServiceRequestConfirmationScreen extends StatelessWidget {
  const ServiceRequestConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.bgGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: BlocBuilder(
            bloc: _emiratiScvCubit,
            builder: (context,state) {
              return _emiratiScvCubit.isGetCdaLoading? Center(child: CircularProgressIndicator(color: AppColor.buttonColor,),): SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RequestConfirmationTopbar(text: "Request Confirmation",),
                      SizedBox(height: 10,),
                      RequestSubmittedGreenContainer(),
                      RequestDetailWidget(isApproved: 0,cdaGetModel: _emiratiScvCubit.cdaGetModel!,),
                      ServiceRequestScreenFooter(),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

var _emiratiScvCubit=DiContainer().sl<EmirateSvcsCubit>();

