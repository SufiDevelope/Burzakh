import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:burzakh/core/app/myapp.dart';
import 'package:burzakh/core/extensions/dart_extensions.dart';
import 'package:burzakh/core/extensions/image_picker_class.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/state.dart';
import 'package:burzakh/features/authentication/presentation/model/signup_model.dart';
import 'package:burzakh/features/authentication/presentation/model/user_model.dart';
import 'package:burzakh/features/authentication/presentation/page/login.dart';
import 'package:burzakh/features/authentication/presentation/controller/user_sharepref_controller.dart';
import 'package:burzakh/features/authentication/presentation/page/reset_password.dart';
import 'package:burzakh/features/new_ui/Admin/ComunityDevlopmentAuthority/Ui/cda_admin_dashboard_view.dart';
import 'package:burzakh/features/new_ui/Admin/DubaiMuncipalityAdmin/UI/dubai_admin_dashboard_widget.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/Service/NotificationService.dart';
import 'package:burzakh/features/new_ui/Admin/PoliceAdmin/UI/police_admin_dashboard_view.dart';
import 'package:burzakh/features/new_ui/Admin/RoadsAndTransportAuthorityAdmin/Ui/rta_dashboard_widget.dart';
import 'package:burzakh/features/notification/presentation/page/notification_screen.dart';
import 'package:flutter/material.dart';
import '../../domain/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page/forgot_otp_screen.dart';
import '../page/login_01.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationUseCase _useCaseName;
  AuthenticationCubit(this._useCaseName) : super(AuthenticationInit());

  File? passportCopy;
  File? marsoom;
  File? uaePass;
  bool isSignUpLoading = false;
  bool isLoginLoading = false;
  bool isSendOtp = false;
  bool isResetPassword = false;
  UserModel? userModel;

  Future<void> signup(
      {required String fname,
      required String lname,
      required String password,
      required String phoneNumber,
      required String email,
      required confirmPassword}) async {
    emit(AuthenticationInit());
    isLoading(true);

    var deviceToken = await service.getDeviceToken();
    log("device token is $deviceToken");

    if (deviceToken == null || deviceToken == "") {
      log("device token is null");
      return;
    }

    // Check for password match
    if (password != confirmPassword) {
      isLoading(false);
      showMessage("Password does not match", isError: true);
      return;
    }

    SignUpModel model = SignUpModel(
        firstName: fname,
        lastName: lname,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
        passportCopy: passportCopy!,
        marsoom: marsoom,
        uaePass: uaePass,
        deviceToken: deviceToken);

    var response = await _useCaseName.signup(model: model);
    if (response.isRight()) {
      var data = response.asRight();
      log("618718 //${data.statusCode}// ${data.body}  ");

      if (data.statusCode >= 200 && data.statusCode <= 300) {
        log("948237   ${jsonDecode(data.body)['message']}");
        // navigatorKey.currentState?.push(MaterialPageRoute(
        //   builder: (context) => LoginScreen(),
        // ));
        // navigatorKey.currentState?.push(MaterialPageRoute(
        //   builder: (context) => BurzakhEnhancedLogin(),
        // ));
        try {
          log("69869689 ${jsonDecode(data.body)}");
          userModel = UserModel.fromJson(jsonDecode(data.body)['user']);
          UserShareprefController pref = UserShareprefController();
          pref.setData(userModel!);
          Future.delayed(Duration(milliseconds: 500));
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            'appDashBoard',
            (route) => false,
          );
        } catch (e) {
          log("3987324983 $e");
        }
      } else {
        isLoading(false);
        showMessage("${jsonDecode(data.body)['errors']}", isError: true);
      }
    } else {
      isLoading(false);
      showMessage(response.asLeft(), isError: true);
    }
    isLoading(false);
    emit(AuthenticationLoaded());
  }

  NotificationService service = NotificationService();

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(AuthenticationInit());
    isLogiLoading(true);
    var deviceToken = await service.getDeviceToken();
    log("device token is $deviceToken");

    if (deviceToken == null || deviceToken == "") {
      log("device token is null");
      return;
    }
    var response = await _useCaseName.login(
        email: email, password: password, deviceToken: deviceToken);

    if (response.isRight()) {
      var data = response.asRight();

      if (data.statusCode >= 200 && data.statusCode <= 300) {
        userModel = UserModel.fromJson(jsonDecode(data.body)['user']);
        UserShareprefController pref = UserShareprefController();
        pref.setData(userModel!);
        if (userModel?.admin_type == "police") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PoliceAdminDashboardView(
                name: "${userModel?.firstName}${userModel?.lastName}",
                adminId: userModel?.id.toString() ?? "",
              ),
            ),
          );
        } else if (userModel?.admin_type == "rta") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RtaDashboardView(
                      name: '${userModel?.firstName}${userModel?.lastName}',
                    )),
          );
        } else if (userModel?.admin_type == "cda") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CdaAdminDashboardView(
                      name: '${userModel?.firstName}${userModel?.lastName}',
                    )),
          );
        } else if (userModel?.admin_type == "mancipality") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DubaiAdminDashboardView(
                        name: "${userModel?.firstName}${userModel?.lastName}",
                      )));
        } else {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            'appDashBoard',
            (route) => false,
          );
        }
      } else {
        showMessage("${jsonDecode(data.body)['errors']}", isError: true);
      }
    } else {
      showMessage(response.asLeft(), isError: true);
    }
    emit(AuthenticationLoaded());
    isLogiLoading(false);
  }

  String otp = "";

  void getOtp(String value) {
    emit(AuthenticationInit());
    otp = value;
    emit(AuthenticationLoaded());
  }

  String forgotEmail = "";
  Future<void> sendOtp({required String email}) async {
    emit(AuthenticationInit());
    isLoadingSendOtp(true);
    var response = await _useCaseName.sendOtp(email: email);

    if (response.isRight()) {
      var data = response.asRight();

      if (data.statusCode >= 200 && data.statusCode <= 300) {
        forgotEmail = email;
        isLoadingSendOtp(false);
        showMessage("${jsonDecode(data.body)['message']}");
        navigatorKey.currentState?.push(MaterialPageRoute(
          builder: (context) => VerifyOtpForResetpassword(),
        ));
      } else {
        log("98435y534");
        isLoadingSendOtp(false);
        showMessage("${jsonDecode(data.body)['errors']}", isError: true);
        emit(AuthenticationLoaded());
      }
    } else {
      isLoadingSendOtp(false);
      showMessage(response.asLeft(), isError: true);
    }
    isLoadingSendOtp(false);
    emit(AuthenticationLoaded());
  }

  Future<void> verifyOtp() async {
    emit(AuthenticationInit());
    isLoadingVerifyOtp(true);
    var response = await _useCaseName.verifyOtp(email: forgotEmail, otp: otp);

    if (response.isRight()) {
      var data = response.asRight();

      if (data.statusCode >= 200 && data.statusCode <= 300) {
        log("9869  ${jsonDecode(data.body)}");
        showMessage("${jsonDecode(data.body)['message']}");
        navigatorKey.currentState?.push(MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        ));
      } else {
        isLoadingVerifyOtp(false);
        showMessage("${jsonDecode(data.body)['message']}", isError: true);
      }
    } else {
      isLoadingVerifyOtp(false);
      showMessage(response.asLeft(), isError: true);
    }
    isLoadingVerifyOtp(false);
    emit(AuthenticationLoaded());
  }

  Future<void> resetPassword(
      {required String password, required String confirmPassword}) async {
    emit(AuthenticationInit());
    isLoadingResetPassword(true);
    var response = await _useCaseName.resetPassword(
        email: forgotEmail,
        confirmPassword: confirmPassword,
        password: password);

    if (response.isRight()) {
      var data = response.asRight();

      if (data.statusCode >= 200 && data.statusCode <= 300) {
        log("9869  ${jsonDecode(data.body)}");
        showMessage("${jsonDecode(data.body)['message']}");
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          'BurzakhEnhancedLogin',
          (route) => false,
        );
      } else {
        isLoadingResetPassword(false);
        showMessage("${jsonDecode(data.body)['errors']}", isError: true);
      }
    } else {
      isLoadingResetPassword(false);
      showMessage(response.asLeft(), isError: true);
    }
    isLoadingResetPassword(false);
    emit(AuthenticationLoaded());
  }

  Future<void> makeUserNull() async {
    emit(AuthenticationInit());
    UserShareprefController pref = UserShareprefController();
    await pref.makeNull();
    userModel = null;
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      "BurzakhEnhancedLogin",
      (route) => false,
    );
    emit(AuthenticationLoaded());
  }

  Future<void> checkUserExist() async {
    emit(AuthenticationInit());
    UserShareprefController pref = UserShareprefController();
    int? isFirstTime = await pref.getFirstTime();
    UserModel? model = await pref.getData();
    log("823467  $isFirstTime");
    if (model != null) {
      userModel = model;
      if (model.admin_type == "police") {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => PoliceAdminDashboardView(
              name: "${userModel?.firstName}${userModel?.lastName}",
              adminId: userModel?.id.toString() ?? "",
            ),
          ),
        );
      } else if (model.admin_type == "rta") {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
              builder: (context) => RtaDashboardView(
                    name: "${userModel?.firstName}${userModel?.lastName}",
                  )),
        );
      } else if (model.admin_type == "cda") {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
              builder: (context) => CdaAdminDashboardView(
                    name: '${userModel?.firstName}${userModel?.lastName}',
                  )),
        );
      } else if (model.admin_type == "mancipality") {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
              builder: (context) => DubaiAdminDashboardView(
                    name: "${userModel?.firstName}${userModel?.lastName}",
                  )),
        );
      } else {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          'appDashBoard',
          (route) => false,
        );
      }
    } else {
      if (isFirstTime != null) {
        log("823467  $isFirstTime");
        if (isFirstTime == 1) {
          // navigatorKey.currentState?.pushNamedAndRemoveUntil('appDashBoard', (route) => false,);

          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            'BurzakhEnhancedLogin',
            (route) => false,
          );
        } else {
          // navigatorKey.currentState?.pushNamedAndRemoveUntil('appDashBoard', (route) => false,);

          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            'onboarding001',
            (route) => false,
          );
        }
      } else {
        // navigatorKey.currentState?.pushNamedAndRemoveUntil('appDashBoard', (route) => false,);

        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          'onboarding001',
          (route) => false,
        );
      }
    }
    emit(AuthenticationLoaded());
  }

  void pickPassport() async {
    emit(AuthenticationInit());
    File? image = await ImagePickerClass.pickImage();
    if (image != null) {
      passportCopy = image;
    } else {
      showMessage("Cancel", isError: true);
    }
    emit(AuthenticationLoaded());
  }

  void pickMarsoom() async {
    emit(AuthenticationInit());
    File? image = await ImagePickerClass.pickImage();
    if (image != null) {
      marsoom = image;
    } else {
      showMessage("Cancel", isError: true);
    }
    emit(AuthenticationLoaded());
  }

  void pickUaePass() async {
    emit(AuthenticationInit());
    File? image = await ImagePickerClass.pickImage();
    if (image != null) {
      uaePass = image;
    } else {
      showMessage("Cancel", isError: true);
    }
    emit(AuthenticationLoaded());
  }

  Future<void> setFirstTime() async {
    UserShareprefController pref = UserShareprefController();
    await pref.setFirstTime();
  }

  void isLoading(bool value) {
    emit(AuthenticationLoading());
    isSignUpLoading = value;
    emit(AuthenticationLoaded());
  }

  void isLogiLoading(bool value) {
    emit(AuthenticationLoading());
    isLoginLoading = value;
    emit(AuthenticationLoaded());
  }

  void isLoadingSendOtp(bool value) {
    emit(AuthenticationLoading());
    isSendOtp = value;
    emit(AuthenticationLoaded());
  }

  bool isVerifyOtp = false;

  void isLoadingVerifyOtp(bool value) {
    emit(AuthenticationLoading());
    isVerifyOtp = value;
    emit(AuthenticationLoaded());
  }

  void isLoadingResetPassword(bool value) {
    emit(AuthenticationLoading());
    isResetPassword = value;
    emit(AuthenticationLoaded());
  }
}
