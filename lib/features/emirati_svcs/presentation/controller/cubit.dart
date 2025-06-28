import 'dart:convert';
import 'dart:developer';

import 'package:burzakh/core/extensions/dart_extensions.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/emirati_svcs/data/model/GetCaseNameModel.dart';
import 'package:burzakh/features/emirati_svcs/data/model/cda_get_model.dart';
import 'package:burzakh/features/emirati_svcs/presentation/controller/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/model/cda_model.dart';
import '../../data/model/rta_get_model.dart';
import '../../data/model/rta_model.dart';
import '../../domain/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmirateSvcsCubit extends Cubit<EmirateSvcsState> {
  EmiratiUseCase _useCase;
  AuthenticationCubit _authenticationCubit;
  EmirateSvcsCubit(this._useCase, this._authenticationCubit)
      : super(EmirateSvcsInit());

  DateTime? mourningStartDate = DateTime.now();
  DateTime? mourningEndDate = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();
  String? userLocation;
  CdaGetModel? cdaGetModel;
  RtaGetModel? rtaGetModel;
  bool isCdaLoading = false;
  bool isGetCdaLoading = false;
  bool isGetRtaLoading = false;
  bool isRtaLoading = false;
  bool isCaseNameLoading = false;

  isLoadingCda(bool value) {
    emit(EmirateSvcsInit());
    isCdaLoading = value;
    emit(EmirateSvcsLoaded());
  }

  isGetCdaLoad(bool value) {
    emit(EmirateSvcsInit());
    isGetCdaLoading = value;
    emit(EmirateSvcsLoaded());
  }

  isGetRtaLoad(bool value) {
    emit(EmirateSvcsInit());
    isGetRtaLoading = value;
    emit(EmirateSvcsLoaded());
  }

  isLoadingRta(bool value) {
    emit(EmirateSvcsInit());
    isRtaLoading = value;
    emit(EmirateSvcsLoaded());
  }

  getMourningStartDate(DateTime value) async {
    emit(EmirateSvcsInit());
    mourningStartDate = value;
    emit(EmirateSvcsLoaded());
  }

  getMourningEndDate(DateTime value) async {
    emit(EmirateSvcsInit());
    mourningEndDate = value;
    emit(EmirateSvcsLoaded());
  }

  getTime(TimeOfDay value) async {
    emit(EmirateSvcsInit());
    time = value;
    emit(EmirateSvcsLoaded());
  }

  getCaseNameLoading(bool value) async {
    emit(EmirateSvcsInit());
    isCaseNameLoading = value;
    emit(EmirateSvcsLoaded());
  }

  TextEditingController locationController = TextEditingController();

  Future<void> getCurrentLocation() async {
    await Permission.location.isGranted;
    emit(EmirateSvcsInit());
    bool serviceEnable = false;

    bool peris = await Permission.location.isGranted;
    if (!peris) {
      await Permission.location.request();
      bool peris1 = await Permission.location.isGranted;
      if (!peris1) {
        showMessage("Please enable location permission.", isError: true);
        log("49723438");
        return;
      }
    }
    LocationPermission locationPermission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    // if(!serviceEnable){
    //   return null;
    // }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.always) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        // getCurrentLocation();
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      // getCurrentLocation();
    }

    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    var placeMark =
        await placemarkFromCoordinates(location.latitude, location.longitude);

    if (placeMark.isEmpty) {
      log(" 9823748 location not found");
      return null;
    }

    var address = placeMark[0];

    log("${address.street} ${address.subLocality} ${address.locality} ${address.administrativeArea} ${address.postalCode} ${address.country}");
    userLocation =
        "${address.subLocality} ${address.locality} ${address.administrativeArea} ${address.postalCode} ${address.country}";
    locationController.text = userLocation ?? "";
    emit(EmirateSvcsLoaded());
  }

  Future<void> getCdaModel() async {
    isGetCdaLoad(true);
    getRtaModel();
    emit(EmirateSvcsLoading());
    var response = await _useCase.getCda(
        userId: _authenticationCubit.userModel!.id.toString());
    if (response is Right) {
      var data = response.asRight();
      log("89234232 ${data.body}");
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var json = jsonDecode(data.body);
        log("837942 ${json}");
        var val = json['data'];
        if (val is List) {
          if (val.isEmpty) {
          } else {}
        } else {
          cdaGetModel = CdaGetModel.fromMap(json['data']);
        }
        isGetCdaLoad(false);
      } else {
        isGetCdaLoad(false);
        log("7823467 ${response.asLeft()}");
      }
    }
    isGetCdaLoad(false);
    emit(EmirateSvcsLoaded());
  }

  Future<void> getRtaModel() async {
    isGetRtaLoad(true);
    emit(EmirateSvcsLoading());
    var response = await _useCase.getRta(
        userId: _authenticationCubit.userModel!.id.toString());
    if (response is Right) {
      var data = response.asRight();
      log("89234232 ${data.body}");
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var json = jsonDecode(data.body);

        var val = json['data'];
        if (val is List) {
          if (val.isEmpty) {
          } else {}
        } else {
          rtaGetModel = RtaGetModel.fromMap(json['data']);
        }

        isGetRtaLoad(false);
      } else {
        log("7823467 ${response.asLeft()}");
        isGetRtaLoad(false);
      }
    }
    isGetRtaLoad(false);
    emit(EmirateSvcsLoaded());
  }

  Future<String?> uploadCda() async {
    if (mourningStartDate == null ||
        selectedCaseName == null ||
        selectedCaseName == "") {
      showMessage("Please add Date and Time", isError: true);
      return "400";
    } else if (locationController.text.isEmpty) {
      bool peris1 = await Permission.location.isGranted;
      if (!peris1) {
        showMessage("Please enable location permission.", isError: true);
        log("49723438");
        return "400";
      } else {
        showMessage("Please wait, finding your location...", isError: true);
      }
      getCurrentLocation();
      return "400";
    }
    isLoadingCda(true);
    CdaModel model = CdaModel(
      address: locationController.text.isEmpty ? "" : locationController.text,
      // time: "${time!.hour}:${time!.minute}",
      dateTime: mourningStartDate ?? DateTime.now(),
      userId: _authenticationCubit.userModel!.id.toString(),
      case_name: selectedCaseName ?? "",
      mourningEndDate: mourningEndDate,
    );
    var response = await _useCase.uploadCda(model: model);
    if (response is Left) {
      showMessage(response.asLeft.toString(), isError: true);
      isLoadingCda(false);
      return "400";
    } else {
      var data = response.asRight();
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        log("data sent ${data.body}");
        isLoadingCda(false);
        getCdaModel();
        // mourningStartDate=null;
        // userLocation=null;time=null;
        return "200";
      } else {
        showMessage("${jsonDecode(data.body)['errors']}", isError: true);
        log("data sent9843 ${jsonDecode(data.body)['errors']}");
        isLoadingCda(false);
        return "400";
      }
    }
  }

  Future<String?> uploadRta(
      {required String requiredSign, required String customSign}) async {
    if (mourningStartDate == null || time == null || mourningEndDate == null) {
      showMessage("Please add required fields", isError: true);
      return "400";
    } else if (locationController.text.isEmpty) {
      bool peris1 = await Permission.location.isGranted;
      if (!peris1) {
        showMessage("Please enable location permission.", isError: true);
        log("49723438");
        return "400";
      } else {
        showMessage("Please wait, finding your location...", isError: true);
      }
      getCurrentLocation();
      return "400";
    }
    log("2340234 $userLocation");
    isLoadingRta(true);
    if (selectedCaseName == null || selectedCaseName == "") {
      showMessage("Please select case name", isError: true);
      isLoadingRta(false);
      return "400";
    }
    RtaModel model = RtaModel(
      customSign: customSign,
      requiredSign: requiredSign,
      address: locationController.text.isEmpty ? "" : locationController.text,
      time: "${time!.hour}:${time!.minute}",
      dateTime: mourningStartDate!,
      userId: _authenticationCubit.userModel!.id.toString(),
      mourningEndDate: mourningEndDate!,
      case_name: selectedCaseName!,
    );
    var response = await _useCase.uploadRta(model: model);
    if (response is Left) {
      showMessage(response.asLeft.toString(), isError: true);
      isLoadingRta(false);
      return "400";
    } else {
      var data = response.asRight();
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        log("data sent");
        getRtaModel();
        // mourningStartDate=null;
        // userLocation=null;time=null;
        isLoadingRta(false);
        return "200";
      } else {
        showMessage("${jsonDecode(data.body)['errors']}", isError: true);
        log("data sent9843 ${jsonDecode(data.body)['errors']}");
        isLoadingRta(false);
        return "400";
      }
    }
  }

  bool isCancelCda = false;
  bool isCancelRta = false;

  getCancelCdaLoading(bool val) {
    emit(EmirateSvcsLoading());
    isCancelCda = val;
    emit(EmirateSvcsLoaded());
  }

  getCancelRtaLoading(bool val) {
    emit(EmirateSvcsLoading());
    isCancelRta = val;
    emit(EmirateSvcsLoaded());
  }

  Future<String> cancelCda() async {
    getCancelCdaLoading(true);
    emit(EmirateSvcsLoading());
    log("836328 ${cdaGetModel!.id.toString()}");
    var response = await _useCase.cancelCda(
        id: cdaGetModel!.id.toString(),
        userId: _authenticationCubit.userModel!.id.toString());

    if (response.isLeft()) {
      getCancelCdaLoading(false);

      return '400';
    } else {
      var data = response.asRight();
      var json = jsonDecode(data.body);
      log("28735894 $json");
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var json = jsonDecode(data.body);
        showMessage("${json['message']}");
        getCancelCdaLoading(false);

        emit(EmirateSvcsLoaded());
        cdaGetModel = null;
        return '200';
      } else {
        var json = jsonDecode(data.body);
        showMessage("${json['message']}", isError: true);
        getCancelCdaLoading(false);
        emit(EmirateSvcsLoaded());
        return '400';
      }
    }
  }

  Future<String> cancelRta() async {
    getCancelRtaLoading(true);
    emit(EmirateSvcsLoading());
    log("43623   ${rtaGetModel!.id.toString()}");
    var response = await _useCase.cancelRta(
        id: rtaGetModel!.id.toString(),
        userId: _authenticationCubit.userModel!.id.toString());

    if (response.isLeft()) {
      getCancelRtaLoading(false);
      return '400';
    } else {
      var data = response.asRight();
      var json = jsonDecode(data.body);
      log("398247928  $json");
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        showMessage("${json['message']}");
        rtaGetModel = null;
        getCancelRtaLoading(false);
        emit(EmirateSvcsLoaded());
        return '200';
      } else {
        var json = jsonDecode(data.body);
        showMessage("${json['message']}", isError: true);
        getCancelRtaLoading(false);
        emit(EmirateSvcsLoaded());
        return '400';
      }
    }
  }

  CaseNameModel? caseNameModel;
  String? selectedCaseName;

  setSelectedCaseName(String? value) {
    emit(EmirateSvcsInit());
    selectedCaseName = value;
    emit(EmirateSvcsLoaded());
  }

  void getCaseName() async {
    getCaseNameLoading(true);
    var response = await _useCase.getCaseName(
        userId: _authenticationCubit.userModel!.id.toString());
    if (response is Right) {
      var data = response.asRight();
      log("89234232 ${data.body}");
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var json = jsonDecode(data.body);
        log("837942 ${json}");
        caseNameModel = CaseNameModel.fromJson(json);
        var val = json['data'];
        if (val is List) {
          if (val.isEmpty) {
          } else {}
        } else {}
        getCaseNameLoading(false);
      } else {
        getCaseNameLoading(false);
        log("7823467 ${response.asLeft()}");
      }
    }
  }

  Future<String> updateRtaRequest(customSign, requiredSign, address, time,
      dateTime, mourningEndDate, case_name, userid, caseId) async {
    try {
      RtaModel model = RtaModel(
        customSign: customSign,
        requiredSign: requiredSign,
        address: address,
        time: time,
        dateTime: dateTime,
        userId: userid,
        mourningEndDate: DateTime.now(),
        case_name: case_name,
      );
      var response = await _useCase.updateRtaRequest(
          caseId: caseId.toString(), model: model);
      if (response is Right) {
        var data = response.asRight();
        if (data.statusCode >= 200 && data.statusCode <= 300) {
          log("data sent");
          getRtaModel();
          // mourningStartDate=null;
          // userLocation=null;time=null;
          isLoadingRta(false);
          return "200";
        } else {
          showMessage("${jsonDecode(data.body)['errors']}", isError: true);
          log("data sent9843 ${jsonDecode(data.body)['errors']}");
          isLoadingRta(false);
          return "400";
        }
      }
      // Ensure a return value if response is not Right
      return "400";
    } catch (e, stackTrace) {
      log("Error: $e", stackTrace: stackTrace);
      return "400";
    }
  }

  Future<String> updateCdaRequest(
      address, dateTime, case_name, userid, caseId, mourningEndDate) async {
    try {
      CdaModel model = CdaModel(
        address: address,
        dateTime: dateTime,
        userId: userid,
        case_name: case_name,
        mourningEndDate: mourningEndDate,
      );
      var response = await _useCase.updateCdaRequest(
          caseId: caseId.toString(), model: model);
      if (response is Right) {
        var data = response.asRight();
        if (data.statusCode >= 200 && data.statusCode <= 300) {
          log("data sent");
          getCdaModel();
          // mourningStartDate=null;
          // userLocation=null;time=null;
          isLoadingCda(false);
          return "200";
        } else {
          showMessage("${jsonDecode(data.body)['errors']}", isError: true);
          log("data sent9843 ${jsonDecode(data.body)['errors']}");
          isLoadingCda(false);
          return "400";
        }
      }
      // Ensure a return value if response is not Right
      return "400";
    } catch (e, stackTrace) {
      log("Error: $e", stackTrace: stackTrace);
      return "400";
    }
  }
}
