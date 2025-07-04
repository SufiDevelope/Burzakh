import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/features/new_ui/home/ui/documnet_progress_case_details.dart';
import 'package:burzakh/features/new_ui/home/widgets/burrial_success_dialog.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BurrialProcessDetail extends StatefulWidget {
  final String caseName;
  final String userid;
  final String caseid;
  const BurrialProcessDetail(
      {super.key,
      required this.caseName,
      required this.userid,
      required this.caseid});

  @override
  State<BurrialProcessDetail> createState() => _BurrialProcessDetailState();
}

class _BurrialProcessDetailState extends State<BurrialProcessDetail> {
  final controller = Get.put(DubaiController());

  // Data variables
  String? selectedPrayerTime;
  String? selectedNationality = "uae"; // Default value
  String? selectedReligion = "islam"; // Default value
  String? selectedSect = "sunni"; // Default value
  String specialRequests = "";
  String preferedCemeteryRequests = "";

  final TextEditingController specialRequestsController =
      TextEditingController();
  final TextEditingController preferedCemeteryController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white(),
        elevation: 0.3,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColor.black(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: AppText(
          text: "Burial Process",
          color: AppColor.black(),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white(),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Burial Details",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColor.black(),
                ),
                const SizedBox(height: 20),

                // Preferred Prayer Time
                AppText(
                  text: "Preferred Prayer Time *",
                  fontSize: 14,
                  color: AppColor.black(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColor.greyLight1().withOpacity(0.23),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedPrayerTime,
                    decoration: const InputDecoration(
                      hintText: "Select prayer time",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    items: const [
                      DropdownMenuItem(value: "fajr", child: Text("Fajr")),
                      DropdownMenuItem(value: "dhuhr", child: Text("Dhuhr")),
                      DropdownMenuItem(value: "asr", child: Text("Asr")),
                      DropdownMenuItem(
                          value: "maghrib", child: Text("Maghrib")),
                      DropdownMenuItem(value: "isha", child: Text("Isha")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPrayerTime = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Nationality
                AppText(
                  text: "Nationality *",
                  fontSize: 14,
                  color: AppColor.black(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColor.greyLight1().withOpacity(0.23),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedNationality,
                    decoration: const InputDecoration(
                      hintText: "United Arab Emirates",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: "uae", child: Text("United Arab Emirates")),
                      DropdownMenuItem(
                          value: "saudi", child: Text("Saudi Arabia")),
                      DropdownMenuItem(value: "egypt", child: Text("Egypt")),
                      DropdownMenuItem(
                          value: "pakistan", child: Text("Pakistan")),
                      DropdownMenuItem(value: "india", child: Text("India")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedNationality = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 4),
                AppText(
                  text: "Auto-filled from Emirates ID - please confirm",
                  fontSize: 12,
                  color: AppColor.grey(),
                ),
                const SizedBox(height: 16),

                // Religion
                AppText(
                  text: "Religion *",
                  fontSize: 14,
                  color: AppColor.black(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColor.greyLight1().withOpacity(0.23),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedReligion,
                    decoration: const InputDecoration(
                      hintText: "Islam",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    items: const [
                      DropdownMenuItem(value: "islam", child: Text("Islam")),
                      DropdownMenuItem(
                          value: "christianity", child: Text("Christianity")),
                      DropdownMenuItem(
                          value: "hinduism", child: Text("Hinduism")),
                      DropdownMenuItem(
                          value: "buddhism", child: Text("Buddhism")),
                      DropdownMenuItem(value: "other", child: Text("Other")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedReligion = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Sect
                AppText(
                  text: "Sect *",
                  fontSize: 14,
                  color: AppColor.black(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColor.greyLight1().withOpacity(0.23),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedSect,
                    decoration: const InputDecoration(
                      hintText: "Sunni",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    items: const [
                      DropdownMenuItem(value: "sunni", child: Text("Sunni")),
                      DropdownMenuItem(value: "shia", child: Text("Shia")),
                      DropdownMenuItem(value: "sufi", child: Text("Sufi")),
                      DropdownMenuItem(value: "other", child: Text("Other")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedSect = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                AppText(
                  text: "Prefered Cemetery",
                  fontSize: 14,
                  color: AppColor.black(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.greyLight1().withOpacity(0.23),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: preferedCemeteryController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: "Select prefered cemetery",
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        preferedCemeteryRequests = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Special Requests
                AppText(
                  text: "Special Requests",
                  fontSize: 14,
                  color: AppColor.black(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.greyLight1().withOpacity(0.23),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: specialRequestsController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText:
                          "Any special requests or additional information",
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        specialRequests = value;
                      });
                    },
                  ),
                ),
                0.01.ph(context),
                GestureDetector(
                  onTap: () {
                    // Validate required fields
                    if (selectedPrayerTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please select a prayer time")),
                      );
                      return;
                    }

                    controller.submitRequestToMunicipality(
                      "UAE",
                      widget.userid,
                      widget.caseName,
                      selectedPrayerTime ?? "",
                      selectedSect ?? "",
                      selectedReligion ?? "",
                      specialRequests.isEmpty
                          ? "No special requests"
                          : specialRequests,
                      context,
                      preferedCemeteryController.text,
                      widget.caseid,
                    );

                    // Reset the form
                    selectedPrayerTime = null;
                    selectedSect = null;
                    selectedReligion = null;
                    specialRequests = "";
                    specialRequestsController.clear();
                  },
                  child: Obx(
                    () {
                      return Container(
                        height: context.mh * 0.05,
                        width: context.mw,
                        decoration: BoxDecoration(
                          color: AppColor.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: controller.submitLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColor.white(),
                              ))
                            : Center(
                                child: AppText(
                                  text: "Submit Burial Permit Request",
                                  color: AppColor.white(),
                                  fontSize: context.mh * 0.014,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    specialRequestsController.dispose();
    super.dispose();
  }
}
