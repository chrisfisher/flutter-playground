import 'package:redux/redux.dart';
import 'package:flutter_playground/api/actions.dart';
import 'package:flutter_playground/models.dart';
import 'package:flutter_playground/auth/selectors.dart';

void apiMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) async {
  if (action is ApiAction) {
    next(action.request);
    try {
      final String accessToken = getAccessToken(store.state);
      List<dynamic> args = [accessToken]..addAll(action.apiArgs);
      final dynamic payload = await Function.apply(action.apiCall, args);
      action.success.payload = payload;
      next(action.success);
    } catch (e) {
      action.failure.error = e.toString();
      next(action.failure);
    }
  } else {
    next(action);
  }
}
