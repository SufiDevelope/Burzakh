import 'dart:developer';

import 'package:burzakh/Model/AdminModels/CementryCassesModel/cementry_casses_model.dart';
import 'package:burzakh/Model/AdminModels/GetActiveMorticianModel/get_active_mortician_model.dart';
import 'package:burzakh/Model/AdminModels/MorticianModel/mortician_model.dart';
import 'package:burzakh/Repository/AdminRepos/CementryAdminRepo/cementry_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/CementryAdminRepo/cementry_admin_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../data/Response/status.dart';

class CementryController extends GetxController {
  final selectedFilterText = 'All'.obs;

  void setSelectedFilterText(String text) {
    selectedFilterText.value = text;
    filterRequestUsingStatus(text);
  }

  @override
  void onInit() {
    super.onInit();
    getAllCementryRequest();
    getActiveMorticians();
    getAllMorticians();
  }

  var model = CementryCassesModel().obs;
  final rxRequestStatusForAllCementryRequest = Status.loading.obs;
  final CementryAdminRepo repo = CementryAdminHttpRepo();
  RxList<CementryCassesData> allCementryCasses = <CementryCassesData>[].obs;
  RxList<CementryCassesData> filterCementryCasses = <CementryCassesData>[].obs;

  void setRxRequestStatusForAllCementryRequest(Status value) =>
      rxRequestStatusForAllCementryRequest.value = value;
  void setGetRequestApiResponse(CementryCassesModel data) {
    model.value = data;
    allCementryCasses.value = data.cases ?? [];
    filterCementryCasses.value = data.cases ?? [];
  }

  void getAllCementryRequest() async {
    try {
      setRxRequestStatusForAllCementryRequest(Status.loading);
      repo.getCementryCasses().then((value) {
        setGetRequestApiResponse(value);
        setRxRequestStatusForAllCementryRequest(Status.completed);
      }).onError((error, stackTrace) {
        setRxRequestStatusForAllCementryRequest(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForAllCementryRequest(Status.error);
    }
  }

  var activeMorticiansModel = GetActiveMorticiansModel().obs;
  final rxRequestStatusForActiveMorticians = Status.loading.obs;

  RxBool isMorticainEdited = false.obs;
  void setIsMorticainEdited(bool value) {
    isMorticainEdited.value = value;
  }

  RxList<ActiveMorticians> activeMorticians = <ActiveMorticians>[].obs;

  RxMap<int, ActiveMorticians> selectedMorticians =
      <int, ActiveMorticians>{}.obs;

  void setSelectedMorticianForIndex(int index, ActiveMorticians value, caseId,
      casename, BuildContext context) {
    selectedMorticians[index] = value;
    assignMorticianApi(caseId, value.id, casename, context);
  }

  void setRxRequestStatusForActiveMorticians(Status value) =>
      rxRequestStatusForActiveMorticians.value = value;
  void setGetActiveMorticiansApiResponse(GetActiveMorticiansModel data) {
    activeMorticiansModel.value = data;
    activeMorticians.value = data.morticians ?? [];
  }

  void resetActiveMorticians() {
    selectedFilterText.value = 'All';
    selectedMorticians.value = {};
    selectedMorticians.refresh();
  }

  void getActiveMorticians() async {
    try {
      setRxRequestStatusForActiveMorticians(Status.loading);
      repo.getActiveMorticians().then((value) {
        setGetActiveMorticiansApiResponse(value);
        setRxRequestStatusForActiveMorticians(Status.completed);
      }).onError((error, stackTrace) {
        setRxRequestStatusForActiveMorticians(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForActiveMorticians(Status.error);
    }
  }

  void assignMorticianApi(
      caseId, morticianId, casename, BuildContext context) async {
    try {
      log(casename.toString());
      repo.activeMorticiansApi(caseId, morticianId, casename).then((value) {
        log(value.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(value.toString()),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
        );
        log(isMorticainEdited.toString());
        setIsMorticainEdited(false);
        selectedMorticians.refresh();
        getAllCementryRequest();
      }).onError((error, stackTrace) {
        log(error.toString());
      });
    } catch (e, stackTrace) {
      log("error" + e.toString(), stackTrace: stackTrace);
    }
  }

  final nameEnglishController = TextEditingController();
  final nameArabicController = TextEditingController();
  final descriptionEnglishController = TextEditingController();
  final descriptionArabicController = TextEditingController();
  final mosqueNameController = TextEditingController();
  final alertTimeController = TextEditingController();

  var selectedGender = 'Male'.obs;
  var selectedCemeteryLocation = 'Al Qusais Cemetery'.obs;
  var selectedStatus = 'Confirmed'.obs;
  var isImportantAlert = false.obs;

  final genderOptions = ['Male', 'Female'];
  final cemeteryOptions = [
    'Al Qusais Cemetery',
    'Al Warqa Cemetery',
    'Jumeirah Cemetery',
    'Dubai Silicon Oasis Cemetery',
    'Other Cemetery'
  ];
  final statusOptions = ['Confirmed', 'Pending', 'Cancelled'];

  void toggleImportantAlert() {
    isImportantAlert.value = !isImportantAlert.value;
  }

  RxBool publishLoading = false.obs;

  void setPublishLoading(bool value) {
    publishLoading.value = value;
  }

  void createVisitorAlertApi(BuildContext context) async {
    setPublishLoading(true);
    repo
        .createVisitorAlertApi(
      nameEnglishController.text,
      selectedGender.value,
      alertTimeController.text,
      selectedCemeteryLocation.value,
      mosqueNameController.text,
      descriptionEnglishController.text,
      descriptionArabicController.text,
      selectedStatus.value,
      isImportantAlert.value,
    )
        .then((value) {
      log(value.toString());
      setPublishLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(value.toString()),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
      );

      nameEnglishController.clear();
      nameArabicController.clear();
      descriptionEnglishController.clear();
      descriptionArabicController.clear();
      mosqueNameController.clear();
      alertTimeController.clear();
      selectedGender.value = 'Male';
      selectedCemeteryLocation.value = 'Al Qusais Cemetery';
      selectedStatus.value = 'Confirmed';
      isImportantAlert.value = false;
      isImportantAlert.refresh();
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      log(error.toString());
      setPublishLoading(false);
    });
  }

  // WhatsApp Announcement Variables
  final whatsappDeceasedNameController = TextEditingController();
  final whatsappNationalityController = TextEditingController();
  final whatsappOptionalNoteController = TextEditingController();

  var selectedWhatsappGender = 'Male'.obs;
  var selectedWhatsappPrayerTime = 'Dhuhr / ظهر'.obs;
  var selectedWhatsappBurialLocation = 'Waab Al Aqar Cemetery - Hatta'.obs;
  var isWhatsappPreviewToggled = false.obs;

  final prayerTimeOptions = [
    'Fajr / الفجر',
    'Dhuhr / ظهر',
    'Asr / العصر',
    'Maghrib / المغرب',
    'Isha / العشاء'
  ];

  final burialLocationOptions = [
    'Waab Al Aqar Cemetery - Hatta',
    'Al Qusais Cemetery',
    'Al Warqa Cemetery',
    'Jumeirah Cemetery',
    'Dubai Silicon Oasis Cemetery',
    'Other Cemetery'
  ];

  RxBool whatsappPublishLoading = false.obs;

  void setSelectedWhatsappGender(String value) {
    selectedWhatsappGender.value = value;
  }

  void setSelectedWhatsappPrayerTime(String value) {
    selectedWhatsappPrayerTime.value = value;
  }

  void setSelectedWhatsappBurialLocation(String value) {
    selectedWhatsappBurialLocation.value = value;
  }

  void toggleWhatsappPreview() {
    isWhatsappPreviewToggled.value = !isWhatsappPreviewToggled.value;
  }

  void setWhatsappPublishLoading(bool value) {
    whatsappPublishLoading.value = value;
  }

  void resetWhatsappForm() {
    whatsappDeceasedNameController.clear();
    whatsappNationalityController.clear();
    whatsappOptionalNoteController.clear();
    selectedWhatsappGender.value = 'Male';
    selectedWhatsappPrayerTime.value = 'Dhuhr / ظهر';
    selectedWhatsappBurialLocation.value = 'Waab Al Aqar Cemetery - Hatta';
    isWhatsappPreviewToggled.value = false;
  }

  void sendWhatsappAnnouncement() async {
    setWhatsappPublishLoading(true);

    try {
      final name = whatsappDeceasedNameController.text.trim();
      final nationality = whatsappNationalityController.text.trim();
      final note = whatsappOptionalNoteController.text.trim();
      final gender = selectedWhatsappGender.value;
      final prayerTime = selectedWhatsappPrayerTime.value;
      final burialLocation = selectedWhatsappBurialLocation.value;

      if (name.isEmpty || nationality.isEmpty) {
        setWhatsappPublishLoading(false);
        return;
      }

      final message = '''
        *Funeral Announcement*
         Deceased: $name
         Gender: $gender
         Nationality: $nationality
         Prayer Time: $prayerTime
         Burial Location: $burialLocation
         ${note.isNotEmpty ? "Note: $note" : ""}
        ''';

      final url =
          Uri.parse("https://wa.me/?text=${Uri.encodeComponent(message)}");

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print("WhatsApp not available");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setWhatsappPublishLoading(false);
    }
  }

  // Filter List According to Qurey
  void filterRequestUsingSearchQurey(query) {
    if (query.isEmpty) {
      filterCementryCasses.value = allCementryCasses.toList();
    } else {
      filterCementryCasses.value = allCementryCasses
          .where((element) =>
              (element.caseName?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (element.graveNumber
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.user?.firstName
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.user?.lastName
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
  }

  // Filter List According to the status Dropdown
  void filterRequestUsingStatus(String status) {
    if (status == 'All') {
      filterCementryCasses.value = allCementryCasses.toList();
    } else {
      filterCementryCasses.value = allCementryCasses
          .where((element) => element.status == status)
          .toList();
    }
  }

  // Remove Mortician from the case
  void removeMorticianFromCase(morticianId) async {
    try {
      repo.removeMorticianApi(morticianId).then((value) {
        log(value.toString());
        getAllCementryRequest();
      }).onError((error, stackTrace) {
        log(error.toString());
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // Get All Morticians
  var morticiansModel = MorticianModel().obs;
  final rxRequestStatusForAllMorticians = Status.loading.obs;

  void setRxRequestStatusForAllMorticians(Status value) =>
      rxRequestStatusForAllMorticians.value = value;
  void setGetAllMorticiansApiResponse(MorticianModel data) {
    morticiansModel.value = data;
  }

  void getAllMorticians() async {
    try {
      setRxRequestStatusForAllMorticians(Status.loading);
      repo.getAllMorticians().then((value) {
        setGetAllMorticiansApiResponse(value);
        setRxRequestStatusForAllMorticians(Status.completed);
      }).onError((error, stackTrace) {
        setRxRequestStatusForAllMorticians(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForAllMorticians(Status.error);
    }
  }
}
