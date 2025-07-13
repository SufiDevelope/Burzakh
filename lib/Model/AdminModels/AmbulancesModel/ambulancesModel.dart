class AmbulancesModel {
  String? message;
  Counts? counts;
  List<Ambulances>? ambulances;

  AmbulancesModel({this.message, this.counts, this.ambulances});

  AmbulancesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    counts =
        json['counts'] != null ? new Counts.fromJson(json['counts']) : null;
    if (json['ambulances'] != null) {
      ambulances = <Ambulances>[];
      json['ambulances'].forEach((v) {
        ambulances!.add(new Ambulances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.counts != null) {
      data['counts'] = this.counts!.toJson();
    }
    if (this.ambulances != null) {
      data['ambulances'] = this.ambulances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Counts {
  int? activeCount;
  int? dispatchedCount;
  int? maintenanceCount;

  Counts({this.activeCount, this.dispatchedCount, this.maintenanceCount});

  Counts.fromJson(Map<String, dynamic> json) {
    activeCount = json['Active_count'];
    dispatchedCount = json['Dispatched_count'];
    maintenanceCount = json['Maintenance_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Active_count'] = this.activeCount;
    data['Dispatched_count'] = this.dispatchedCount;
    data['Maintenance_count'] = this.maintenanceCount;
    return data;
  }
}

class Ambulances {
  int? id;
  String? driverName;
  String? vehicleNumber;
  String? currentLocation;
  String? contactNumber;
  String? cemetryName;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<DispatchedInfo>? dispatchedInfo;

  Ambulances(
      {this.id,
      this.driverName,
      this.vehicleNumber,
      this.currentLocation,
      this.contactNumber,
      this.cemetryName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.dispatchedInfo});

  Ambulances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverName = json['driver_name'];
    vehicleNumber = json['vehicle_number'];
    currentLocation = json['current_location'];
    contactNumber = json['contact_number'];
    cemetryName = json['cemetry_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['dispatch_info'] != null) {
      dispatchedInfo = <DispatchedInfo>[];
      json['dispatch_info'].forEach((v) {
        dispatchedInfo!.add(DispatchedInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver_name'] = this.driverName;
    data['vehicle_number'] = this.vehicleNumber;
    data['current_location'] = this.currentLocation;
    data['contact_number'] = this.contactNumber;
    data['cemetry_name'] = this.cemetryName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (dispatchedInfo != null) {
      data['dispatch_info'] = dispatchedInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DispatchedInfo {
  final int id;
  final String caseName;
  final String? standbyMosque;
  final String? additionalNotes;
  final int? userId;
  final String vehicleNumber;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  DispatchedInfo({
    required this.id,
    required this.caseName,
    this.standbyMosque,
    this.additionalNotes,
    this.userId,
    required this.vehicleNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DispatchedInfo.fromJson(Map<String, dynamic> json) {
    return DispatchedInfo(
      id: json['id'],
      caseName: json['case_name'],
      standbyMosque: json['standby_mosque'],
      additionalNotes: json['additional_notes'],
      userId: json['user_id'],
      vehicleNumber: json['vehicle_number'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'case_name': caseName,
      'standby_mosque': standbyMosque,
      'additional_notes': additionalNotes,
      'user_id': userId,
      'vehicle_number': vehicleNumber,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
