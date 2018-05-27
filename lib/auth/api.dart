import 'dart:async';
import 'package:flutter_playground/api.dart';
import 'package:flutter_playground/auth/models/token_request.dart';
import 'package:flutter_playground/auth/models/token_data.dart';

Future<TokenData> authorize(TokenRequest request) async {
  String body = encodeJson(request);
  final response = await post("oauth/token", body: body);
  final jsonObj = decodeJsonObject(response.body);
  final tokenData = TokenData.fromJson(jsonObj);
  return tokenData;
}
