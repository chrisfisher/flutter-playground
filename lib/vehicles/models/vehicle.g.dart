// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => new Vehicle(
    id: json['id'] as String,
    type: json['type'] as String,
    odometer: json['odometer'] as int,
    registration: json['registration'] as String,
    roadCharges: json['road_user_charges'] as bool,
    state: json['state'] as String,
    description: json['description'] as String,
    operatorId: json['vehicle_operator_id'] as String,
    operatorFirstName: json['vehicle_operator_first_name'] as String,
    operatorFamilyName: json['vehicle_operator_family_name'] as String,
    operatorCompanyName: json['vehicle_operator_company_name'] as String);

abstract class _$VehicleSerializerMixin {
  String get id;
  String get state;
  String get type;
  int get odometer;
  String get registration;
  String get description;
  bool get roadCharges;
  String get operatorId;
  String get operatorFirstName;
  String get operatorFamilyName;
  String get operatorCompanyName;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    val['state'] = state;
    val['type'] = type;
    val['odometer'] = odometer;
    val['registration'] = registration;
    val['description'] = description;
    val['road_user_charges'] = roadCharges;
    val['vehicle_operator_id'] = operatorId;
    val['vehicle_operator_first_name'] = operatorFirstName;
    val['vehicle_operator_family_name'] = operatorFamilyName;
    val['vehicle_operator_company_name'] = operatorCompanyName;
    return val;
  }
}
