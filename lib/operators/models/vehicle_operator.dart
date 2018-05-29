import 'package:json_annotation/json_annotation.dart';

part 'vehicle_operator.g.dart';

@JsonSerializable()
class VehicleOperator extends Object with _$VehicleOperatorSerializerMixin {
  final String id;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'family_name')
  final String familyName;
  @JsonKey(name: 'company_name')
  final String companyName;

  VehicleOperator({
    this.id,
    this.email,
    this.firstName,
    this.familyName,
    this.companyName,
  });

  factory VehicleOperator.fromJson(Map<String, dynamic> json) =>
      _$VehicleOperatorFromJson(json);

  VehicleOperator copyWith({
    String email,
    String firstName,
    String familyName,
    String companyName,
  }) =>
      VehicleOperator(
        id: this.id,
        email: email != null ? email : this.email,
        firstName: firstName != null ? firstName : this.firstName,
        familyName: familyName != null ? familyName : this.familyName,
        companyName: companyName != null ? companyName : this.companyName,
      );
}
