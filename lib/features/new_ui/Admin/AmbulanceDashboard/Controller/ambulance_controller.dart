import 'dart:developer';

import 'package:burzakh/Model/AdminModels/AmbulanceCassesModel/ambulance_casses_model.dart';
import 'package:burzakh/Model/AdminModels/AmbulanceSchduleModel/ambulance_schdule_model.dart';
import 'package:burzakh/Repository/AdminRepos/AmbulanceRepo/ambulance_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/AmbulanceRepo/ambulance_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';

class AmbulanceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAmbulanceCasses();
    getAmbulanceSchedule();
  }

  RxString selectedStatus = ''.obs;

  void setStatus(String status, BuildContext context) {
    selectedStatus.value = status;
    if (status == 'Available') {
      chnageStatusAmbulance("pending", "48", context);
    } else if (status == 'On Route') {
      chnageStatusAmbulance("busy", "48", context);
    } else if (status == 'Busy') {
      chnageStatusAmbulance("not-available", "48", context);
    }
  }

  var model = AmbulanceCassesModel().obs;
  final rxRequestStatusForAllAmbulanceRequest = Status.loading.obs;
  final AmbulanceRepo repo = AmbulanceHttpRepo();

  void setRequestStatusForAllAmbulanceRequest(Status value) {
    rxRequestStatusForAllAmbulanceRequest.value = value;
  }

  void setGetRequestApiResponse(AmbulanceCassesModel data) {
    model.value = data;
  }

  void getAmbulanceCasses() {
    setRequestStatusForAllAmbulanceRequest(Status.loading);
    repo.getAmbulanceCasses(48).then((value) {
      setRequestStatusForAllAmbulanceRequest(Status.completed);
      setGetRequestApiResponse(value);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRequestStatusForAllAmbulanceRequest(Status.error);
    });
  }

  var modelSchedule = AmbulanceScheduleModel().obs;
  final rxRequestStatusForScheduleAmbulanceRequest = Status.loading.obs;

  void setRequestStatusForScheduleAmbulanceRequest(Status value) {
    rxRequestStatusForScheduleAmbulanceRequest.value = value;
  }

  void setGetRequestApiResponseForSchedule(AmbulanceScheduleModel data) {
    modelSchedule.value = data;
  }

  void getAmbulanceSchedule() {
    setRequestStatusForScheduleAmbulanceRequest(Status.loading);
    repo.getAmbulanceTodaySchedule(48).then((value) {
      setRequestStatusForScheduleAmbulanceRequest(Status.completed);
      setGetRequestApiResponseForSchedule(value);
    }).onError((error, stackTrace) {
      log(error.toString());
      setRequestStatusForScheduleAmbulanceRequest(Status.error);
    });
  }

  void chnageStatusAmbulance(status, id, BuildContext context) {
    repo.chnageStatusAmbulance(id, status).then((value) {
      getAmbulanceCasses();
      getAmbulanceSchedule();
    }).onError((error, stackTrace) {
      log(error.toString());
      // Snackbar
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
  }

  void updateCaseStatus(status, id, BuildContext context) {
    repo.updateCaseStatusAmbulance(status, id).then((value) {
      getAmbulanceCasses();
    }).onError((error, stackTrace) {
      log(error.toString());
      // Snackbar
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
  }
}
