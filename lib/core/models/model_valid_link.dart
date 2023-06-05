import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ModelValidLink {
  @JsonProperty(name: 'VerificationCode')
  final String verificationCode;
  ModelValidLink({required this.verificationCode});
}
