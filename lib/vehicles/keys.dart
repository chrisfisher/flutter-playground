import 'package:flutter/widgets.dart';

class ScreenKeys {
  static final vehicleList = const Key('vehicleListScreen');
  static final vehicle = const Key('vehicleScreen');
}

class FormKeys {
  static final editVehicle = GlobalKey<FormState>();
}

class FieldKeys {
  static final registration = GlobalKey<FormFieldState<String>>();
  static final vehicleType = GlobalKey<FormFieldState<String>>();
  static final odometer = GlobalKey<FormFieldState<String>>();
  static final odometerRequired = GlobalKey<FormFieldState<bool>>();
}
