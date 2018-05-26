import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle extends Object with _$VehicleSerializerMixin {
  final String id;
  final String state;
  final int odometer;
  final String registration;
  final String description;
  @JsonKey(name: 'road_user_charges')
  final bool roadUserCharges;
  @JsonKey(name: 'vehicle_operator_id')
  final String operatorId;
  @JsonKey(name: 'vehicle_operator_first_name')
  final String operatorFirstName;
  @JsonKey(name: 'vehicle_operator_family_name')
  final String operatorFamilyName;
  @JsonKey(name: 'vehicle_operator_company_name')
  final String operatorCompanyName;

  Vehicle({
    this.id,
    this.state,
    this.odometer,
    this.registration,
    this.description,
    this.roadUserCharges,
    this.operatorId,
    this.operatorFirstName,
    this.operatorFamilyName,
    this.operatorCompanyName,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}

// {
//         "id": "67c9409f-85d1-4977-886c-64dcd53416b3",
//         "state": "active",
//         "odometer": 100000,
//         "type": "heavy_motor",
//         "registration": "BIG007",
//         "description": "BIG007 HEAVYMOTOR",
//         "road_user_charges": true,
//         "vehicle_operator_id": "59ed7188-4389-476b-849c-48ac85318967",
//         "vehicle_operator_first_name": "Duncan",
//         "vehicle_operator_family_name": "Donahugh",
//         "vehicle_operator_company_name": ""
//     },
