import 'dart:developer';
import 'package:burzakh/Model/AdminModels/AmbulancesModel/ambulancesModel.dart';
import 'package:burzakh/Model/AdminModels/DubaiChatModel/dubai_chat_model.dart';
import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';
import 'package:burzakh/Repository/AdminRepos/DubaiAdminRepo/dubai_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/DubaiAdminRepo/dubai_admin_repo.dart';
import 'package:burzakh/Repository/AdminRepos/RtaAdminRepo/rta_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/RtaAdminRepo/rta_admin_repo.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/emirati_svcs/data/model/GetCaseNameModel.dart';
import 'package:burzakh/features/home/presentation/controller/cubit.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/home/widgets/burrial_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DubaiController extends GetxController {
  var _homeCubit = DiContainer().sl<HomeCubit>();
  final notification = NotificationService();

  onInit() {
    super.onInit();
  }

  var selectedIndex = 0.obs;

  void selectTab(int index, String status) {
    selectedIndex.value = index;
    if (selectedIndex.value == 5) {
      getAmbulanceApi();
    } else {
      filterRequestUsingStatus(status);
    }
  }

  void resetToFirst() {
    selectedIndex.value = 0;
  }

  var model = DubaiMuncipalityRequestModel().obs;
  final rxRequestStatusForAllDubaiRequest = Status.loading.obs;
  final DubaiAdminRepo repo = DubaiAdminHttpRepo();

  RxList<DubaiMuncipalityReqestData> dubaiRequestList =
      <DubaiMuncipalityReqestData>[].obs;
  RxList<DubaiMuncipalityReqestData> filterRequestList =
      <DubaiMuncipalityReqestData>[].obs;

  void setRxRequestStatusForAllDubaiRequest(Status value) =>
      rxRequestStatusForAllDubaiRequest.value = value;
  void setGetRequestApiResponse(DubaiMuncipalityRequestModel data) {
    model.value = data;
    dubaiRequestList.value = data.allRequests ?? [];
    filterRequestList.value = dubaiRequestList;
    burialCases.value =
        (data.allRequests ?? []).map((e) => e.caseName.toString()).toList();
  }

  void getRequestApi() async {
    setRxRequestStatusForAllDubaiRequest(Status.loading);
    repo.getDubaiRequest().then((value) {
      setGetRequestApiResponse(value);
      setRxRequestStatusForAllDubaiRequest(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForAllDubaiRequest(Status.error);
    });
  }

  // Filter Using Search Query
  void filterRequestUsingSearchQurey(query) {
    if (query.isEmpty) {
      filterRequestList.value = dubaiRequestList.toList();
    } else {
      filterRequestList.value = dubaiRequestList
          .where((element) =>
              (element.caseName?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (element.user?.firstName
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.user?.lastName
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.caseDetails!
                  .map((e) => e.toString().toLowerCase())
                  .join(' ')
                  .contains(query.toLowerCase())))
          .toList();
    }
  }

  // Filter on the basis of the status
  void filterRequestUsingStatus(String status) {
    if (status == 'All') {
      filterRequestList.value = dubaiRequestList.toList();
    } else {
      filterRequestList.value = dubaiRequestList
          .where((element) => element.status == status)
          .toList();
    }
  }

  // loading
  var loading = false.obs;

  void setLoading(bool value) {
    loading.value = value;
  }

  void sendDubaiSupportMessage(String message, userid, deviceToken) async {
    try {
      setLoading(true);
      notification
          .sendNotification("New Message From Dubai Muncipality", message, deviceToken)
          .then((value) async {
        await repo.sendSupportMessage(userid, message).then((value) {
          setLoading(false);
          log(value.toString());
          getDubaiChatApi(userid);
        }).onError((error, stackTrace) {
          setLoading(false);
          log(error.toString());
        });
      }).onError((error, stackTrace) {
        setLoading(false);
        log(error.toString());
      });
    } catch (e) {
      setLoading(false);
      log(e.toString());
    }
  }

  var chatmodel = DubaiChatModel().obs;
  final rxRequestStatusForAllDubaiRequestChat = Status.loading.obs;

  void setRxRequestStatusForAllDubaiRequestChat(Status value) =>
      rxRequestStatusForAllDubaiRequestChat.value = value;
  void setGetRequesForDubaiChat(DubaiChatModel data) {
    chatmodel.value = data;
  }

  void getDubaiChatApi(caseId) async {
    setRxRequestStatusForAllDubaiRequestChat(Status.loading);
    repo.getSupportMessage(caseId).then((value) {
      setGetRequesForDubaiChat(value);
      setRxRequestStatusForAllDubaiRequestChat(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForAllDubaiRequestChat(Status.error);
    });
  }

  var ambulanceModel = AmbulancesModel().obs;
  final rxRequestStatusForAllDubaiAmb = Status.loading.obs;
  RxList<Ambulances> ambulancesList = <Ambulances>[].obs;
  RxList<Ambulances> filterAmbulanceList = <Ambulances>[].obs;

  void setRxRequestStatusForAllAmbulance(Status value) =>
      rxRequestStatusForAllDubaiAmb.value = value;
  void setGetRequesForDubaiAmbulance(AmbulancesModel data) {
    ambulanceModel.value = data;
    ambulancesList.value = data.ambulances ?? [];
    filterAmbulanceList.value = ambulancesList;
  }

  void getAmbulanceApi() async {
    setRxRequestStatusForAllAmbulance(Status.loading);
    repo.getAmbulances().then((value) {
      setGetRequesForDubaiAmbulance(value);
      setRxRequestStatusForAllAmbulance(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForAllAmbulance(Status.error);
    });
  }

  // Filter Using Search Query
  void filterAmbulanceUsingSearchQurey(query) {
    if (query.isEmpty) {
      filterAmbulanceList.value = ambulancesList.toList();
    } else {
      filterAmbulanceList.value = ambulancesList
          .where((element) =>
              (element.currentLocation
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.driverName
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.vehicleNumber
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false) ||
              (element.status?.toLowerCase().contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
  }

  var graveBtnLoading = false.obs;

  setGraveBtnLoading(bool value) {
    graveBtnLoading.value = value;
  }

  void assignGraveApi(
      caseId, graveNo, BuildContext context, bool isDetails) async {
    try {
      setGraveBtnLoading(true);
      await repo.assignGraveApi(caseId, "approve", graveNo).then((value) {
        setGraveBtnLoading(false);
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
        if (isDetails == true) {
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          Navigator.pop(context);
        }
        getRequestApi();
      }).onError((error, stackTrace) {
        setGraveBtnLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )),
        );
      });
    } catch (e) {
      setGraveBtnLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      );
    }
  }

  final TextEditingController instructionsController = TextEditingController();

  var selectedAssignmentType = 'burial'.obs;
  var selectedBurialCase = ''.obs;
  var selectedMosque = ''.obs;

  var burialCases = <String>[].obs;

  var mosques = <String>[
    'Grand Mosque Dubai',
    'Jumeirah Mosque',
    'Al Farooq Omar Mosque',
    'Blue Mosque',
    'Zabeel Mosque',
  ].obs;

  @override
  void onClose() {
    instructionsController.dispose();
    super.onClose();
  }



  void updateAssignmentType(String type) {
    selectedAssignmentType.value = type;
    selectedBurialCase.value = '';
    selectedMosque.value = '';
  }

  void updateBurialCase(String? caseId) {
    selectedBurialCase.value = caseId ?? '';
    log(selectedBurialCase.value);
  }

  void updateMosque(String? mosque) {
    selectedMosque.value = mosque ?? '';
  }

  var casenameModel = CaseNameModel().obs;

  final rxRequestStatusForAllCasesName = Status.loading.obs;

  void setRxRequestStatusForAllCasesName(Status value) =>
      rxRequestStatusForAllCasesName.value = value;

  void setApiResponseForAllCasesName(CaseNameModel data) {
    casenameModel.value = data;
  }

  var submitLoading = false.obs;

  void setSubmitLoading(bool value) {
    submitLoading.value = value;
  }

  // Submit Request To Municipality
  void submitRequestToMunicipality(
      burial_place,
      user_id,
      case_name,
      burial_timing,
      sect,
      religion,
      special_request,
      BuildContext context,
      preferred_cemetery,
      caseId) async {
    try {
      setSubmitLoading(true);
      await repo
          .submitCaseToMuncipality(
        burial_place,
        user_id,
        case_name,
        burial_timing,
        sect,
        religion,
        special_request,
        preferred_cemetery,
      )
          .then((value) async {
        setSubmitLoading(false);
        log(value.toString());
        await _homeCubit.getCaseDetails(caseId);
        showDialog(
          context: context,
          builder: (context) => BurialSuccessDialog(
            onContinue: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        );
      }).onError((error, stackTrace) {
        setSubmitLoading(false);
        log(error.toString());
      });
    } catch (e) {
      setSubmitLoading(false);
      log(e.toString());
    }
  }

  void dispatchAmbulance(BuildContext context, vehicleId) async {
    try {
      await repo
          .dispatchAmbulance(
              null, selectedBurialCase.value, vehicleId, selectedMosque.value)
          .then((value) {
        log(value.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.toString()),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        );
        // Navigator.pop(context);
      }).onError((error, stackTrace) {
        log(error.toString());
      });
    } catch (e) {
      log(e.toString());
    }
  }

  final RtaAdminRepo rtarepo = RtaAdminHttpRepo();

  // loading
  var userloading = false.obs;

  void setUserLoading(bool value) {
    userloading.value = value;
  }

  void sendUserMessageApi(id, admin_type, message) {
    try {
      setUserLoading(true);
      rtarepo.sendUserChatMessage(id, admin_type, message).then((value) {
        setUserLoading(false);
        getDubaiChatApi(id);
      }).onError((error, stackTrace) {
        setUserLoading(false);
        log(error.toString());
      });
    } catch (e) {
      setUserLoading(false);
      log(e.toString());
    }
  }
}
