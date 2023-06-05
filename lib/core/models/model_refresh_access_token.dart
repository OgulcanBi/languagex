import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelRefreshAccessToken {
  @JsonProperty(name: 'RefreshToken')
  final String refreshToken;

  @JsonProperty(name: 'AccessToken')
  final String accessToken;

  ModelRefreshAccessToken({required this.refreshToken, required this.accessToken});
}
