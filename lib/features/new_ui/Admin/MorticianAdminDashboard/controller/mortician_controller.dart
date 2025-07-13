import 'dart:developer';

import 'package:burzakh/Model/AdminModels/MorticianCassesModel/mortician_model.dart';
import 'package:burzakh/Repository/AdminRepos/MorticianRepo/mortician_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/MorticianRepo/mortician_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';

class MorticianController extends GetxController {
  var model = MorticianCassesModel().obs;
  final rxRequestStatusForAllMorticianRequest = Status.loading.obs;
  final MorticianRepo repo = MorticianHttpRepo();

  void setRequestStatusForAllMorticianRequest(Status value) {
    rxRequestStatusForAllMorticianRequest.value = value;
  }

  void setGetRequestApiResponse(MorticianCassesModel data) {
    model.value = data;
  }

  void getAllCasses() {
    setRequestStatusForAllMorticianRequest(Status.loading);
    repo.getMorticianCasses(49).then((value) {
      final currentStatus = value.mortician?.status ?? "";
      log("Fetched ambulance status: $currentStatus");

      if (currentStatus == "Active") {
        selectedStatus.value = "On Duty";
      } else if (currentStatus == "off-duty") {
        selectedStatus.value = "Off Duty";
      }

      setGetRequestApiResponse(value);
      setRequestStatusForAllMorticianRequest(Status.completed);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRequestStatusForAllMorticianRequest(Status.error);
    });
  }

  void updateCaseStatus(id, status, BuildContext context) {
    try {
      repo.changeCaseStatus(id, status).then((value) {
        getAllCasses();
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Status : ${status}  Error :${error.toString()}"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }

  RxString selectedStatus = ''.obs;
  void setStatus(String status, BuildContext context, morticianId) {
    selectedStatus.value = status;
    if (status == 'On Duty') {
      updateDutyStatus(morticianId, "Active", context, true);
    } else if (status == 'Off Duty') {
      updateDutyStatus(morticianId, "off-duty", context, true);
    }
  }

  void updateDutyStatus(id, status, BuildContext context, bool flag) {
    try {
      repo.changeStatus(id, status).then((value) {
        if (flag == true) {
          getAllCasses();
        }
      }).onError((error, stackTrace) {
        log(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Status : ${status}  Error :${error.toString()}"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
