import 'dart:developer';

import 'package:burzakh/Model/AdminModels/CdaFilterRequestApi/cda_filter_request_api.dart';
import 'package:burzakh/Model/AdminModels/CdaRequestDetailsModel/cda_request_details_model.dart';
import 'package:burzakh/Model/AdminModels/CdaRequestModel/cda_request_model.dart';
import 'package:burzakh/Model/AdminModels/RtaChatModel/rta_chat_model.dart';
import 'package:burzakh/Repository/AdminRepos/CdaAdminRepo/cda_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/CdaAdminRepo/cda_admin_repo.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../RoadsAndTransportAuthorityAdmin/Widgets/dashboard_overview_widget.dart';

class CdaController extends GetxController {
  @override
  void onInit() {
    getRequestApi();
    filterRtaRequestApi("None");
    super.onInit();
  }

  var selectedIndex = 0.obs;

  void selectTab(int index, String status) {
    selectedIndex.value = index;
    filterCassesApiAccordingToStatus(status);
  }

  void resetToFirst() {
    selectedIndex.value = 0;
  }

  var selectedTimeRange = TimeRange.week.obs;

  void updateTimeRange(TimeRange range) {
    selectedTimeRange.value = range;
    log(range.name.toString());
    if (range.name == "day") {
      filterRtaRequestApi("this_day");
    } else if (range.name == "week") {
      filterRtaRequestApi("this_week");
    } else if (range.name == "month") {
      filterRtaRequestApi("this_month");
    }
  }

  final Map<String, String> filterOptions = {
    "All Request": "None",
    "This Week": "this_week",
    "This Month": "this_month",
  };

  RxString selectedFilter = "None".obs;

  List<String> get filterLabels => filterOptions.keys.toList();

  var model = CdaRequestModel().obs;
  final rxRequestStatusForAllRtaRequest = Status.loading.obs;
  final CdaAdminRepo repo = CdaAdminHttpRepo();

  // Get the Contact List From Api
  void setRxRequestStatusForAllRtaRequest(Status value) =>
      rxRequestStatusForAllRtaRequest.value = value;
  void setGetRequestApiResponse(CdaRequestModel data) {
    model.value = data;
  }

  void getRequestApi() async {
    setRxRequestStatusForAllRtaRequest(Status.loading);
    repo.getCdaRequest().then((value) {
      setGetRequestApiResponse(value);
      setRxRequestStatusForAllRtaRequest(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForAllRtaRequest(Status.error);
    });
  }

  var filteredModel = CdaFilterRequestModel().obs;
  final rxRequestStatusForfilterRtaRequest = Status.loading.obs;

  final RxList<CdaFilterRequestData> filterList = <CdaFilterRequestData>[].obs;
  final RxList<CdaFilterRequestData> allFilterList =
      <CdaFilterRequestData>[].obs;

  void setRxRequestStatusForfilterRtaRequest(Status value) =>
      rxRequestStatusForfilterRtaRequest.value = value;
  void setGetRequestFilterApiResponse(CdaFilterRequestModel data) {
    filteredModel.value = data;
    allFilterList.value = data.data ?? [];
    filterList.value = data.data!;
  }

  void filterRtaRequestApi(status) async {
    setRxRequestStatusForfilterRtaRequest(Status.loading);
    repo.getCdaFilterRequest(status).then((value) {
      setGetRequestFilterApiResponse(value);
      setRxRequestStatusForfilterRtaRequest(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForfilterRtaRequest(Status.error);
    });
  }

  // Filter Casess Api According to the Search qurey
  void filterCassesApiAccordingToSearchQuery(String searchQuery) {
    try {
      if (searchQuery.isEmpty) {
        filterList.value = allFilterList.toList();
      } else {
        filterList.value = allFilterList
            .where((element) =>
                (element.user?.firstName
                        ?.toLowerCase()
                        .contains(searchQuery.toLowerCase()) ??
                    false) ||
                (element.user?.lastName
                        ?.toLowerCase()
                        .contains(searchQuery.toLowerCase()) ??
                    false) ||
                (element.locationOfTent
                        ?.toLowerCase()
                        .contains(searchQuery.toLowerCase()) ??
                    false))
            .toList();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Filter on the basis of status
  void filterCassesApiAccordingToStatus(String status) {
    try {
      if (status == "All") {
        filterList.value = allFilterList.toList();
      } else {
        filterList.value =
            allFilterList.where((element) => element.status == status).toList();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  var cdaDetailsModel = CdaRequestDetailsModel().obs;
  final rxRequestStatusForRtaRequestDetails = Status.loading.obs;

  // Get the Contact List From Api
  void setRxRequestStatusForCdaRequestDetails(Status value) =>
      rxRequestStatusForRtaRequestDetails.value = value;
  void setGetRequestApiResponseDetails(CdaRequestDetailsModel data) {
    cdaDetailsModel.value = data;
  }

  void getCdaRequestDetailsApi(id) async {
    setRxRequestStatusForCdaRequestDetails(Status.loading);
    repo.getCdaRequestDetails(id).then((value) {
      setGetRequestApiResponseDetails(value);
      setRxRequestStatusForCdaRequestDetails(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForCdaRequestDetails(Status.error);
    });
  }

  // loading
  var approvedloading = false.obs;

  void setapprovedLoading(bool value) {
    approvedloading.value = value;
  }

  var rejectloading = false.obs;

  void setrejectLoading(bool value) {
    rejectloading.value = value;
  }

  void updateCdaRequestStatusApi(id, status, BuildContext context) async {
    try {
      if (status == "approve") {
        setapprovedLoading(true);
      } else {
        setrejectLoading(true);
      }
      repo.updateCdaRequestStatus(id, status).then((value) {
        if (status == "approve") {
          setapprovedLoading(false);
        } else {
          setrejectLoading(false);
        }
        getRequestApi();
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        if (status == "approve") {
          setapprovedLoading(false);
        } else {
          setrejectLoading(false);
        }
        log(error.toString());
      });
    } catch (e) {
      if (status == "approve") {
        setapprovedLoading(false);
      } else {
        setrejectLoading(false);
      }
      log(e.toString());
    }
  }

  var rtaChatModel = RtaChatModel().obs;
  RxList<RtaChatData> cdaChatList = <RtaChatData>[].obs;
  RxList<RtaChatData> cdafilterChatList = <RtaChatData>[].obs;
  final rxRequestStatusForCdaChat = Status.loading.obs;
  void setRxRequestStatusForCdaChat(Status value) =>
      rxRequestStatusForCdaChat.value = value;
  void setGetRequesForCdaChat(RtaChatModel data) {
    rtaChatModel.value = data;
    cdaChatList.value = data.data ?? [];
    cdafilterChatList.value = data.data ?? [];
  }

  void getCdaChatApi(userId) async {
    setRxRequestStatusForCdaChat(Status.loading);
    repo.getCdaChat(userId).then((value) {
      setGetRequesForCdaChat(value);
      setRxRequestStatusForCdaChat(Status.completed);
      // filterCdaChatAccordingtoUserId(userId);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForCdaChat(Status.error);
    });
  }

  filterCdaChatAccordingtoUserId(int userId) {
    log("Filtering for userId: $userId");
    try {
      if (userId == -1) {
        cdafilterChatList.value = cdaChatList.toList();
      } else {
        cdafilterChatList.value = cdaChatList
            .where((element) =>
                element.userId == userId ||
                element.role?.toLowerCase() == 'cda')
            .toList();
        log("Filtered list length: ${cdafilterChatList.length}");
      }
    } catch (e) {
      log("Error filtering chat: $e");
    }
  }

  // loading
  var loading = false.obs;

  void setLoading(bool value) {
    loading.value = value;
  }

  // // Send Chat Message
  void sendChatMessageApi(int userId, String message) async {
    setLoading(true);
    repo.sendCdaChatMessage(userId, message).then((value) {
      setLoading(false);
      getCdaChatApi(userId);
    }).onError((error, stackTrace) {
      setLoading(false);
      log(error.toString());
    });
  }
}
