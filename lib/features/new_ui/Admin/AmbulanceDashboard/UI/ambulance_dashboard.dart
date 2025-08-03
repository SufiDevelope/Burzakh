// ignore_for_file: constant_pattern_never_matches_value_type

import 'dart:developer';
import 'dart:io';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/localization/localization_getx.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/Controller/ambulance_controller.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/widget/ambulance_card_list_widget.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/widget/tab_selection_widget.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/widget/today_schedule_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Widgets/select_language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class AmbulanceDashboard extends StatefulWidget {
  final String name;
  final dynamic id;
  final bool flag;
  const AmbulanceDashboard(
      {super.key, required this.name, this.id, required this.flag});

  @override
  State<AmbulanceDashboard> createState() => _AmbulanceDashboardState();
}

class _AmbulanceDashboardState extends State<AmbulanceDashboard> {
  final ambulanceController = Get.put(AmbulanceController());

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(context.mw * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bottom sheet handle
              Container(
                width: context.mw * 0.12,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              0.03.ph(context),

              Container(
                width: context.mw * 0.2,
                height: context.mw * 0.2,
                decoration: BoxDecoration(
                  color: const Color(0xFF4b5563),
                  borderRadius: BorderRadius.circular(context.mw * 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    widget.name[0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.mh * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              0.02.ph(context),

              // Admin name
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: context.mh * 0.02,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              0.01.ph(context),

              // Role
              Text(
                StringTranslateExtension("Ambulance Admin").tr(),
                style: TextStyle(
                  fontSize: context.mh * 0.016,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              0.03.ph(context),

              // Divider
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              0.02.ph(context),

              // Logout button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await documentCubit.logOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurzakhEnhancedLogin(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4b5563),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: context.mh * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      ),
                      0.02.pw(context),
                      Text(
                        StringTranslateExtension('Logout').tr(),
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              0.02.ph(context),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ambulanceController.getAmbulanceCasses(widget.id.toString(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationGetx controller = Get.find<LocalizationGetx>();
    void _showLanguageSelectionCustom() {
      LanguageSelectionBottomSheet.show(
        context,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        selectedColor: Color(0xff2d4159),
        borderColor: Colors.white.withOpacity(0.3),
        borderRadius: 20,
      );
    }

    return Scaffold(
      backgroundColor: Color(0xfff9fafb),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(50.0 + MediaQuery.of(context).padding.top),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFffffff),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.only(
            left: context.mw * 0.03,
            right: context.mw * 0.03,
            top: MediaQuery.of(context).padding.top + (context.mw * 0.02),
            bottom: context.mw * 0.02,
          ),
          child: Row(
            children: [
              widget.flag == true
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios_new
                            : Icons.arrow_back,
                      ),
                    )
                  : Container(
                      width: context.mw * 0.1,
                      height: context.mw * 0.1,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4b5563),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.directions_car,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
              0.05.pw(context),
              // Middle - Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringTranslateExtension('Driver Dashboard').tr(),
                      style: GoogleFonts.inter(
                        fontSize: context.mh * 0.02,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4b5563),
                      ),
                    ),
                    0.001.ph(context),
                    Text(
                      '${widget.name} • ID: ${widget.id}',
                      style: TextStyle(
                        fontSize: context.mh * 0.011,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      _showLanguageSelectionCustom();
                    },
                    child: Container(
                      width: context.mw * 0.2,
                      height: context.mw * 0.09,
                      padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.02,
                          vertical: context.mw * 0.01),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4b5563),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: 6),
                          Text(
                            controller.lang.value.languageCode != 'ar'
                                ? 'English'
                                : 'عربي',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              0.01.pw(context),
              // Logout Container
              InkWell(
                onTap: () {
                  _showLogoutBottomSheet(context);
                },
                child: Container(
                  width: context.mw * 0.1,
                  height: context.mw * 0.1,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4b5563),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ambulanceController.getAmbulanceCasses(widget.id, context);
        },
        child: CustomScrollView(
          // Use CustomScrollView for better scroll coordination
          physics: const BouncingScrollPhysics(
              parent:
                  AlwaysScrollableScrollPhysics()), // Gentle bouncing effect
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  0.03.ph(context),
                  TabSelectionWidget(
                    driverId: widget.id.toString(),
                  ),
                  0.01.ph(context),
                ],
              ),
            ),
            // Main ambulance list
            Obx(
              () {
                switch (ambulanceController
                    .rxRequestStatusForAllAmbulanceRequest.value) {
                  case Status.loading:
                    log("loading");
                    return SliverToBoxAdapter(
                      child: Container(
                        height: context.mh * 0.3,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );

                  case Status.completed:
                    log("completed");

                    var data = ambulanceController.model.value.ambulance;
                    final dispatchedCases = ambulanceController
                            .model.value.ambulance?.dispatchInfo ??
                        [];

                    log(dispatchedCases.length.toString());

                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final currentDispatch = dispatchedCases[index];
                          final caseDetail =
                              (currentDispatch.caseDetails != null &&
                                      currentDispatch.caseDetails!.isNotEmpty)
                                  ? currentDispatch.caseDetails!.first
                                  : null;

                          return Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  index == dispatchedCases.length - 1 ? 0 : 8.0,
                            ),
                            child: AmbulanceListCardWidget(
                              driverName: data?.driverName ?? "",
                              ambulanceId: data?.vehicleNumber ?? "",
                              caseId:
                                  "BUR-${DateTime.now().year}-${currentDispatch.id}",
                              pickupLocation: currentDispatch.standbyMosque ??
                                  (caseDetail?.location ?? ''),
                              pickupAddress: "",
                              scheduledTime: DateTime.tryParse(
                                    data?.dispatchInfo?[index].createdAt ?? "",
                                  )?.add(Duration(hours: 3)).toString() ??
                                  "",
                              dispatchPhone: data?.contactNumber ?? "",
                              priority: data?.dispatchInfo?[index].priority ??
                                  "Not Assigned",
                              status: data?.status ?? "",
                              driverId: widget.id,
                              deliverLocation: dispatchedCases[index]
                                      .municipalityAmbulanceSub
                                      ?.preferredCemetery ??
                                  "",
                              rawId: currentDispatch.id,
                              statusDispatch: currentDispatch.status ?? "",
                            ),
                          );
                        },
                        childCount: dispatchedCases.length,
                      ),
                    );

                  case Status.error:
                    log("error");
                    return SliverToBoxAdapter(
                      child: Container(
                        height: context.mh * 0.2,
                        child: Center(child: Text("Error")),
                      ),
                    );

                  default:
                    log("default");
                    return SliverToBoxAdapter(child: Text("Default"));
                }
              },
            ),

            SliverToBoxAdapter(
              child: 0.01.ph(context),
            ),

            // Today's Schedule Widget
            Obx(
              () {
                if (ambulanceController
                        .rxRequestStatusForAllAmbulanceRequest.value ==
                    Status.completed) {
                  final dispatchedCases =
                      ambulanceController.model.value.ambulance?.dispatchInfo ??
                          [];

                  // Filter cases for today
                  final today = DateTime.now();
                  final todaysCases = dispatchedCases.where((dispatch) {
                    if (dispatch.createdAt == null) return false;

                    final createdDate = DateTime.tryParse(dispatch.createdAt!);
                    if (createdDate == null) return false;

                    final localCreatedDate = createdDate.toLocal();
                    log(localCreatedDate.toString());
                    final localToday = today;

                    return localCreatedDate.year == localToday.year &&
                        localCreatedDate.month == localToday.month &&
                        localCreatedDate.day == localToday.day;
                  }).toList();

                  return SliverToBoxAdapter(
                    child: todaysCases.isNotEmpty
                        ? TodaysScheduleWidget(
                            scheduleItems: todaysCases,
                          )
                        : Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 48,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      StringTranslateExtension(
                                              "No Schedule for Today")
                                          .tr(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      StringTranslateExtension(
                                              "You have no cases scheduled for today")
                                          .tr(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  );
                } else {
                  return SliverToBoxAdapter(child: SizedBox.shrink());
                }
              },
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: context.mh * 0.05),
            ),
          ],
        ),
      ),
    );
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();
