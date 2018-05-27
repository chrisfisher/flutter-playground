import 'package:json_annotation/json_annotation.dart';

part 'token_data.g.dart';

@JsonSerializable()
class TokenData extends Object with _$TokenDataSerializerMixin {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'current_user')
  final User currentUser;
  @JsonKey(name: 'token_type')
  final String tokenType;

  TokenData({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.currentUser,
    this.tokenType,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  final String id;

  User({this.id});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
