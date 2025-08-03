import 'dart:developer';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/features/authentication/presentation/page/login_01.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/cementry_dashboard_header_view.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/cementry_filter_widget.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/cementry_list_widget.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/mortinues_status_widget.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/status_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';
import 'package:easy_localization/easy_localization.dart';

class CementryAdminDashboard extends StatefulWidget {
  final String name;
  final bool flag;
  const CementryAdminDashboard({super.key, required this.name, required this.flag});

  @override
  State<CementryAdminDashboard> createState() => _CementryAdminDashboardState();
}

class _CementryAdminDashboardState extends State<CementryAdminDashboard> {
  final TextEditingController _searchController = TextEditingController();
  final controller = Get.put(CementryController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getAllCementryRequest();
      controller.getActiveMorticians();
      controller.getAllMorticians();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.mh * 0.18),
        child: Padding(
          padding: EdgeInsets.only(top: context.mh * 0.05),
          child: CementryDashboardHeaderWidget(
            initails: widget.name[0],
            adminname: widget.name,
            onLogoutPressed: () async {
              await documentCubit.logOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => BurzakhEnhancedLogin(),
                ),
                (route) => false,
              );
            }, flag: widget.flag,
          ),
        ),
      ),
      body: Container(
        height: context.mh,
        width: context.mw,
        decoration: const BoxDecoration(
            // gradient: RadialGradient(
            //   center: Alignment.topCenter,
            //   radius: 2.0,
            //   colors: [
            //     Color(0xFFF8FAFC),
            //     Color(0xFFE2E8F0),
            //     Color(0xFFCBD5E1),
            //   ],
            // ),
            ),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getAllCementryRequest();
            controller.getActiveMorticians();
            controller.resetActiveMorticians();
            controller.getAllMorticians();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Obx(
                () {
                  switch (
                      controller.rxRequestStatusForAllCementryRequest.value) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Status.completed:
                      return Column(
                        children: [
                          StatusCountWidget(controller: controller),
                          0.01.ph(context),
                          Obx(
                            () {
                              return CementryFilterWidget(
                                searchHint: "Search by name or case ID...",
                                dropdownValue:
                                    controller.selectedFilterText.value,
                                dropdownItems: {
                                  "All": StringTranslateExtension("All").tr(),
                                  "Pending":
                                      StringTranslateExtension("Pending").tr(),
                                  "Assigned":
                                      StringTranslateExtension("Assigned").tr(),
                                },
                                searchController: _searchController,
                                onSearchChanged: (value) {
                                  controller
                                      .filterRequestUsingSearchQurey(value);
                                },
                                onDropdownChanged: (value) {
                                  controller.setSelectedFilterText(value);
                                  log("Dropdown changed: $value");
                                },
                              );
                            },
                          ),
                          0.02.ph(context),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.filterCementryCasses.length,
                            itemBuilder: (context, index) {
                              var data = controller.filterCementryCasses[index];
                              var caseDetail = (data.caseDetails != null &&
                                      data.caseDetails?.isNotEmpty == true)
                                  ? data.caseDetails![0]
                                  : null;
                              log("Selected mortician: ${controller.selectedMorticians[index]?.caseName}");
                              return CementryListWidget(
                                name:
                                    "${data.user?.firstName ?? ""} ${data.user?.lastName ?? ""}",
                                caseid:
                                    'BUR-${DateTime.now().year}-${data.id ?? ""}',
                                age: '',
                                dateOfDeath: caseDetail?.dateOfDeath ?? "N/A",
                                burrialTime:
                                    caseDetail?.caseStatus?.toUpperCase() ??
                                        "N/A",
                                familyContact: data.user?.phoneNumber ?? "",
                                preferredTime: '',
                                index: index,
                                onMorticianSelected: (mortician) {
                                  controller.setSelectedMorticianForIndex(
                                    index,
                                    mortician,
                                    data.id ?? 0,
                                    data.caseName ?? "",
                                    context,
                                  );
                                },
                                status: data.status ?? "",
                                assignedName: data.mortician?.name ?? "",
                                morticianId: data.mortician?.id ?? 0,
                                caseIdRaw: data.id ?? 0,
                                phoneNo: data.user?.phoneNumber ?? "",
                                policeCleared: caseDetail?.policeClearance,
                                graveNo: data.graveNumber ?? '',
                                burrialTiming:
                                    data.muncipalityRecord?.burialTiming ?? '',
                                preferedCemetery:
                                    data.muncipalityRecord?.preferredCemetery ??
                                        'N/A',
                                sect:
                                    "${data.muncipalityRecord?.sect ?? ''} , ${data.muncipalityRecord?.religion ?? ''}",
                                specialRequest:
                                    data.muncipalityRecord?.specialRequest ??
                                        '',
                                nameofdeceased:
                                    caseDetail?.nameOfDeceased ?? '',
                                mortiId: data.morticianId,
                                // muncipalityCleared: caseDetail.,
                              );
                            },
                          ),
                          Obx(() {
                            switch (controller
                                .rxRequestStatusForAllMorticians.value) {
                              case Status.loading:
                                return Text("");
                              case Status.completed:
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.mw * 0.02,
                                  ),
                                  child: MorticiansStatusWidget(
                                    morticians:
                                        controller.morticiansModel.value,
                                  ),
                                );
                              case Status.error:
                                return Text("Error");
                              default:
                                return SizedBox();
                            }
                          }),
                          0.01.ph(context),
                        ],
                      );
                    case Status.error:
                      return Center(child: Text("Error"));
                    default:
                      return SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var documentCubit = DiContainer().sl<HomeCubit>();
