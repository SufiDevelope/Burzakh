import 'dart:developer';
import 'dart:io';
import 'package:burzakh/Model/AdminModels/CasesCountModel/cases_count_model.dart';
import 'package:burzakh/Model/AdminModels/FilterCassesModel/filter_casses_model.dart';
import 'package:burzakh/Repository/AdminRepos/PoliceAdminRepo/police_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/PoliceAdminRepo/police_admin_repo.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PoliceAdminController extends GetxController {
  // Use RxInt to make selectedIndex observable
  var selectedIndex = 0.obs;
  String get selectedTabStatus {
    switch (selectedIndex.value) {
      case 0:
        return "all";
      case 1:
        return "pending";
      case 2:
        return "permit_issued";
      case 3:
        return "schedule_call";
      case 4:
        return "approved";
      default:
        return "";
    }
  }

  void selectTab(int index) {
    selectedIndex.value = index;
    filterCassesApiAccordingToSelectedTab(selectedTabStatus);
  }

  void resetToFirst() {
    selectedIndex.value = 0;
  }

  final Map<String, String> filterOptions = {
    "All Cases": "all_cases",
    "Schedule Call": "schedule_call",
    "Final Approval": "awaiting_final_approval",
  };

  RxString selectedFilter = "all_cases".obs;

  List<String> get filterLabels => filterOptions.keys.toList();

  @override
  void onInit() {
    getCassesCountApi();
    filterCassesApi();
    super.onInit();
  }

  var model = CassesCountModel().obs;
  final rxRequestStatusForAllCassesCount = Status.loading.obs;
  final PoliceAdminRepo repo = PoliceAdminHttpRepo();

  // Get the Contact List From Api
  void setRxRequestStatusForGetCassesCount(Status value) =>
      rxRequestStatusForAllCassesCount.value = value;
  void setGetCassesCountApiResponse(CassesCountModel data) {
    model.value = data;
  }

  void getCassesCountApi() {
    try {
      setRxRequestStatusForGetCassesCount(Status.loading);
      repo.getCassesCount().then((value) {
        setRxRequestStatusForGetCassesCount(Status.completed);
        setGetCassesCountApiResponse(value);
      }).onError((error, stackTrace) {
        setRxRequestStatusForGetCassesCount(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForGetCassesCount(Status.error);
    }
  }

  var filterModel = FilterCassesModel().obs;
  RxList<FilterData> filterData = <FilterData>[].obs;
  RxList<FilterData> filterDataForSearch = <FilterData>[].obs;

  final rxRequestStatusForFilterCassesCount = Status.loading.obs;

  void setRxRequestStatusForFilterCassesCount(Status value) =>
      rxRequestStatusForFilterCassesCount.value = value;
  void setFilterCassesCountApiResponse(FilterCassesModel data) {
    filterModel.value = data;
    filterData.value = data.data ?? [];
    filterDataForSearch.value = data.data ?? [];
  }

  void filterCassesApi() {
    try {
      setRxRequestStatusForFilterCassesCount(Status.loading);
      repo.getFilteredCases(selectedFilter.value).then((value) {
        setRxRequestStatusForFilterCassesCount(Status.completed);
        setFilterCassesCountApiResponse(value);
      }).onError((error, stackTrace) {
        log("error ${error.toString()}");
        setRxRequestStatusForFilterCassesCount(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForFilterCassesCount(Status.error);
    }
  }

  // Schedule Call Api
  void scheduleVideoCallApi(
      userId, date, time, admin_id, meeting_id, BuildContext context) {
    try {
      repo
          .getVideoCallSchedule(userId, date, time, admin_id, meeting_id)
          .then((value) {
        Navigator.pop(context);
        log(value["message"].toString());
      }).onError((error, stackTrace) {
        log("error ${error.toString()}");
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // Filter Casess Api According to the Search qurey
  void filterCassesApiAccordingToSearchQuery(String searchQuery) {
    try {
      if (searchQuery.isEmpty) {
        filterDataForSearch.value = filterData.toList();
      } else {
        filterDataForSearch.value = filterData.where((element) {
          final firstName = element.user?.firstName?.toLowerCase() ?? '';
          final lastName = element.user?.lastName?.toLowerCase() ?? '';
          final query = searchQuery.toLowerCase();
          return firstName.contains(query) || lastName.contains(query);
        }).toList();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Filter according to the selected tab
  void filterCassesApiAccordingToSelectedTab(String selectedTab) {
    try {
      if (selectedTab == "all") {
        filterDataForSearch.value = filterData.toList();
      } else {
        filterDataForSearch.value = filterData
            .where((element) => element.caseStatus == selectedTab)
            .toList();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Image picker instance
  final ImagePicker _picker = ImagePicker();
  RxString imagePath = "".obs;

  // Pick image from gallery
  Future<void> pickImage(adminId, caseId, userId, BuildContext context) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null) {
        imagePath.value = image.path;
        policeQuickActionApi(
            adminId, userId, caseId, null, null, context, imagePath.value);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void policeQuickActionApi(
      adminId,
      userId,
      caseId,
      sendNotificationMessage,
      additionalDocument,
      BuildContext context,
      String? releasedFormPath) async {
    File? file;
    if (releasedFormPath != null && releasedFormPath.isNotEmpty) {
      file = File(releasedFormPath);
    }
    await repo
        .policeQuickActionApi(
      adminId,
      userId,
      caseId,
      file,
      sendNotificationMessage,
      additionalDocument,
    )
        .then((value) {
      log(value.toString());
      filterCassesApi();
      // Show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(value.toString()),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      log("error ${error.toString()}");
    });
  }

  // Image picker instance
  final ImagePicker _pickerApproved = ImagePicker();
  RxString imagePathapproved = "".obs;

  // Pick image from gallery
  Future<void> pickImageApproved(caseId, userId, BuildContext context) async {
    try {
      final XFile? image = await _pickerApproved.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null) {
        imagePath.value = image.path;
        approvedPoliceCaseApi(caseId, userId, File(imagePath.value), context);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void approvedPoliceCaseApi(
      caseId, userId, File clearanceForm, BuildContext context) async {
    try {
      repo.approvePoliceCaseApi(caseId, userId, clearanceForm).then((value) {
        log(value.toString());
        getCassesCountApi();
        filterCassesApi();
        Get.snackbar(
          'Success',
          'Case Approved',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        log("error ${error.toString()}");
        Get.snackbar(
          'Error',
          'Failed to approve case',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        'Failed to approve case',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final ImagePicker _pickerUploadUser = ImagePicker();
  RxString imagePathUploadUser = "".obs;

  // Pick image from gallery
  Future<void> pickImageUploadUser(caseId, userId, BuildContext context) async {
    try {
      final XFile? image = await _pickerApproved.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null) {
        imagePath.value = image.path;
        uploadAdditionalDocument(
            caseId, userId, File(imagePath.value), context);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void uploadAdditionalDocument(
      caseId, userId, File additionalDocument, BuildContext context) {
    try {
      repo
          .uploadAdditionalDocument(caseId, userId, additionalDocument)
          .then((value) {
        log(value.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.toString()),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }).onError((error, stackTrace) {
        log("error ${error.toString()}");
        Get.snackbar(
          'Error',
          'Failed to approve case',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        'Failed to approve case',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
