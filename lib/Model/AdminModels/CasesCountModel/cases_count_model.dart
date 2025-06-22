class CassesCountModel {
  String? message;
  int? pendingCases;
  int? scheduleCallCases;
  int? approvedCasesToday;
  int? permitIssuedCases;

  CassesCountModel(
      {this.message,
      this.pendingCases,
      this.scheduleCallCases,
      this.approvedCasesToday,
      this.permitIssuedCases});

  CassesCountModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pendingCases = json['pending_cases'];
    scheduleCallCases = json['schedule_call_cases'];
    approvedCasesToday = json['approved_cases_today'];
    permitIssuedCases = json['permit_issued_cases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['pending_cases'] = this.pendingCases;
    data['schedule_call_cases'] = this.scheduleCallCases;
    data['approved_cases_today'] = this.approvedCasesToday;
    data['permit_issued_cases'] = this.permitIssuedCases;
    return data;
  }
}
