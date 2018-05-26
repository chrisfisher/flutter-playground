// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) =>
    new TokenRequest(
        clientId: json['client_id'] as String,
        clientSecret: json['client_secret'] as String,
        grantType: json['grant_type'] as String,
        username: json['username'] as String,
        password: json['password'] as String);

abstract class _$TokenRequestSerializerMixin {
  String get clientId;
  String get clientSecret;
  String get grantType;
  String get username;
  String get password;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': grantType,
        'username': username,
        'password': password
      };
}
