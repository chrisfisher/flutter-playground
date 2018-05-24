// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mehicle.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Mehicle _$MehicleFromJson(Map<String, dynamic> json) => new Mehicle(
    id: json['id'] as String,
    registration: json['registration'] as String,
    roadUserCharges: json['road_user_charges'] as String,
    classification: json['classification'] as String,
    odometer: json['odometer'] as String);

abstract class _$MehicleSerializerMixin {
  String get id;
  String get registration;
  String get roadUserCharges;
  String get classification;
  String get odometer;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'registration': registration,
        'road_user_charges': roadUserCharges,
        'classification': classification,
        'odometer': odometer
      };
}
