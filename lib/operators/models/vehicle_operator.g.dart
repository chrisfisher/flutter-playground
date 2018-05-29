// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_operator.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

VehicleOperator _$VehicleOperatorFromJson(Map<String, dynamic> json) =>
    new VehicleOperator(
        id: json['id'] as String,
        email: json['email'] as String,
        firstName: json['first_name'] as String,
        familyName: json['family_name'] as String,
        companyName: json['company_name'] as String);

abstract class _$VehicleOperatorSerializerMixin {
  String get id;
  String get email;
  String get firstName;
  String get familyName;
  String get companyName;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'email': email,
        'first_name': firstName,
        'family_name': familyName,
        'company_name': companyName
      };
}
