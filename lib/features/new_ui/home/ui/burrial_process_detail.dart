import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/Controller/dubai_controller.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class BurrialProcessDetail extends StatefulWidget {
  final String caseName;
  final String userid;
  final String caseid;
  const BurrialProcessDetail({
    super.key,
    required this.caseName,
    required this.userid,
    required this.caseid,
  });

  @override
  State<BurrialProcessDetail> createState() => _BurrialProcessDetailState();
}

class _BurrialProcessDetailState extends State<BurrialProcessDetail> {
  final controller = Get.put(DubaiController());

  // Data variables
  String? selectedPrayerTime;
  String? selectedNationality = "uae";
  String? selectedReligion = "islam";
  String? selectedSect = "sunni";
  String specialRequests = "";
  String preferedCemeteryRequests = "";
  TimeOfDay? customTime;

  final TextEditingController specialRequestsController =
      TextEditingController();
  final TextEditingController preferedCemeteryController =
      TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: customTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != customTime) {
      setState(() {
        customTime = picked;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String _getFinalPrayerTime() {
    if (selectedPrayerTime == "custom" && customTime != null) {
      return _formatTime(customTime!);
    }
    return selectedPrayerTime ?? "";
  }

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
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: "fajr", child: Text("Fajr (Dawn Prayer)")),
                      DropdownMenuItem(
                          value: "dhuhr", child: Text("Dhuhr (Noon Prayer)")),
                      DropdownMenuItem(
                          value: "asr", child: Text("Asr (Afternoon Prayer)")),
                      DropdownMenuItem(
                          value: "maghrib",
                          child: Text("Maghrib (Sunset Prayer)")),
                      DropdownMenuItem(
                          value: "isha", child: Text("Isha (Night Prayer)")),
                      DropdownMenuItem(
                          value: "custom", child: Text("Custom Time")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPrayerTime = value;
                        if (value != "custom") {
                          customTime = null;
                        }
                      });
                    },
                  ),
                ),

                if (selectedPrayerTime == "custom") ...[
                  const SizedBox(height: 16),
                  AppText(
                    text: "Select Custom Time *",
                    fontSize: 14,
                    color: AppColor.black(),
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColor.greyLight1().withOpacity(0.23),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Icon(
                            Icons.access_time,
                            color: AppColor.grey(),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppText(
                              text: customTime != null
                                  ? _formatTime(customTime!)
                                  : "Select time",
                              fontSize: 14,
                              color: customTime != null
                                  ? AppColor.black()
                                  : AppColor.grey(),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColor.grey(),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                ],

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
                      hintText: "",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    items: [
                      DropdownMenuItem(
                          value: "uae",
                          child: Text(
                              StringTranslateExtension("United Arab Emirates")
                                  .tr())),
                      DropdownMenuItem(
                          value: "saudi",
                          child: Text(
                              StringTranslateExtension("Saudi Arabia").tr())),
                      DropdownMenuItem(
                          value: "egypt",
                          child: Text(StringTranslateExtension("Egypt").tr())),
                      DropdownMenuItem(
                          value: "pakistan",
                          child:
                              Text(StringTranslateExtension("Pakistan").tr())),
                      DropdownMenuItem(
                          value: "india",
                          child: Text(StringTranslateExtension("India").tr())),
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
                    items: [
                      DropdownMenuItem(
                          value: "islam",
                          child: Text(StringTranslateExtension("Islam").tr())),
                      DropdownMenuItem(
                          value: "christianity",
                          child: Text(
                              StringTranslateExtension("Christianity").tr())),
                      DropdownMenuItem(
                          value: "hinduism",
                          child:
                              Text(StringTranslateExtension("Hinduism").tr())),
                      DropdownMenuItem(
                          value: "buddhism",
                          child:
                              Text(StringTranslateExtension("Buddhism").tr())),
                      DropdownMenuItem(
                          value: "other",
                          child: Text(StringTranslateExtension("Other").tr())),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedReligion = value;
                        // Reset sect when religion changes and it's not Islam
                        if (value != "islam") {
                          selectedSect = null;
                        } else {
                          // Set default sect when Islam is selected
                          selectedSect = "sunni";
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Sect - Only visible when religion is Islam
                if (selectedReligion == "islam") ...[
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
                ],

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
                    decoration:  InputDecoration(
                      hintText:
                          StringTranslateExtension("Any special requests or additional information").tr(),
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

                    // Validate custom time if selected
                    if (selectedPrayerTime == "custom" && customTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please select a custom time")),
                      );
                      return;
                    }

                    // Validate sect if religion is Islam
                    if (selectedReligion == "islam" && selectedSect == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a sect")),
                      );
                      return;
                    }

                    controller.submitRequestToMunicipality(
                      "UAE",
                      widget.userid,
                      widget.caseName,
                      _getFinalPrayerTime(),
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
                    customTime = null;
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
    preferedCemeteryController.dispose();
    super.dispose();
  }
}
