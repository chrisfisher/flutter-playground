// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => new Vehicle(
    id: json['id'] as String,
    state: json['state'] as String,
    type: json['type'] as String,
    odometer: json['odometer'] as int,
    registration: json['registration'] as String,
    description: json['description'] as String,
    roadUserCharges: json['road_user_charges'] as bool,
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
  bool get roadUserCharges;
  String get operatorId;
  String get operatorFirstName;
  String get operatorFamilyName;
  String get operatorCompanyName;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'state': state,
        'type': type,
        'odometer': odometer,
        'registration': registration,
        'description': description,
        'road_user_charges': roadUserCharges,
        'vehicle_operator_id': operatorId,
        'vehicle_operator_first_name': operatorFirstName,
        'vehicle_operator_family_name': operatorFamilyName,
        'vehicle_operator_company_name': operatorCompanyName
      };
}
