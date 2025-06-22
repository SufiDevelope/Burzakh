import 'dart:developer';

import 'package:burzakh/Model/AdminModels/FilterRtaRequestModel/filter_rta_requestModel.dart';
import 'package:burzakh/Model/AdminModels/RtaChatModel/rta_chat_model.dart';
import 'package:burzakh/Model/AdminModels/RtaRequestDetailsModel/rta_request_details_model.dart';
import 'package:burzakh/Model/AdminModels/RtaRequestModel/rta_request_model.dart';
import 'package:burzakh/Repository/AdminRepos/RtaAdminRepo/rta_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/RtaAdminRepo/rta_admin_repo.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Widgets/dashboard_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RtaController extends GetxController {
  @override
  void onInit() {
    getRequestApi();
    filterRtaRequestApi("None");
    // getRtaChatApi();
    super.onInit();
  }

  // Use RxInt to make selectedIndex observable
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

  var model = RtaRequestModel().obs;
  final rxRequestStatusForAllRtaRequest = Status.loading.obs;
  final RtaAdminRepo repo = RtaAdminHttpRepo();

  // Get the Contact List From Api
  void setRxRequestStatusForAllRtaRequest(Status value) =>
      rxRequestStatusForAllRtaRequest.value = value;
  void setGetRequestApiResponse(RtaRequestModel data) {
    model.value = data;
  }

  void getRequestApi() async {
    setRxRequestStatusForAllRtaRequest(Status.loading);
    repo.getRtaRequest().then((value) {
      setGetRequestApiResponse(value);
      setRxRequestStatusForAllRtaRequest(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForAllRtaRequest(Status.error);
    });
  }

  var rtaDetailsModel = RtaRequestDetailsModel().obs;
  final rxRequestStatusForRtaRequestDetails = Status.loading.obs;

  // Get the Contact List From Api
  void setRxRequestStatusForRtaRequestDetails(Status value) =>
      rxRequestStatusForRtaRequestDetails.value = value;
  void setGetRequestApiResponseDetails(RtaRequestDetailsModel data) {
    rtaDetailsModel.value = data;
  }

  void getRtaRequestDetailsApi(id) async {
    setRxRequestStatusForRtaRequestDetails(Status.loading);
    repo.getRtaRequestDetails(id).then((value) {
      setGetRequestApiResponseDetails(value);
      setRxRequestStatusForRtaRequestDetails(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForRtaRequestDetails(Status.error);
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

  void updateRtaRequestStatusApi(id, status, BuildContext context) async {
    try {
      if (status == "approve") {
        setapprovedLoading(true);
      } else {
        setrejectLoading(true);
      }
      repo.updateRtaRequestStatus(id, status).then((value) {
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

  var filteredModel = FilterRtaRequestModel().obs;
  final rxRequestStatusForfilterRtaRequest = Status.loading.obs;

  final RxList<FilterRtaData> filterList = <FilterRtaData>[].obs;
  final RxList<FilterRtaData> allFilterList = <FilterRtaData>[].obs;

  void setRxRequestStatusForfilterRtaRequest(Status value) =>
      rxRequestStatusForfilterRtaRequest.value = value;
  void setGetRequestFilterApiResponse(FilterRtaRequestModel data) {
    filteredModel.value = data;
    allFilterList.value = data.data ?? [];
    filterList.value = data.data!;
  }

  void filterRtaRequestApi(status) async {
    setRxRequestStatusForfilterRtaRequest(Status.loading);
    repo.filterRtaRequest(status).then((value) {
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
                (element.locationOfHouse
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

  var rtaChatModel = RtaChatModel().obs;
  RxList<RtaChatData> rtaChatList = <RtaChatData>[].obs;
  RxList<RtaChatData> rtafilterChatList = <RtaChatData>[].obs;

  final rxRequestStatusForRtaChat = Status.loading.obs;
  void setRxRequestStatusForRtaChat(Status value) =>
      rxRequestStatusForRtaChat.value = value;
  void setGetRequesForRtaChat(RtaChatModel data) {
    rtaChatModel.value = data;
    rtaChatList.value = data.data ?? [];
    rtafilterChatList.value = data.data ?? [];
  }

  void getRtaChatApi(userId) async {
    setRxRequestStatusForRtaChat(Status.loading);
    repo.getRtaChat(userId).then((value) {
      setGetRequesForRtaChat(value);
      setRxRequestStatusForRtaChat(Status.completed);
      // filterRtaChatAccordingtoUserId(userId);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRxRequestStatusForRtaChat(Status.error);
    });
  }

  filterRtaChatAccordingtoUserId(int userId) {
    log("Filtering for userId: $userId");
    try {
      if (userId == -1) {
        rtafilterChatList.value = rtaChatList.toList();
      } else {
        rtafilterChatList.value = rtaChatList
            .where((element) =>
                element.userId == userId ||
                element.role?.toLowerCase() == 'rta')
            .toList();
        log("Filtered list length: ${rtafilterChatList.length}");
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

  // Send Chat Message
  void sendChatMessageApi(int userId, String message) async {
    setLoading(true);
    repo.sendRtaChatMessage(userId, message).then((value) {
      setLoading(false);
      getRtaChatApi(userId);
    }).onError((error, stackTrace) {
      setLoading(false);
      log(error.toString());
    });
  }

  // loading
  var userloading = false.obs;

  void setUserLoading(bool value) {
    userloading.value = value;
  }

  void sendUserMessageApi(id, admin_type, message) {
    try {
      setUserLoading(true);
      repo.sendUserChatMessage(id, admin_type, message).then((value) {
        setUserLoading(false);
        getRtaChatApi(id);
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
