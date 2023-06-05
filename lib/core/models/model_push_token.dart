import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelPushToken {
  @JsonProperty(name: 'DeviceId')
  final String deviceId;

  @JsonProperty(name: 'Token')
  final String token;

  ModelPushToken({
    required this.deviceId,
    required this.token,
  });
}
