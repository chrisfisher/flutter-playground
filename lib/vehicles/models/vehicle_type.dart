import 'package:flutter/foundation.dart';
import 'package:flutter_playground/shared/models.dart';

class VehicleType implements MenuItem {
  final String id;
  final String title;

  VehicleType({
    @required this.id,
    @required this.title,
  });
}
