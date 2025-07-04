class AmbulancesModel {
  String? message;
  List<Ambulances>? ambulances;

  AmbulancesModel({this.message, this.ambulances});

  AmbulancesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['Ambulances'] != null) {
      ambulances = <Ambulances>[];
      json['Ambulances'].forEach((v) {
        ambulances!.add(new Ambulances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.ambulances != null) {
      data['Ambulances'] = this.ambulances!.map((v) => v.toJson()).toList();
    }
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

  Ambulances(
      {this.id,
      this.driverName,
      this.vehicleNumber,
      this.currentLocation,
      this.contactNumber,
      this.cemetryName,
      this.status,
      this.createdAt,
      this.updatedAt});

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
    return data;
  }
}
