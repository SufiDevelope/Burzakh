class AppApis {
  AppApis._();

  static String baseUrl = "https://healthhive.me";

  // authentications
  static String register = "/api/burzakh/register";
  static String login = "/api/burzakh/login";
  static String sendOtp = "/api/burzakh/send-otp";
  static String verifyOtp = "/api/burzakh/verify-otp";
  static String resetPassword = "/api/burzakh/set-new-password";

  //user side
  static String documentSubmission = "/api/burzakh/user-documents-submission";
  static String graveSupervisorSubmission =
      "/api/burzakh/submission-to-grave-supervisor";
  static String cda = "/api/burzakh/cda-submission";
  static String cancelRta = "/api/burzakh/rta-cancellation";
  static String cancelCda = "/api/burzakh/cda-cancellation";
  static String getCda = "/api/burzakh/cda/pending";
  static String getRta = "/api/burzakh/rta/pending";
  static String rta = "/api/burzakh/rta-submission";
  //// in end add user id
  static String getCase = "/api/burzakh/list-cases/";
  static String recentActivity = "/api/burzakh/recent-activities/";

  static String caseDetail({required String userId, required String caseId}) =>
      "/api/burzakh/user/$userId/case/$caseId";
  static String caseGraveyardDetail(
          {required String userId, required String caseId}) =>
      "/api/burzakh/list-graveyard-statuses/$caseId";

  static String sendChat({required String id}) => "/api/burzakh/$id";
  static String recieveChat({required String id}) =>
      "/api/burzakh/get-support-messages";

  // sharedpref keys

  static String user = 'user_login';

  static String isFirstTime = "isFirstTime";

  //  Admin Side Apis
  // Police Side Apis
  static String policeCassesCountApi =
      "${baseUrl}/api/burzakh-police/cases-count";
  static String policeFilterCassesApi(String? filter) =>
      "${baseUrl}/api/burzakh-police/filter-cases?filter=$filter";
  static String policeVideoCallScheduleApi =
      "${baseUrl}/api/burzakh-police/schedule-calling";

  static String rtarequestApi = "${baseUrl}/api/burzakh-rta/get-requests";
  static String rtarequestDetailApi(id) =>
      "${baseUrl}/api/burzakh-rta/case-detail/$id";
  static String cdarequestDetailApi(id) =>
      "${baseUrl}/api/burzakh-cda/case-detail/$id";
  static String policeQuickActionApi =
      "${baseUrl}/api/burzakh-police/quick-actions";
  static String approvePoliceCaseApi(caseId, userId) =>
      "${baseUrl}/api/burzakh-police/cases/$caseId/approve/$userId";

  static String updateRtaRequestStatus(id) =>
      "${baseUrl}/api/burzakh-rta/rta-requests/$id/update-status";

  // Filter Api For Rta
  static String rtaFilterApi(String? filter) =>
      "${baseUrl}/api/burzakh-rta/filter-requests?filter=$filter";
  static String sendrtaChatApi(userId, message) =>
      "${baseUrl}/api/burzakh-rta/send-support-message?user_id=$userId&message=$message";
  static String getRtaChatApi(id) =>
      "${baseUrl}/api/burzakh-rta/support/messages/user/$id";
  static String getCdaChatApi(id) =>
      "${baseUrl}/api/burzakh-cda/support/messages/user/$id";
  static String sendCdaChatApi(userId, message) =>
      "${baseUrl}/api/burzakh-cda/send-support-message?user_id=$userId&message=$message";

  // Cda Side Apis
  static String cdaRequestApi = "${baseUrl}/api/burzakh-cda/get-requests";
  static String cdaRequestDetailApi(id) =>
      "${baseUrl}/api/burzakh-cda/case-detail/$id";
  static String updateCdaRequestStatus(id) =>
      "${baseUrl}/api/burzakh-cda/cda-requests/$id/update-status";

  // Filter Api For Cda
  static String cdaFilterApi(String? filter) =>
      "${baseUrl}/api/burzakh-cda/filter-requests?filter=$filter";

  // Notifications
  static String notificationsApi(userId) =>
      "${baseUrl}/api/burzakh/get-notifications/$userId";

  static String sendUserChatMessageApi =
      "${baseUrl}/api/burzakh/send-support-message";

  static String uploadAdditionalDoc(caseid) =>
      "${baseUrl}/api/burzakh/upload-addtional-document/$caseid";

  static String getCaseName = "/api/burzakh/get-case-name";

  static String updateRtaRequest = "/api/burzakh/rta/update-user";
  static String updateCdaRequest = "/api/burzakh/cda/update-user";

  static String getUserMessages(adminType, userId) =>
      "${baseUrl}/api/burzakh/get-support-messages/$userId/$adminType";

  static String dubaiGetRequests =
      "${baseUrl}/api/burzakh-mancipality/get-requests";

  static String dubaiSendMessage =
      "${baseUrl}/api/burzakh-mancipality/send-support-message";

  static String getDubaiSupportMessage(caseid) =>
      "${baseUrl}/api/burzakh-mancipality/support/messages/user/$caseid";

  // Get Ambulance
  static String getAmbulance =
      "${baseUrl}/api/burzakh-mancipality/get-ambulances";

  // Grave Assign
  static String dubaiGraveAssign(caseId) =>
      "${baseUrl}/api/burzakh-mancipality/mancipality-requests/$caseId/update-status";

  // Submit Muncipality
  static String dubaiSubmitMunicipality =
      "${baseUrl}/api/burzakh/submit-mancipality-request";

  // Dispatch Ambulance
  static String dispatchAmbulance =
      "${baseUrl}/api/burzakh-mancipality/dispatch-ambulance";

  // Cementry Casses Api
  static String cemnetryCassesApi =
      "${baseUrl}/api/burzakh-cemetery/get-requests";
  // get Active Mortcians
  static String getActiveMorticians =
      "${baseUrl}/api/burzakh-cemetery/get-active-morticians";
  // Assign Mortician
  static String assignMortician(caseId) =>
      "${baseUrl}/api/burzakh-cemetery/assign-mortician/$caseId";
  // Create Visitor Alert
  static String createVisitorAlert =
      "${baseUrl}/api/burzakh-cemetery/create-visitor-alert";

  // Remove Mortician
  static String removeMortician(morticianId) =>
      "${baseUrl}/api/burzakh-cemetery/remove-mortician/$morticianId";

  static String getAllMorticians =
      "${baseUrl}/api/burzakh-cemetery/get-morticians";

  // Mancipality Notifications
  static String getMancipalityNotifications =
      "${baseUrl}/api/burzakh-mancipality/get-notifications";

  static String ambulanceCassesList(driverid) =>
      "${baseUrl}/api/burzakh-ambulance-driver/get-cases/$driverid";

  // Todays Schedule
  static String getTodaysSchedule(driverId) =>
      "${baseUrl}/api/burzakh-ambulance-driver/get-today-schedule/$driverId";

  // Change Status
  static String changeStatus =
      "${baseUrl}/api/burzakh-ambulance-driver/change-status";

  // Update Case Status
  static String updateCaseStatus(caseId) =>
      "${baseUrl}/api/burzakh-ambulance-driver/update-case/$caseId";

  // Mortician Get Casses
  static String morticianGetCasses(morticianId) =>
      "${baseUrl}/api/burzakh-mortician/get-requests/$morticianId";

  // Mortician Change Case Status
  static String morticianChangeCaseStatus(caseId) =>
      "${baseUrl}/api/burzakh-mortician/change-case-status/$caseId";

  // Chnage Duty Status Mortician
  static String changeDutyStatusMortician(morticianId) =>
      "${baseUrl}/api/burzakh-mortician/change-status/$morticianId";

  // Visitor Alert Case Api
  static String visitorAlertCaseApi(prayerTime, day, String? cemetery) {
    String url =
        "$baseUrl/api/burzakh-visitors/alerts?prayer_time=$prayerTime&day=$day";

    if (cemetery != null && cemetery.isNotEmpty) {
      url += "&cemetery_location=$cemetery";
    }
    return url;
  }

  // Super Admin All User
  static String superAdminAllUserApi = "$baseUrl/api/burzakh-super-admin/all-users";

  // Get Super Admin login Any User
  static String superAdminLoginUserApi = "$baseUrl/api/burzakh-super-admin/login-users";
}
