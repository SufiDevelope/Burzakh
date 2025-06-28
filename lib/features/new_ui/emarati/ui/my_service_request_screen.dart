import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/emarati/ui/rta_service_request_Screen.dart';
import 'package:burzakh/features/new_ui/emarati/ui/service_request_confirmation_screen.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/active_request_not_available.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/my_service_request_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di_container.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';
import '../widgets/request_confirmation_topbar.dart';

class MyServiceRequestScreen extends StatelessWidget {
  const MyServiceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColor.bgGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: BlocBuilder(
                bloc: _emiratiScvCubit,
                builder: (context, state) {
                  return _emiratiScvCubit.isGetRtaLoading ||
                          _emiratiScvCubit.isGetCdaLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColor.buttonColor,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            children: [
                              RequestConfirmationTopbar(
                                text: "My Service Requests",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              _emiratiScvCubit.cdaGetModel == null
                                  ? SizedBox()
                                  : MyServiceRequestWidget(
                                      isLoading: _emiratiScvCubit.isCancelCda,
                                      onCancel: _emiratiScvCubit.isCancelCda
                                          ? () {}
                                          : () async {
                                              if (_emiratiScvCubit
                                                      .cdaGetModel !=
                                                  null) {
                                                var respo =
                                                    await _emiratiScvCubit
                                                        .cancelCda();
                                                if (respo == "200") {
                                                  Navigator.pop(context);
                                                }
                                              }
                                            },
                                      viewDetail: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ServiceRequestConfirmationScreen(
                                                id: "CDA",
                                              ),
                                            ));
                                      },
                                      isApproved: _emiratiScvCubit
                                                  .cdaGetModel!.status ==
                                              "Pending"
                                          ? 0
                                          : _emiratiScvCubit
                                                      .cdaGetModel!.status ==
                                                  "Rejected"
                                              ? 2
                                              : 1,
                                      heading: "Mourning Tent",
                                      subtext:
                                          "Community Development Authority",
                                      refrence:
                                          '${"CDA".tr()}-${_emiratiScvCubit.cdaGetModel?.id}',
                                      requestedDate: DateFormat('MM dd, yyyy')
                                          .format(_emiratiScvCubit.cdaGetModel
                                                  ?.mourningStartDate ??
                                              DateTime.now()),
                                      isLocation: true,
                                      location: _emiratiScvCubit
                                          .cdaGetModel!.locationOfTent,
                                      scheduleDate: DateFormat('MM dd, yyyy')
                                          .format(_emiratiScvCubit
                                              .cdaGetModel!.createdAt),
                                    ),
                              _emiratiScvCubit.rtaGetModel == null
                                  ? SizedBox()
                                  : MyServiceRequestWidget(
                                      isLoading: _emiratiScvCubit.isCancelRta,
                                      onCancel: _emiratiScvCubit.isCancelRta
                                          ? () {}
                                          : () async {
                                              if (_emiratiScvCubit
                                                      .rtaGetModel !=
                                                  null) {
                                                var respo =
                                                    await _emiratiScvCubit
                                                        .cancelRta();
                                                if (respo == "200") {
                                                  Navigator.pop(context);
                                                }
                                              }
                                            },
                                      viewDetail: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RtaServiceRequestScreen(
                                                id: "RTA",
                                              ),
                                            ));
                                      },
                                      isApproved: _emiratiScvCubit
                                                  .rtaGetModel!.status ==
                                              "Pending"
                                          ? 0
                                          : _emiratiScvCubit
                                                      .rtaGetModel!.status ==
                                                  "Rejected"
                                              ? 2
                                              : 1,
                                      heading: "Road Signage",
                                      subtext: "Roads and Transport Authority",
                                      refrence:
                                          '${"RTA".tr()}-${_emiratiScvCubit.rtaGetModel!.id}',
                                      requestedDate: DateFormat('MM dd, yyyy')
                                          .format(_emiratiScvCubit
                                              .rtaGetModel!.mourningStartDate),
                                      isLocation: false,
                                      location: _emiratiScvCubit
                                          .rtaGetModel!.signsRequired,
                                      scheduleDate: DateFormat('MM dd, yyyy')
                                          .format(_emiratiScvCubit
                                              .rtaGetModel!.createdAt),
                                    ),
                              // ActiveRequestNotAvailable(),
                            ],
                          ),
                        ));
                })),
      ),
    );
  }
}

var _emiratiScvCubit = DiContainer().sl<EmirateSvcsCubit>();
