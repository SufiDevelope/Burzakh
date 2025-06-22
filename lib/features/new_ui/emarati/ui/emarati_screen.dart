import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/emarati/ui/my_service_request_screen.dart';
import 'package:burzakh/features/new_ui/emarati/ui/rta_service_request_Screen.dart';
import 'package:burzakh/features/new_ui/emarati/ui/send_cda_screen.dart';
import 'package:burzakh/features/new_ui/emarati/ui/service_request_confirmation_screen.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/request_shimmer.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/service_request_widget.dart';
import 'package:burzakh/features/new_ui/emarati/widgets/service_widget.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/verse_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/media_query.dart';
import '../../../../core/app/di_container.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';
import '../../../emirati_svcs/presentation/widgets/sign_age_sheet.dart';
import '../../../emirati_svcs/presentation/widgets/tent_request_sheet.dart';
import '../widgets/cda_shimmer.dart';

class EmaratiScreen extends StatefulWidget {
  const EmaratiScreen({super.key});

  @override
  State<EmaratiScreen> createState() => _EmaratiScreenState();
}

class _EmaratiScreenState extends State<EmaratiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder(
              bloc: _emiratiScvCubit,
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Support for Emirati Families",
                          color: Colors.black,
                          fontSize: context.mh * 0.017,
                          fontWeight: FontWeight.w600,
                        ),
                        0.008.ph(context),
                        AppText(
                            text:
                                "As part of the UAE's commitment to its citizens, Emirati families are offered additional support during times of loss.",
                            color: AppColor.grey(),
                            fontSize: context.mh * 0.014),
                        0.01.ph(context),
                        AppText(
                          text: "Available Services",
                          color: AppColor.black(),
                          fontSize: context.mh * 0.017,
                          fontFamily: 'ns',
                        ),
                        0.01.ph(context),

                        // Mourning Tent Setup
                        _emiratiScvCubit.isGetCdaLoading
                            ? CdaShimmer()
                            : ServiceWidget(
                                onTap: () {
                                  if (_emiratiScvCubit.cdaGetModel != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceRequestConfirmationScreen(),
                                        ));
                                  } else {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      constraints: BoxConstraints(
                                          maxHeight: mdHeight(context) * 1),
                                      backgroundColor: Colors.transparent,
                                      barrierColor: AppColor.blurWhiteColor(),
                                      builder: (context) => TentRequestSheet(),
                                    );
                                  }
                                },
                                text1: "Mourning Tent Setup",
                                text2:
                                    "Provided by Community Development Authority",
                                text3:
                                    "Request comfortable tent facilities for receiving condolences from visitors.",
                                iconData: "assets/images/jpg/cda.jpg",
                              ),
                        0.01.ph(context),
                        ServiceWidget(
                          onTap: () {
                            if (_emiratiScvCubit.rtaGetModel != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RtaServiceRequestScreen(),
                                  ));
                            } else {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                constraints: BoxConstraints(
                                    maxHeight: mdHeight(context) * 1),
                                backgroundColor: Colors.transparent,
                                barrierColor: AppColor.blurWhiteColor(),
                                builder: (context) => SignAgeSheet(),
                              );
                            }
                          },
                          text1: "Road Signage Assistance",
                          text2: "Provided by Roads and Transport Authority",
                          text3:
                              "Request directional signs to guide visitors to the mourning location.",
                          iconData: "assets/images/jpg/rta.jpg",
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              maxLines: 2,
                              text: "Your Service Requests",
                              fontSize: context.mh * 0.015,
                              color: AppColor.black(),
                              fontFamily: 'ns',
                              fontWeight: FontWeight.w500,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MyServiceRequestScreen(),
                                  ),
                                );
                              },
                              child: AppText(
                                text: "View All",
                                fontSize: context.mh * 0.015,
                                color: AppColor.blue,
                                fontFamily: 'nm',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        0.01.ph(context),
                        _emiratiScvCubit.isGetCdaLoading
                            ? RequestShimmer()
                            : _emiratiScvCubit.cdaGetModel != null
                                ? ServiceRequestWidget(
                                    approved:
                                        _emiratiScvCubit.cdaGetModel?.status ??
                                            "",
                                    text1: _emiratiScvCubit
                                            .cdaGetModel?.locationOfTent ??
                                        "",
                                    ref:
                                        "${"CDA".tr()}-${_emiratiScvCubit.cdaGetModel!.id}",
                                    emiratiScvCubit: _emiratiScvCubit,
                                  )
                                : SizedBox(),
                        _emiratiScvCubit.isGetRtaLoading
                            ? RequestShimmer()
                            : _emiratiScvCubit.rtaGetModel != null
                                ? ServiceRequestWidget(
                                    approved:
                                        _emiratiScvCubit.rtaGetModel?.status ??
                                            "",
                                    text1: "Road Signage",
                                    ref:
                                        "${"RTA".tr()}-${_emiratiScvCubit.rtaGetModel!.id}",
                                    emiratiScvCubit: _emiratiScvCubit,
                                  )
                                : SizedBox(),
                        // ServiceRequestWidget(approved: 2,text1: "Mourning Tent",ref: "CDA-912218",),

                        0.01.ph(context),
                        VerseWidget(
                          verse1:
                              "\"And cooperate in righteousness and piety, but do not cooperate in sin and aggression.\"",
                          verse2: "— Surah Al-Ma'idah 5:2",
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

var _emiratiScvCubit = DiContainer().sl<EmirateSvcsCubit>();
