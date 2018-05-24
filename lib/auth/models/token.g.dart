// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => new Token(
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
    expiresIn: json['expires_in'] as int,
    currentUser: json['current_user'] == null
        ? null
        : new User.fromJson(json['current_user'] as Map<String, dynamic>),
    tokenType: json['token_type'] as String);

abstract class _$TokenSerializerMixin {
  String get accessToken;
  String get refreshToken;
  int get expiresIn;
  User get currentUser;
  String get tokenType;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'expires_in': expiresIn,
        'current_user': currentUser,
        'token_type': tokenType
      };
}

User _$UserFromJson(Map<String, dynamic> json) =>
    new User(id: json['id'] as String);

abstract class _$UserSerializerMixin {
  String get id;
  Map<String, dynamic> toJson() => <String, dynamic>{'id': id};
}
