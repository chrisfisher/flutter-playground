import 'package:flutter_playground/models.dart';

String getAccessToken(AppState state) =>
    state.auth.tokenData != null ? state.auth.tokenData.accessToken : null;
