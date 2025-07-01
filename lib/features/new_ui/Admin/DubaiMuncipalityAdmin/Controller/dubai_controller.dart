import 'dart:developer';

import 'package:burzakh/Model/AdminModels/DubaiMuncipalityRequestModel/dubai_muncipality_request_model.dart';
import 'package:burzakh/Repository/AdminRepos/DubaiAdminRepo/dubai_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/DubaiAdminRepo/dubai_admin_repo.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:get/get.dart';

class DubaiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getRequestApi();
  }

  var selectedIndex = 0.obs;

  void selectTab(int index, String status) {
    selectedIndex.value = index;
  }

  void resetToFirst() {
    selectedIndex.value = 0;
  }

  var model = DubaiMuncipalityRequestModel().obs;
  final rxRequestStatusForAllDubaiRequest = Status.loading.obs;
  final DubaiAdminRepo repo = DubaiAdminHttpRepo();

  void setRxRequestStatusForAllDubaiRequest(Status value) =>
      rxRequestStatusForAllDubaiRequest.value = value;
  void setGetRequestApiResponse(DubaiMuncipalityRequestModel data) {
    model.value = data;
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
}
