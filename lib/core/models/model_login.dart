import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelLogin {
  @JsonProperty(name: 'Username')
  final String username;

  @JsonProperty(name: 'Password')
  final String password;

  ModelLogin({
    required this.username,
    required this.password,
  });
}
