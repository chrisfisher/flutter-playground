import 'package:meta/meta.dart';

class ApiAction {
  final RequestAction request;
  final SuccessAction success;
  final FailureAction failure;
  final bool authenticated;
  final Function apiCall;
  final List apiArgs;

  ApiAction({
    @required this.request,
    @required this.success,
    @required this.failure,
    @required this.apiCall,
    this.apiArgs = const [],
    this.authenticated = false,
  });
}

class RequestAction {}

class SuccessAction {
  dynamic payload;
}

class FailureAction {
  String error;
}
