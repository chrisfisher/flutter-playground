import 'package:json_annotation/json_annotation.dart';

part 'mehicle.g.dart';

@JsonSerializable()
class Mehicle extends Object with _$MehicleSerializerMixin {
  final String id;
  final String registration;
  @JsonKey(name: 'road_user_charges')
  final String roadUserCharges;
  final String classification;
  final String odometer;

  Mehicle({
    this.id,
    this.registration,
    this.roadUserCharges,
    this.classification,
    this.odometer,
  });

  factory Mehicle.fromJson(Map<String, dynamic> json) =>
      _$MehicleFromJson(json);
}
