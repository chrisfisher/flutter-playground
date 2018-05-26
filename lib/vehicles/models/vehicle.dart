import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle extends Object with _$VehicleSerializerMixin {
  final String id;
  final String state;
  final String type;
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
    this.type,
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
