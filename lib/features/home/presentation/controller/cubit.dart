import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:burzakh/core/extensions/dart_extensions.dart';
import 'package:burzakh/core/extensions/image_picker_class.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/home/data/model/case_detail_model.dart';
import 'package:burzakh/features/home/data/model/case_model.dart';
import 'package:burzakh/features/home/data/model/graveyard_model.dart';
import 'package:burzakh/features/home/data/model/recent_model.dart';
import 'package:burzakh/features/home/presentation/controller/state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/app/di_container.dart';
import '../../../emirati_svcs/presentation/controller/cubit.dart';
import '../../data/model/document_upload_model.dart';
import '../../data/model/graveyard_case_process_model.dart';
import '../../domain/usecase/usecase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final DocumentUseCase _useCase;
  AuthenticationCubit _authenticationCubit;

  HomeCubit(this._useCase, this._authenticationCubit) : super(HomeInit());

  int restingPlaceIndex = 0;
  File? deathNoti;
  File? hospitalCerti;
  File? passportFront;
  File? passportBack;
  bool isUploadingdocs = false;
  bool isFetchingCases = false;
  bool isFetchingCaseDetail = false;
  bool isFetchingCaseGraveyardDetail = false;
  CaseDetailModel? caseDetailModel;
  GraveyardCaseProcessModel? graveyardCaseProcessModel;
  List<CaseModel> caseList = [];
  List<RecentModel> recentActivityList = [];
  int retryCaseFunction = 0;
  File? policeClearance;
  String? burialTime;
  String? preferredComm;
  String? lovedCitizan;
  bool isGraveyardDocUpload = false;

  var _emiratiScvCubit = DiContainer().sl<EmirateSvcsCubit>();

  int selectedCaseIndex = 0;


  void selectCase(int index) {
    selectedCaseIndex = index;
    emit(HomeLoaded());
  }

  Future<void> getUserCases() async {
    emit(HomeInit());
    isLoadingCases(true);
    recentActivity();
    _emiratiScvCubit.getCdaModel();
    var response = await _useCase.getCases(
        userId: _authenticationCubit.userModel!.id.toString());
    if (response is Left) {
      showMessage(response.asLeft(), isError: true);
      if (retryCaseFunction < 3) {
        await Future.delayed(
          Duration(seconds: 3),
          () => getUserCases(),
        );
        retryCaseFunction++;
      }
    } else {
      var data = response.asRight();
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var body = jsonDecode(data.body)['data'];
        if (body is List) {
          caseList = body
              .map(
                (e) => CaseModel.fromJson(e),
              )
              .toList();
        }
        retryCaseFunction = 0;
      } else {
        showMessage('${jsonDecode(data.body)['errors']}', isError: true);

        if (retryCaseFunction < 3) {
          await Future.delayed(
            Duration(seconds: 3),
            () => getUserCases(),
          );
          retryCaseFunction++;
        }
      }
    }
    isLoadingCases(false);
    emit(HomeLoaded());
  }

  Future<void> getCaseDetails(String caseId) async {
    emit(HomeInit());
    isLoadingCasesDetail(true);
    var response = await _useCase.caseDetail(
        userId: _authenticationCubit.userModel!.id.toString(), caseId: caseId);
    if (response is Left) {
      showMessage(response.asLeft(), isError: true);
      if (retryCaseFunction < 3) {
        await Future.delayed(
          Duration(seconds: 3),
          () => getCaseDetails(caseId),
        );
        retryCaseFunction++;
      }
    } else {
      var data = response.asRight();
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var body = jsonDecode(data.body)['data'];
        caseDetailModel = CaseDetailModel.fromJson(body);
        retryCaseFunction = 0;
      } else {
        showMessage('${jsonDecode(data.body)['errors']}', isError: true);

        if (retryCaseFunction < 3) {
          await Future.delayed(
            Duration(seconds: 3),
            () => getCaseDetails(caseId),
          );
          retryCaseFunction++;
        }
      }
    }
    isLoadingCasesDetail(false);
    emit(HomeLoaded());
  }

  Future<String> recentActivity() async {
    emit(HomeInit());
    var response = await _useCase.recentActivity(
        userId: _authenticationCubit.userModel!.id.toString());
    log("74893232443");
    if (response is Right) {
      var data = response.asRight();
      log("3232234");
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        var json = jsonDecode(data.body);
        var dataList = json['data'];
        log("42397239  ${dataList}");
        if (dataList is List) {
          log("324732  ${dataList}");
          recentActivityList = dataList
              .map(
                (e) => RecentModel.fromMap(e),
              )
              .toList();
        }
        emit(HomeLoaded());
        return "200";
      } else {
        log("23748923 ${data.body}");
        emit(HomeLoaded());
        return "400";
      }
    } else {
      emit(HomeLoaded());
      return "400";
    }
  }

  Future<void> getCaseGraveyardDetails(String caseId) async {
    log("9732408    //$caseId");
    emit(HomeInit());

    isLoadingGraveyardDetail(true);
    var response = await _useCase.caseGraveyardDetail(
        userId: _authenticationCubit.userModel!.id.toString(), caseId: caseId);
    if (response is Left) {
      showMessage(response.asLeft(), isError: true);
      if (retryCaseFunction < 3) {
        await Future.delayed(
          Duration(seconds: 3),
          () => getCaseDetails(caseId),
        );
        retryCaseFunction++;
      }
    } else {
      var data = response.asRight();
      if (data.statusCode >= 200 && data.statusCode <= 300) {
        log("ata 432798  ${data.body}");
        var body = jsonDecode(data.body)['data'];
        if (body is List) {
          List<GraveyardCaseProcessModel> value = body
              .map(
                (e) => GraveyardCaseProcessModel.fromJson(e),
              )
              .toList();
          if (value.isEmpty) {
            graveyardCaseProcessModel = null;
          } else {
            graveyardCaseProcessModel = value[0];
          }
        }
        retryCaseFunction = 0;
      } else {
        showMessage('${jsonDecode(data.body)['errors']}', isError: true);

        if (retryCaseFunction < 3) {
          await Future.delayed(
            Duration(seconds: 3),
            () => getCaseDetails(caseId),
          );
          retryCaseFunction++;
        }
      }
    }
    isLoadingGraveyardDetail(false);
    emit(HomeLoaded());
  }

  isLoadingCases(bool value) {
    emit(HomeInit());
    isFetchingCases = value;
    emit(HomeLoaded());
  }

  isLoadingGraveyardDocUpload(bool value) {
    emit(HomeInit());
    isGraveyardDocUpload = value;
    emit(HomeLoaded());
  }

  isLoadingCasesDetail(bool value) {
    emit(HomeInit());
    isFetchingCaseDetail = value;
    emit(HomeLoaded());
  }

  isLoadingGraveyardDetail(bool value) {
    emit(HomeInit());
    isFetchingCaseGraveyardDetail = value;
    emit(HomeLoaded());
  }

  isLoading(bool value) {
    emit(HomeInit());
    isUploadingdocs = value;
    emit(HomeLoaded());
  }

  getBurialTime(String value) {
    emit(HomeInit());
    burialTime = value;
    emit(HomeLoaded());
  }

  getLovedCitizan(String value) {
    emit(HomeInit());
    lovedCitizan = value;
    emit(HomeLoaded());
  }

  getPreferredComm(String value) {
    emit(HomeInit());
    preferredComm = value;
    emit(HomeLoaded());
  }

  getRestingPlaceIndex(int value) {
    emit(HomeInit());
    restingPlaceIndex = value;
    emit(HomeLoaded());
  }

  pickDeathNoti() async {
    emit(HomeInit());
    deathNoti = await ImagePickerClass.pickImage();
    emit(HomeLoaded());
  }

  pickHospitalCert() async {
    emit(HomeInit());
    hospitalCerti = await ImagePickerClass.pickImage();
    emit(HomeLoaded());
  }

  pickPassportFront() async {
    emit(HomeInit());
    passportFront = await ImagePickerClass.pickImage();
    emit(HomeLoaded());
  }

  pickPassportBack() async {
    emit(HomeInit());
    passportBack = await ImagePickerClass.pickImage();
    emit(HomeLoaded());
  }

  pickPoliceClearance() async {
    emit(HomeInit());
    policeClearance = await ImagePickerClass.pickImage();
    emit(HomeLoaded());
  }

  Future<String> uploadDocument(
      TextEditingController nameOfDeceased,
      TextEditingController causeOfDeath,
      TextEditingController deathDate,
      TextEditingController deathLocation, restingPlace) async {
    if (deathNoti == null ||
        hospitalCerti == null ||
        passportBack == null ||
        passportFront == null) {
      showMessage("Please add all fields");
      return "400";
    } else {
      isLoading(true);
      DocumentUploadModel model = DocumentUploadModel(
        userId: "${_authenticationCubit.userModel!.id}",
        restingPlace: restingPlace == 1 ? "Hospital" : "Home",
        deathNotificationFile: deathNoti!,
        hospitalCertification: hospitalCerti!,
        passportOrEmirateIdFront: passportFront!,
        passportOrEmirateIdBack: passportBack!,
        nameofdeceased: nameOfDeceased.text,
        dateofdeath: deathDate.text,
        locationofdeath: deathLocation.text,
      );
      var response = await _useCase.uploadDocument(model: model);
      if (response is Left) {
        showMessage(response.asLeft(), isError: true);
        isLoading(false);
        return "400";
      } else {
        var data = response.asRight();
        if (data.statusCode >= 200 && data.statusCode <= 300) {
          log("92743 ${data.body}");
          deathNoti = null;
          hospitalCerti = null;
          passportBack = null;
          passportFront = null;
          isLoading(false);
          return "200";
        } else {
          showMessage("${jsonDecode(data.body)['errors']}", isError: true);
          isLoading(false);
          return "400";
        }
      }
    }
  }

  Future<String> uploadGraveyardSupervisorDoc() async {
    if (policeClearance == null) {
      showMessage("Please add police Clearance", isError: true);
      return "400";
    } else {
      log("843722398 ${caseDetailModel?.id.toString()}");
      isLoadingGraveyardDocUpload(true);
      GraveyardModel model = GraveyardModel(
        userId: "${_authenticationCubit.userModel!.id}",
        burialTiming: burialTime ?? "",
        caseId: caseDetailModel?.id.toString() ?? "",
        lovedcitizen: lovedCitizan ?? "",
        policeClearance: policeClearance!,
        preferrredComm: preferredComm ?? "",
      );
      var response = await _useCase.uploadGraveyardApproval(model: model);
      if (response is Left) {
        showMessage(response.asLeft(), isError: true);
        isLoadingGraveyardDocUpload(false);
        return "400";
      } else {
        var data = response.asRight();
        if (data.statusCode >= 200 && data.statusCode <= 300) {
          log("92743 ${data.body}");
          policeClearance = null;
          burialTime = null;
          lovedCitizan = null;
          preferredComm = null;
          isLoadingGraveyardDocUpload(false);
          return "200";
        } else {
          showMessage("${jsonDecode(data.body)['errors']}", isError: true);
          isLoadingGraveyardDocUpload(false);
          return "400";
        }
      }
    }
  }

  Future<void> openDialPad(String number) async {
    try {
      final Uri dialUri = Uri(scheme: 'tel', path: number);
      if (await canLaunchUrl(dialUri)) {
        await launchUrl(dialUri);
      } else {
        showMessage("Can\'t open dialer");
      }
    } catch (e) {
      log("43543 $e");
    }
  }

  Future<void> logOut() async {
    restingPlaceIndex = 0;
    deathNoti;
    hospitalCerti;
    passportFront;
    passportBack;
    isUploadingdocs = false;
    isFetchingCases = false;
    isFetchingCaseDetail = false;
    isFetchingCaseGraveyardDetail = false;
    caseDetailModel;
    graveyardCaseProcessModel = null;
    caseList = [];
    recentActivityList = [];
    retryCaseFunction = 0;
    policeClearance;
    burialTime = null;
    preferredComm = null;
    lovedCitizan = null;
    isGraveyardDocUpload = false;
    UserShareprefController pref = UserShareprefController();
    await pref.makeNull();
  }

  int selectedTakbirImage = 0;
  getTakbirImage(int val) {
    emit(HomeInit());
    selectedTakbirImage = val;
    emit(HomeLoaded());
  }

  int showTab = 0;
  getShowTab(int val) {
    emit(HomeInit());
    showTab = val;
    emit(HomeLoaded());
  }

  int showTQuestion = 0;
  getShowTQuestion(int val) {
    emit(HomeInit());
    showTQuestion = val;
    emit(HomeLoaded());
  }

  int completedJanazaSteps = 0;
  getCompletedJanazaSteps(int val) {
    emit(HomeInit());
    completedJanazaSteps = val;
    emit(HomeLoaded());
  }
}
