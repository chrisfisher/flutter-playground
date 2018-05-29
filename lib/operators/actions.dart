import 'package:flutter_playground/api/actions.dart';

class LoadOperatorsAction extends RequestAction {}

class OperatorsNotLoadedAction extends FailureAction {}

class OperatorsLoadedAction extends SuccessAction {}

class AddOperatorAction extends RequestAction {}

class OperatorNotAddedAction extends FailureAction {}

class OperatorAddedAction extends SuccessAction {}
