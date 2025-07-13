import 'dart:developer';

import 'package:burzakh/Model/AdminModels/AmbulanceCassesModel/ambulance_casses_model.dart';
import 'package:burzakh/Repository/AdminRepos/AmbulanceRepo/ambulance_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/AmbulanceRepo/ambulance_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';

class AmbulanceController extends GetxController {
  RxString selectedStatus = ''.obs;
  void setStatus(String status, BuildContext context, driverId) {
    selectedStatus.value = status;
    if (status == 'Available') {
      chnageStatusAmbulance("pending", driverId, context, true);
    } else if (status == 'On Route') {
      chnageStatusAmbulance("on-route", driverId, context, true);
    } else if (status == 'Busy') {
      chnageStatusAmbulance("busy", driverId, context, true);
    }
  }

  var model = AmbulanceCaseModel().obs;
  final rxRequestStatusForAllAmbulanceRequest = Status.loading.obs;
  final AmbulanceRepo repo = AmbulanceHttpRepo();

  void setRequestStatusForAllAmbulanceRequest(Status value) {
    rxRequestStatusForAllAmbulanceRequest.value = value;
  }

  void setGetRequestApiResponse(AmbulanceCaseModel data) {
    model.value = data;
  }

  void getAmbulanceCasses(driverId, BuildContext context) {
    setRequestStatusForAllAmbulanceRequest(Status.loading);
    repo.getAmbulanceCasses(driverId).then((value) {
      setGetRequestApiResponse(value);

      final currentStatus = value.ambulance?.status ?? "";
      log("Fetched ambulance status: $currentStatus");

      if (currentStatus == "pending") {
        selectedStatus.value = "Available";
      } else if (currentStatus == "on-route") {
        selectedStatus.value = "On Route";
      } else if (currentStatus == "busy") {
        selectedStatus.value = "Busy";
      } else {
        selectedStatus.value = "";
      }

      setRequestStatusForAllAmbulanceRequest(Status.completed);
    }).onError((error, stackTrace) {
      log("Get cases error: $error");
      setRequestStatusForAllAmbulanceRequest(Status.error);
    });
  }

  void chnageStatusAmbulance(status, id, BuildContext context, bool flag) {
    repo.chnageStatusAmbulance(id, status).then((value) {
      if (flag == true) {
        getAmbulanceCasses(id, context);
      }
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

  void updateCaseStatus(status, id, BuildContext context, driverid) {
    log(id);
    repo.updateCaseStatusAmbulance(status, id).then((value) {
      getAmbulanceCasses(driverid, context);
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
