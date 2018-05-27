import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle extends Object with _$VehicleSerializerMixin {
  @JsonKey(includeIfNull: false)
  final String id;
  final String state;
  final String type;
  final int odometer;
  final String registration;
  final String description;
  @JsonKey(name: 'road_user_charges')
  final bool roadCharges;
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
    this.type,
    this.odometer,
    this.registration,
    this.roadCharges,
    this.state,
    this.description,
    this.operatorId,
    this.operatorFirstName,
    this.operatorFamilyName,
    this.operatorCompanyName,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Vehicle copyWith({
    String type,
    String registration,
    int odometer,
    bool roadCharges,
    String operatorId,
  }) =>
      Vehicle(
        type: type != null ? type : this.type,
        registration: registration != null ? registration : this.registration,
        odometer: odometer != null ? odometer : this.odometer,
        roadCharges: roadCharges != null ? roadCharges : this.roadCharges,
        operatorId: operatorId != null ? operatorId : this.operatorId,
        id: this.id,
        state: this.state,
        description: this.description,
        operatorFirstName: this.operatorFirstName,
        operatorFamilyName: this.operatorFamilyName,
        operatorCompanyName: this.operatorCompanyName,
      );
}
