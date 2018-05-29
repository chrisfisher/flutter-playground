import 'package:flutter/widgets.dart';

class ScreenKeys {
  static final vehicleOperatorList = const Key('operatorListScreen');
  static final vehicleOperator = const Key('operatorScreen');
}

class FormKeys {
  static final addOperator = GlobalKey<FormState>();
}

class FieldKeys {
  static final email = GlobalKey<FormFieldState<String>>();
  static final firstName = GlobalKey<FormFieldState<String>>();
  static final familyName = GlobalKey<FormFieldState<String>>();
  static final companyName = GlobalKey<FormFieldState<String>>();
}
