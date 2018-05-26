import 'package:json_annotation/json_annotation.dart';

part 'token_request.g.dart';

@JsonSerializable()
class TokenRequest extends Object with _$TokenRequestSerializerMixin {
  @JsonKey(name: 'client_id')
  final String clientId;
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @JsonKey(name: 'grant_type')
  final String grantType;
  final String username;
  final String password;

  TokenRequest({
    this.clientId,
    this.clientSecret,
    this.grantType,
    this.username,
    this.password,
  });

  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRequestFromJson(json);
}

// {
// "client_id":"ccb40da5-0dc8-440e-b69a-fa4082f1883d",
// "client_secret":"83ef5537-a664-46b9-8837-2d01c1669e15",
// "grant_type":"password",
// "username":"duncan@employed.com",
// "password":"password"
// }
