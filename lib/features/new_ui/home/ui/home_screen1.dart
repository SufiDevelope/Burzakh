import 'dart:developer';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/constants/media_query.dart';
import 'package:burzakh/features/new_ui/home/widgets/home_case_widget.dart';
import 'package:burzakh/features/new_ui/home/widgets/home_topbar.dart';
import 'package:burzakh/features/new_ui/home/widgets/recent_activity_section.dart';
import 'package:burzakh/features/new_ui/home/widgets/resting_dialog_widget.dart';
import 'package:burzakh/features/new_ui/home/widgets/today_piority_widget.dart';
import 'package:burzakh/features/notification/presentation/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:get/get.dart';
import '../../../../core/app/di_container.dart';
import '../../../home/presentation/controller/cubit.dart';
import '../../../home/presentation/widgets/home_case_shimmer.dart';
import '../../../home/presentation/widgets/start_first_time_case.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final _homeCubit = DiContainer().sl<HomeCubit>();
  final controller = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getNotifs();
      _homeCubit.getUserCases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => CreatCaseScreen(),
          //     ));
          // showModalBottomSheet(
          //   context: context,
          //   backgroundColor: Colors.transparent,
          //   barrierColor: AppColor.blurWhiteColor(),
          //   builder: (context) => SelectRestingSheet(),
          // );
          showRestingDialog(context);
        },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColor.buttonColor),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: mdHeight(context) * 1,
        decoration: BoxDecoration(gradient: AppColor.bgGradient),
        child: RefreshIndicator(
          onRefresh: () async {
            return await _homeCubit.getUserCases();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: BlocBuilder(
                  bloc: _homeCubit,
                  builder: (context, state) {
                    log("state $state");
                    log("selected case index ${_homeCubit.selectedCaseIndex}");
                    
                    final caseList = _homeCubit.caseList ?? [];
                    final recentActivityList = _homeCubit.recentActivityList ?? [];
                    final selectedCaseIndex = _homeCubit.selectedCaseIndex ?? 0;
                    final isFetchingCases = _homeCubit.isFetchingCases ?? false;
                    
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        const HomeTopbar(),
                        0.02.ph(context),

                        // Case Info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isFetchingCases
                                ? const HomeCaseShimmer()
                                : caseList.isEmpty
                                    ? const StartFirstTimeCase()
                                    : Column(
                                        children: [
                                          ...List.generate(
                                            caseList.length,
                                            (index) {
                                              final caseModel = caseList[index];
                                              if (caseModel == null) {
                                                return const SizedBox.shrink();
                                              }
                                              
                                              return GestureDetector(
                                                onTap: () {
                                                  log("index ${caseModel.police_clearance}");
                                                  setState(() {
                                                    _homeCubit.selectCase(index);
                                                  });
                                                },
                                                child: HomeCaseWidget(
                                                  caseModel: caseModel,
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                            0.02.ph(context),

                            // Today's Priority
                            if (caseList.isNotEmpty && recentActivityList.isNotEmpty)
                              Row(
                                children: [
                                  AppText(
                                    text: "Today's Priority",
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.mh * 0.017,
                                  ),
                                  AppText(
                                    text: " (${_getSelectedCaseName(caseList, selectedCaseIndex)})",
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.mh * 0.017,
                                  ),
                                ],
                              ),
                            0.01.ph(context),
                            (caseList.isEmpty || recentActivityList.isEmpty)
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    width: mdWidth(context) * 1,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        AppText(
                                          text:
                                              "You have no pending actions today.\nYour priorities will appear here after you register a case.",
                                          fontSize: context.mh * 0.015,
                                          color: const Color(0xff6a655d),
                                        ),
                                      ],
                                    ),
                                  )
                                : _shouldShowCaseCompletedMessage(caseList, selectedCaseIndex)
                                    ? Container(
                                        alignment: Alignment.topLeft,
                                        width: mdWidth(context) * 1,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: AppColor.buttonColor,
                                                  child: Icon(
                                                    Icons.check,
                                                    color: AppColor.white(),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          AppText(
                                                            text: "Case Updated",
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: context.mh * 0.016,
                                                          ),
                                                        ],
                                                      ),
                                                      0.01.ph(context),
                                                      AppText(
                                                        text:
                                                            "Your Case is now ready for burial. Please Check the Notification for Grave Number.",
                                                        fontSize: context.mh * 0.015,
                                                        color: const Color(0xff6a655d),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : _getSelectedCase(caseList, selectedCaseIndex) != null
                                        ? TodayPiorityWidget(
                                            homeCubit: _homeCubit,
                                            caseModel: _getSelectedCase(caseList, selectedCaseIndex)!,
                                          )
                                        : const SizedBox.shrink(),

                            0.02.ph(context),

                            // Recent Activity
                            const RecentActivitySection(),
                            0.02.ph(context),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: AppColor.bgPrimary(),
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  left: BorderSide(
                                    color: AppColor.darkGreen,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text:
                                        "\"Verify, in the remembrance of Allah do hearts find rest\"",
                                    fontFamily: 'n',
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff6a655d),
                                    fontSize: context.mh * 0.015,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AppText(
                                        text: "-Surah Ar-Ra'd13:28",
                                        fontFamily: 'n',
                                        fontSize: context.mh * 0.012,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(0xff6a655d),
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to safely get selected case name
  String _getSelectedCaseName(List<dynamic> caseList, int selectedIndex) {
    if (caseList.isEmpty || selectedIndex >= caseList.length || selectedIndex < 0) {
      return 'Unknown Case';
    }
    final selectedCase = caseList[selectedIndex];
    return selectedCase?.name_of_deceased ?? 'Unknown Case';
  }

  // Helper method to safely get selected case
  dynamic _getSelectedCase(List<dynamic> caseList, int selectedIndex) {
    if (caseList.isEmpty || selectedIndex >= caseList.length || selectedIndex < 0) {
      return null;
    }
    return caseList[selectedIndex];
  }

  // Helper method to check if case completed message should be shown
  bool _shouldShowCaseCompletedMessage(List<dynamic> caseList, int selectedIndex) {
    final selectedCase = _getSelectedCase(caseList, selectedIndex);
    if (selectedCase == null) return false;
    
    return selectedCase.caseStatus == "approved" && 
           selectedCase.burial_submission_status == "Approved";
  }
}