import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelForgotPassword {
  @JsonProperty(name: 'Username')
  final String userName;
  @JsonProperty(name: 'PlatformType')
  final int platformType;
  ModelForgotPassword({required this.platformType, required this.userName});
}
