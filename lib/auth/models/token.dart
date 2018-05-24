import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token extends Object with _$TokenSerializerMixin {
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

  Token({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.currentUser,
    this.tokenType,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  final String id;

  User({this.id});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// {
//     "access_token": "0a7f6932-b3c5-45e5-aae0-8df767c36789",
//     "refresh_token": "7422e805-f7fe-47fa-b863-6216224bc5e7",
//     "expires_in": 604800,
//     "current_user": {
//         "id": "27e04180-2843-409f-ad5e-e9fdee29d298"
//     },
//     "token_type": "Bearer"
// }
