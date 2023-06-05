import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelChangePassword {
  @JsonProperty(name: 'Password')
  final String password;
  @JsonProperty(name: 'VerificationCode')
  final String verificationCode;

  ModelChangePassword({required this.password,required this.verificationCode});
}
