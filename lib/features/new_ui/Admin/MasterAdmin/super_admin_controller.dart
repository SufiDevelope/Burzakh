import 'dart:convert';
import 'dart:developer';

import 'package:burzakh/Model/AdminModels/SuperAdminAllCasesModel/super_admin_all_casesModel.dart';
import 'package:burzakh/Model/AdminModels/SuperAdminAllUserModel/super_admin_all_user_model.dart';
import 'package:burzakh/Repository/AdminRepos/SuperAdminRepo/super_admin_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/SuperAdminRepo/super_admin_repo.dart';
import 'package:burzakh/core/app/myapp.dart';
import 'package:burzakh/data/Response/status.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:burzakh/features/new_ui/Admin/AmbulanceDashboard/UI/ambulance_dashboard.dart';
import 'package:burzakh/features/new_ui/Admin/CementryAdminDashboard/UI/cementry_admin_dashboard.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Ui/cda_admin_dashboard_view.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/Admin/MorticianAdminDashboard/UI/mortician_admin_dashboard.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/UI/police_admin_dashboard_view.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/rta_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/dashboard/app_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperAdminController extends GetxController {
  var model = SuperAdminAllUserModel().obs;
  final rxRequestStatusForAllUser = Status.loading.obs;
  final SuperAdminRepo repo = SuperAdminHttpRepo();

  void setRxRequestStatusForAllUserRequest(Status value) =>
      rxRequestStatusForAllUser.value = value;

  RxList<SuperAdmimAllUser> allUserList = <SuperAdmimAllUser>[].obs;
  RxList<SuperAdmimAllUser> filterUserList = <SuperAdmimAllUser>[].obs;

  void setGetRequestApiResponse(SuperAdminAllUserModel data) {
    model.value = data;

    allUserList.value = data.user ?? [];
    filterUserList.value = allUserList.toList();
  }

  void getAllUser() async {
    try {
      setRxRequestStatusForAllUserRequest(Status.loading);
      await repo.getAllUser().then((response) {
        setGetRequestApiResponse(response);
        setRxRequestStatusForAllUserRequest(Status.completed);
      }).onError((error, stackTrace) {
        setRxRequestStatusForAllUserRequest(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForAllUserRequest(Status.error);
    }
  }

  void filterUser(String query) {
    if (query.isEmpty) {
      filterUserList.value = allUserList.toList();
    } else {
      filterUserList.value = allUserList
          .where((element) =>
              (element.email?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (element.firstName?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (element.lastName?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (element.adminType?.toLowerCase().contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
  }

  // Loading
  RxBool isLoading = false.obs;
  void setLoading(bool value) => isLoading.value = value;

  void superAdminLogin(String email, BuildContext context) async {
    try {
      setLoading(true);
      repo.superAdminLoginUser(email).then((response) {
        setLoading(false);
        if (response['user']['admin_type'] == "police") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PoliceAdminDashboardView(
                name:
                    "${response['user']["first_name"]}${response['user']["last_name"]}",
                adminId: response['user']["id"].toString(),
                flag: true,
              ),
            ),
          );
        } else if (response['user']['admin_type'] == "rta") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RtaDashboardView(
                      name:
                          "${response['user']["first_name"]}${response['user']["last_name"]}",
                      flag: true,
                    )),
          );
        } else if (response['user']['admin_type'] == "cda") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CdaAdminDashboardView(
                      name:
                          "${response['user']["first_name"]}${response['user']["last_name"]}",
                      flag: true,
                    )),
          );
        } else if (response['user']['admin_type'] == "mancipality") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DubaiAdminDashboardView(
                        name:
                            "${response['user']["first_name"]}${response['user']["last_name"]}",
                        flag: true,
                      )));
        } else if (response['user']['admin_type'] == "cemetery") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CementryAdminDashboard(
                        name:
                            "${response['user']["first_name"]}${response['user']["last_name"]}",
                        flag: true,
                      )));
        } else if (response['user']['admin_type'] == "ambulance") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AmbulanceDashboard(
                name:
                    "${response['user']["first_name"]}${response['user']["last_name"]}",
                id: response['user']["id"].toString(),
                flag: true,
              ),
            ),
          );
        } else if (response['user']['admin_type'] == "mortician") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MorticianAdminDashboard(
                name:
                    "${response['user']["first_name"]}${response['user']["last_name"]}",
                id: response['user']["id"].toString(),
                phoneNo: response['user']["phone_number"].toString(),
                flag: true,
              ),
            ),
          );
        } else if (response['user']['admin_type'] == "superadmin") {
        } else {
          userModel = UserModel.fromJson(response['user']);
          log(userModel?.email.toString() ?? "");
          UserShareprefController pref = UserShareprefController();
          pref.setData(userModel!).then((value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AppDashboard(
                          flag: true,
                        )));
          }).onError((error, stackTrace) {
            log(error.toString());
          });
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        log(error.toString());
      });
    } catch (e) {
      setLoading(false);
      log(e.toString());
    }
  }

  // Cases List
  var casesModel = SuperAdminAllCases().obs;
  final rxRequestStatusForAllCases = Status.loading.obs;

  void setRxRequestStatusForAllCases(Status value) =>
      rxRequestStatusForAllCases.value = value;
  void setGetRequestApiResponseForCases(SuperAdminAllCases data) {
    casesModel.value = data;
  }

  void getAllCases() async {
    try {
      repo.getAllCases().then((response) {
        setGetRequestApiResponseForCases(response);
        setRxRequestStatusForAllCases(Status.completed);
      }).onError((error, stackTrace) {
        log(error.toString());
        setRxRequestStatusForAllCases(Status.error);
      });
    } catch (e) {
      log(e.toString());
      setRxRequestStatusForAllCases(Status.error);
    }
  }

  // Loading
  RxBool isLoadingForDelete = false.obs;
  void setLoadingForDelete(bool value) => isLoadingForDelete.value = value;

  void deleteCaseById(caseId) async {
    try {
      setLoadingForDelete(true);
      repo.deleteCaseById(caseId).then((response) {
        setLoadingForDelete(false);
        getAllCases();
      }).onError((error, stackTrace) {
        setLoadingForDelete(false);
        log(error.toString());
      });
    } catch (e) {
      setLoadingForDelete(false);
      log(e.toString());
    }
  }
}
