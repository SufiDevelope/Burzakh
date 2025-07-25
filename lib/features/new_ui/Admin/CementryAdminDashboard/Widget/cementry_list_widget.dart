import 'dart:developer';
import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/Model/AdminModels/GetActiveMorticianModel/get_active_mortician_model.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Controller/cementry_controller.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/create_whatsapp_announcement_dialog.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/currently_assigned_widget.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/custom_gradient_color.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/profile_display_info_container.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/Widget/send_visitor_portal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/Response/status.dart';

class CementryListWidget extends StatelessWidget {
  final String name;
  final String caseid;
  final String age;
  final String dateOfDeath;
  final String burrialTime;
  final String familyContact;
  final String preferredTime;
  final int index;
  final Function(ActiveMorticians) onMorticianSelected;
  final String status;
  final String assignedName;
  final morticianId;
  final caseIdRaw;
  final String phoneNo;
  final String? policeCleared;
  final String? muncipalityCleared;
  final String graveNo;
  final String burrialTiming;
  final String preferedCemetery;
  final String sect;
  final String specialRequest;
  final String nameofdeceased;
  final dynamic mortiId;

  CementryListWidget({
    super.key,
    required this.name,
    required this.caseid,
    required this.age,
    required this.dateOfDeath,
    required this.burrialTime,
    required this.familyContact,
    required this.preferredTime,
    required this.index,
    required this.onMorticianSelected,
    required this.status,
    required this.assignedName,
    required this.morticianId,
    required this.caseIdRaw,
    required this.phoneNo,
    this.policeCleared,
    this.muncipalityCleared,
    required this.graveNo,
    required this.burrialTiming,
    required this.preferedCemetery,
    required this.sect,
    required this.specialRequest,
    required this.nameofdeceased,
    required this.mortiId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CementryController>();
    log(controller.isMorticainEdited.value.toString());
    return Container(
      height: mortiId != null ? context.mh * 0.8 : context.mh * 0.75,
      width: context.mw,
      margin: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: context.mh * 0.006,
            width: context.mw,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff596e84),
                  Color(0xff617890),
                  Color(0xff2d4159),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(context.mw * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: context.mh * 0.020,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6B7280),
                              height: 1.2,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                caseid,
                                style: TextStyle(
                                  fontSize: context.mh * 0.015,
                                  color: Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (policeCleared != null)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.025,
                                  vertical: context.mh * 0.005),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffd9e2ec),
                                    Color(0xffbcccdc),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue.shade100,
                              ),
                              child: Text(
                                "Police Cleared",
                                style: TextStyle(
                                  fontSize: context.mh * 0.013,
                                  color: Color(0xff243b53),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          0.01.ph(context),
                          if (muncipalityCleared != null)
                            Container(
                              // height: context.mh * 0.03,
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.025,
                                  vertical: context.mh * 0.005),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffd9e2ec),
                                    Color(0xffbcccdc),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue.shade100,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: context.mh * 0.02,
                                  ),
                                  0.01.pw(context),
                                  Center(
                                    child: Text(
                                      "Muncipality Cleared".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: context.mh * 0.013,
                                         color: Color(0xff243b53),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          0.01.ph(context),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.mw * 0.025,
                                vertical: context.mh * 0.005),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffd9e2ec),
                                  Color(0xffbcccdc),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue.shade100,
                            ),
                            child: Center(
                              child: Text(
                                status.toUpperCase(),
                                style: TextStyle(
                                  fontSize: context.mh * 0.013,
                                  color: Color(0xff243b53),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          0.01.ph(context),
                        ],
                      ),
                    ],
                  ),
                  ProfileDisplayInfoContainer(
                    dateOfDeath: dateOfDeath,
                    burialTime: burrialTime,
                    familyContact: familyContact,
                    preferredTime: preferredTime,
                    graveNo: graveNo,
                    burrialTiming: burrialTiming,
                    preferedCemetery: preferedCemetery,
                    sect: sect,
                    specialRequest: specialRequest,
                    nameofdeceased: nameofdeceased,
                  ),
                  0.02.ph(context),
                  // Assign Mortician Section
                  Row(
                    children: [
                      Text(
                        "ASSIGN MORTICIAN",
                        style: TextStyle(
                          fontSize: context.mh * 0.015,
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      0.03.pw(context),
                      Obx(() {
                        switch (controller
                            .rxRequestStatusForActiveMorticians.value) {
                          case Status.loading:
                            return const Text("Loading...");
                          case Status.completed:
                            return Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFE5E7EB),
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: mortiId != null &&
                                        controller.isMorticainEdited.value ==
                                            false
                                    ? CurrentlyAssignedWidget(
                                        name: assignedName,
                                        onEditTap: () {
                                          controller.setIsMorticainEdited(true);
                                        },
                                        onRemoveTap: () {
                                          controller.removeMorticianFromCase(
                                            caseIdRaw,
                                          );
                                        },
                                      )
                                    : Obx(
                                        () {
                                          final selectedMortician = controller
                                              .selectedMorticians[index];
                                          return DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedMortician?.id
                                                  ?.toString(),
                                              hint: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        context.mw * 0.04),
                                                child: Text(
                                                  "Select Mortician",
                                                  style: TextStyle(
                                                    fontSize:
                                                        context.mh * 0.016,
                                                    color:
                                                        const Color(0xFF9CA3AF),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              isExpanded: true,
                                              icon: Padding(
                                                padding: EdgeInsets.only(
                                                    right: context.mw * 0.03),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color:
                                                      const Color(0xFF9CA3AF),
                                                  size: context.mh * 0.025,
                                                ),
                                              ),
                                              dropdownColor: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              elevation: 8,
                                              items: controller.activeMorticians
                                                  .map((mortician) {
                                                return DropdownMenuItem<String>(
                                                  value:
                                                      mortician.id?.toString(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                context.mw *
                                                                    0.04),
                                                    child: Text(
                                                      mortician.name ?? '',
                                                      style: TextStyle(
                                                        fontSize:
                                                            context.mh * 0.016,
                                                        color: const Color(
                                                            0xFF374151),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newId) {
                                                if (newId != null) {
                                                  final selected = controller
                                                      .activeMorticians
                                                      .firstWhere((e) =>
                                                          e.id?.toString() ==
                                                          newId);
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    onMorticianSelected(
                                                        selected);
                                                  });
                                                }
                                              },
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            );
                          case Status.error:
                            return const Text("Error loading morticians.");
                          default:
                            return const SizedBox.shrink();
                        }
                      })
                    ],
                  ),
                  0.02.ph(context),
                  // Containers Section
                  Column(
                    children: [
                      CustomGradientButton(
                        text: "Send WhatsApp",
                        primaryColor: Colors.green,
                        icon: Icons.chat_bubble_outline,
                        onTap: () {
                          log("Send WhatsApp");
                          showDialog(
                            context: context,
                            builder: (context) =>
                                const CreateWhatsappAnnouncementDialog(),
                          );
                        },
                      ),
                      0.01.ph(context),
                      CustomGradientButton(
                        text: "Call Family",
                        primaryColor: Colors.blue,
                        icon: Icons.call,
                        onTap: () {
                          launchUrl(Uri.parse("tel:$phoneNo"));
                        },
                      ),
                      0.01.ph(context),
                      CustomGradientButton(
                        text: "Send to Portal",
                        primaryColor: Colors.black87,
                        icon: Icons.system_update_tv_outlined,
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => SendtoVisitorAlertDialog(
                              nameEnglish: name,
                              nameArabic: "جون دو",
                              alertTime: burrialTiming,
                              mosqueName: "",
                              descriptionEnglish: "",
                              descriptionArabic: "",
                              cemeteryLoaction: preferedCemetery,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
