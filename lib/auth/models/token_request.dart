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
